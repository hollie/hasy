#! /usr/bin/env perl -w

#########################################################################
# Script to query and parse sensor readings from the sensorhub
#
# Currently supports onewire devices, SHT humidity sensors
#
# Lieven Hollevoet, 2009
#########################################################################

use strict;
use POSIX;
use RRDs;
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
print $socket "?\r\n";

# Read sensor values, with a timeout of 10 seconds
my $report = read_socket(5);

# Close the socket
close_socket();
#my $report = "OneWire 00000001 0012\nOneWire 00000002 0013\n";

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
	
	# Extract OneWire 
	while ($report =~ /OneWire\s+([0-9A-F]{16})\s+-\s+([0-9A-F]{4})/g){
		# Store result in RRD database ($id, $value)
		process_onewire($1, $2);		
	}
	
	# Extract SHTxx
	while ($report =~ /SHTxx T: (-?\d+.\d) C RH: (-?\d+.\d) DewPt:\s+(-?\d+.\d) C/g){
		process_sht($1, $2, $3);
	}
	
	# Extract Wireless sensors
	while ($report =~ /Node (\d):\s+([0-9A-F]{2})\s+([0-9A-F]{2})\s+([0-9A-F]{2})\s+/g){
		process_wireless($1, $2, $3, $4, $5);
	}	
	
	 
}

# Store reading from OneWire sensor in the RRD database defined in the config hash
sub process_onewire {
	my $id    = shift();
	my $value = shift();
	
	# Convert temperature, this can be different depending on the family id
	my $temperature = 0;
	
	if ($id =~ /^10/) {
		$temperature = hex($value) / 2;
	} else {
		print "Unknown sensor family ID, add temperature conversion formula to this script!";
		return;
	}
	
	# Fetch the database name
	my $db;
	
	if (exists($config->{onewire}->{node}->{$id})){
		$db = $config->{onewire}->{node}->{$id}->{db};
	} else {
		print("Unknown OneWire sensor $id reports $temperature degrees\n");
		return;
	}
	
	# Add value to the database
	print("Storing TEMP: $temperature degrees in database '$db'\n");
	
	# Store in RRD database
	RRDs::update($db,"N:$temperature");
	my $err = RRDs::error;
	die "Error while updating $db: $err\n" if $err;
	
	return;
	
}

sub process_sht {
	my $temp  = shift();
	my $humi  = shift();
	my $dewpt = shift();
	
	print "Read SHT sensor with: $temp degrees, RH $humi %, dewpt $dewpt degrees\n";
	
	my $db = $config->{sht}->{node}->{db};
	
	print("Storing RHUMI: $temp degrees, RH $humi %, dewpt $dewpt degrees in database '$db'\n");
	
	# Store in RRD database
	RRDs::update($db,"N:$temp:$humi:$dewpt");
	my $err = RRDs::error;
	die "Error while updating $db: $err\n" if $err;
	
	return;	
}

sub process_wireless {
	my $id = shift();
	my $solar_adc   = shift();
	my $vcc_adc     = shift();
	my $temp_adc    = shift();
	
	if ($temp_adc eq "00" and $vcc_adc eq "00" and $solar_adc eq "00") {
		print "Gateway has not received a value yet, returning...\n";
		return;
	}
	
	# Cover cases where the sensornode has not received a value for the Vcc yet
	# If we don't do this, we get a division by zero exception later
	if ($vcc_adc eq "00") {$vcc_adc = 255};
	
	my $db = $config->{wireless}->{node}->{db};
	
	my $temperature = ((hex($temp_adc) / 255 * 2.5) - .6) * 100;
	
	# Convert solar/vcc to voltage values
	my $solar = hex($solar_adc) * 5 / 255;
	my $vcc   = 2.5 * 255 / hex($vcc_adc);
	
	printf ("Storing WRLS: solar %.2fV, vcc %.2fV, temp %.1fC in database '$db'\n", $solar, $vcc, $temperature);
	
	# Store in RRD database
	RRDs::update($db,"N:$solar:$vcc:$temperature");
	my $err = RRDs::error;
	die "Error while updating $db: $err\n" if $err;
	
	return;
}

###############################################################
## dec2hex
#   Convert dec number into hex string
###############################################################
sub dec2hex {
    my $dec  = shift();
    my $fill = shift();

    my $fmt_string;

    if (defined($fill)){
	$fmt_string = "%0" . $fill . "X";
    } else {
	$fmt_string = "%02X";
    }
    return sprintf($fmt_string, $dec );
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


