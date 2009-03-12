#! /usr/bin/perl -w

# Control blinds script
#
# This script is the main control script for the sunblinds.
# It does the following: 
#  * firstly it tries to read the ambient light level from
#    the wireless sensor gateway (that received light level values from the sensor
#    in the garden)
#  * if the gateway is not responding or the sensor in not transmitting 
#    values in the last measurement interval, the script reverts to 
#    'calculated' sunrise/sunset times that are read from an XML file.
#    That file is generated by the 'write_blind_control_setting.pl' script
# 
# Every time the script is run, it compared the 'wanted' state with the last
# commanded state (read from the status file called 'last_command.txt').
#
# It is the idea to call this script once every minute. It is however safe to run the script
# less frequently. This is covered by comparing the most recent command with the command
# stored in the status file. If both commands don't match, an update is sent to the
# blind controller. This also covers cases when e.g. the network or the server went down:
# if sending a command to the blind controller fails, the status file is not updated so 
# that the command will be resent the next time the script is run.
#
# L. Hollevoet, 2007.
use strict;

use XML::Simple;
use IO::Socket;
use Net::hostent; 

# Register ALARM signal
$SIG{ALRM} = sub { die "timeout" };

# Settings
my $gateway_host = 'oswald-03';			# Host on the network that has light level values
my $gateway_port = '10001';				# Port to connect to
my $state_file   = 'last_command.txt';	# File where the last sent command has been sent to
my $blinds_host  = 'netnode02';			# Host on the network that controls the blinds
my $blinds_port  = '10001';				# Port to connect to on the blind controller

# Global variables
my $next_command;
my $socket = 0;

# First try to get and parse the ambient light level from the garden sensor
open_socket($gateway_host, $gateway_port); # Open the socket with possibility to retry if the target port is in use (can happen on the Lantronix XPORT)
$socket->send("?\r");
my $response = read_socket(10);

# Close the socket again, we don't need it anymore
close_socket();



# Determine the command to send, either based on sensor readings (if valid), or on calculated value
if (sensor_value_valid($response)){
    $next_command = parse_sensor_report($response);
} else {
    $next_command = determine_calculated_command();
}



# Get the last command we sent to the blind controller
my $last_command = get_last_command($state_file);

# If the command and the status file don't match, update!
if ($last_command ne $next_command){
	my $cmd_time = get_current_time();
	
	print "[$cmd_time] New command '$next_command' sent to blinds.\n";
	
	# Send it to the blind controller
	if (command_blinds($next_command)){
		save_last_command($state_file, $next_command);
	}
} else {
	#print "[$current_time] No action taken, blinds already in position\n";
}

exit(0);

############################################################################
# Subroutines
################

#
# Blind controller related
#
sub command_blinds  {
	my $blind_command = shift();
		
	# Open the socket to send the command
	open_socket($blinds_host, $blinds_port);
	
	$socket->send($blind_command);
	
	close_socket();

	return 1;						
}

#
# Program helper functions
#

## Retrieve the last command sent to the blind controller from this script
sub get_last_command {
	
	# Get filename
	my $filename = shift();
	
	# Default assignment of the last command
	my $last_command = '?';
	if (open (STATUS, $filename) ){
		$last_command = <STATUS>;
		chomp($last_command);
	} else {
		print "Could not open last command file, creating new one...\n";
	};
	
	close(STATUS);
	
	return $last_command;
}

## Save the last command sent to the blind controller from this script
sub save_last_command {
	
	# Get filename and last command
	my $filename = shift();
	my $last_command = shift();
	
	open (STATUS, ">", $filename) or (die "Could not open state file for output: $!");
	
	print STATUS "$last_command";
	
	close (STATUS);
	
	return;
}	


######## Wireless gateway related routines



###############################################################
## handle_timeout
#   Close everything and exit if we have a timeout
###############################################################
sub handle_timeout {
    &close_socket();
    &error("Timeout while waiting for data from host! Check the server\n");
}




###############################################################
## clean_and_exit
#   Shutdown cleanly
###############################################################
sub clean_and_exit {
    &close_socket();    
    exit 0;
}

###############################################################
## error
#   Signal error and exit
###############################################################
sub error {
    my $data = shift();
    print $data;
    &close_socket();
    exit 1;
}

###############################################################
## close_socket
#   Close the socket
###############################################################
sub close_socket {
    if (defined $socket){
	$socket->close();
    }    
}

