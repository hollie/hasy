#! /usr/bin/perl -w

#########################################################################
# Script to query and parse sensor readings from the PV monitor
#
# Lieven Hollevoet, 2009
#########################################################################
use lib qw( /opt/lib/perl );

use strict;
use POSIX;
#use RRDs;
use XML::Simple;

use Data::Dumper;

use Getopt::Std;

use IO::Socket;
use Net::hostent; 

# Register ALARM signal
$SIG{ALRM} = sub { die "timeout" };

# Global variables
my $config;
my $socket;

########################## MAIN PROGRAM ##########################

# Read the config file
get_config();

# Connect to the remote device
open_socket($config->{hostname}, $config->{hostport});

# Request report
print $socket $config->{command};

# Read sensor values, with a timeout of 10 seconds
my $report = read_socket(5);

# Close the socket
close_socket();

# Parse
parse_report($report);



########################## SUBROUTINES  ##########################
# Read configuration settings from XML file
sub get_config {
	# Read the XML config file
	my $xml = new XML::Simple(keyattr => ['id'], ForceArray => '0', NormaliseSpace => '2');
    $config = $xml->XMLin("config.xml");
	#print Dumper($config);
	
}

# Parse the response of the sensorhub
sub parse_report {
	my $report = shift();
	
	#print "Parsing report:\n$report\n";
	
	# Extract number of Watt-hours
	while ($report =~ /Watt-hours\s+([0-9A-F]{4})/g){
	    # Store result in RRD database ($value)\
	    process_report($1);
	}
	
}

# Store the number of Watt-hours in the RRD database defined in the config hash
sub process_report {

	my $value = shift();
	my $watt_hours = 0;

	# Convert value to int
	$watt_hours = hex($value);
	
	# Fetch the database name
	my $db;
	
	# Add value to the database
	print("Production: $watt_hours Watt-hours sine last read\n");
	
	return;
	
}

###############################################################
## clean_and_exit
#   Shutdown cleanly
###############################################################
sub clean_and_exit {
    &close_port();    
    exit 0;
}

###############################################################
## error
#   Signal error and exit
###############################################################
sub error {
    my $data = shift();
    print $data;
    &close_port();
    exit 1;
}

# Returns the date.
sub the_date {
    my ($second, $minute, $hour, $dayOfMonth, $month, $yearOffset, $dayOfWeek, $dayOfYear, $daylightSavings) = localtime();
    my $year = 1900 + $yearOffset;
    my $hms  = sprintf("%02i:%02i:%02i", $hour, $minute, $second);
    my $ymd  = sprintf("%04i%02i%02i", $year, $month, $dayOfMonth);
    my $theTime = "[$ymd $hms]\n";
    return $theTime;
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

	#print "Opening socket to '$client_host' on port '$client_port'...\n";
	
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