###############################################################
## open_socket(host, port)
#   Try to open a TCP session to 'host' on 'port'.
#   Retry if the server is not available, timeout after 
#   10 tries with 1 second sleep.
###############################################################
sub open_socket {

	# Read input parameters
    my $client_host = shift(); 
    my $client_port = shift();

    # Connect to the remote device 
    # create a tcp connection to the specified host and port
    my ($kidpid, $handle, $line);

    my $timeout = 0;

    while () {
        if ($socket = IO::Socket::INET->new(Proto     => "tcp",
					PeerAddr  => $client_host,
					PeerPort  => $client_port,
					Type      => SOCK_STREAM)){
	   		last;
        } else {
	   		print "Waiting for server to become available...\n";
	   		$timeout++;
	   		if ($timeout == 10){
	     		die "Server not available for 10 seconds, exit...\n";
	   		}
	   
	  		sleep 1;
        }
    }
    
}

###############################################################
## read_socket(timeout)
#   Reads data from the socket interface. Times out if nothing is
#   received after <timeout> seconds.
###############################################################
sub read_socket {
    my $timeout = shift();

    my @numresult;
    my $result;

    eval {
	# Set alarm
	alarm($timeout);

	# Execute receive code
	my $waiting = 1;
	$result = "";
	my $res = "";
	while ($waiting){

	    # Read reply
	    ($socket->recv($res, 32));
	    $result .= $res;
	    if (($result =~ /EOT/)) {
		$waiting = 0;
	    }
	}
	
	# Clear alarm
	alarm(0);
    };

    # Check what happened in the eval loop
    if ($@) {
	if ($@ =~ /timeout/) {
	    # Oops, we had a timeout
	    print "Received up to now: $result";
		close_socket();
		die "Response not received in time! Exit...";
	} else {
	    # Oops, we died
	    alarm(0);           # clear the still-pending alarm
	    die;                # propagate unexpected exception
	} 
	
    } 

    # We get here if the eval exited normally
    #@numresult = &parse_response($result);
	return $result;
	
}

sub sensor_value_valid {
	my $data = shift();
	my $result_age;
	
	if ($data =~ /Node 1: [0-9A-F]{2} [0-9A-F]{2} [0-9A-F]{2} ([0-9A-F]{2})/) { $result_age = $1;}
	
	# Convert to decimal
	my $age_dec = hex($result_age);
	
	# If age < 0xF0 then we assume we have a 'fresh' report waiting
	if ($age_dec < 0xF0){
		return 1;
	} else {
		return 0;
	}
	
}

###############################################################
## parse_and_report(response)
# Parse the returned string and determine the next command
###############################################################
sub parse_sensor_report {

	my $data = shift();
	
	my $hex1;
	
	# Extract values
	if ($data =~ /Node 1: ([0-9A-F]{2}) /) { $hex1 = $1}
	
	# Convert to decimal
	my $solar = hex($hex1);

	my $command;
	
	# If level goes > 20: send first up
	#               > 40: send second up
	#               < 15: send down
	if ($solar > 20 && $solar < 40){
		$command = 'u1';
	} elsif ( $solar > 40 ) {
		$command = 'u2';
	} else {
		$command = 'd';
	}

	return $command;
}

###############################################################
## determine_calculated_command()
# Get the command that should be sent according to the 
# calculation script, only used as a fallback
###############################################################
sub determine_calculated_command {

	# Read the XML config file
	my $xml = new XML::Simple(keyattr => ['time']);

	my $config = $xml->XMLin("blind_settings_today.xml");

    my $current_time = get_current_time();
    
	# Determine the command that is valid now according to the script
	my $lastmatch;

	foreach (sort keys %{$config->{command}}){
		my $compare_time = $_;
		# Determine the last command
		if ($current_time ge $compare_time){
			$lastmatch = $compare_time;		
		}
	}
 
	# Get the actual command of the last programmed command (up or down)
	my $lastmatch_command = $config->{command}->{$lastmatch}->{direction};
	
	return $lastmatch_command;
}

sub get_current_time {
	
	# Get the local time
	my ($sec, $min, $hour) = localtime(time);

	# Make sure to append a '0' if required, this is done so that the
	# time is easily readible/comparable
	my $minutes = $min > 9 ? "$min" : "0$min"; 
	my $hours = $hour > 9 ? "$hour" : "0$hour";

	my $current_time = $hours . ':' . $minutes;
	
	return $current_time;
	
	
}