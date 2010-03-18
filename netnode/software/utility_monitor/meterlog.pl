#!/usr/bin/env perl -w

#########################################################################
# Script to query and monitor the utility meter monitor node
#
# The node sends xPL messages over the network, and is queried once 
# every 15 minutes. 
#
# An xpl-cmd message is sent for both the water and the gas sensor,
# and the resulting xpl-stat messages are parsed and sent into an 
# RRD database.
#
# Lieven Hollevoet, 2010
#########################################################################

use strict;
use xPL::Client;
use RRDs;

use Data::Dumper;

# Settings
my $vendor_id = 'hollie';                # xPL vendor id of this program
my $device_id = 'meterlog';              # xPL device id of this program
my $target    = 'hollie-utilmon.meter';  # Target device name
my $interval  = 15*60;                   # Time in seconds between two queries.

# Create xPL object
my $xpl=xPL::Client->new ( vendor_id => $vendor_id, device_id => $device_id );

# When a message is received, this function will be called
$xpl->add_xpl_callback(id => "xpl",
                       self_skip => 1, targetted => 0,
                       callback => \&parse_response);
                       
# Query the meter every $interval seconds
$xpl->add_timer(id => "query_meter", timeout => $interval, callback => \&query_meter);


# Run the main loop
$xpl->main_loop();


# Query the meter device
sub query_meter {
	print the_date() . "Sending our query packets\n";
	query_sensor('water');
	sleep(1);
	query_sensor('gas');
}

# Create a query string on a single sensor of the meter device
sub query_sensor {
	my $device = shift();
	$xpl->send_from_string("-t $target -m xpl-cmnd -c sensor.request command=current device=$device")
}

# Parse the incoming response messages
sub parse_response {

  	my %p = @_;
  	my $msg = $p{message};
  	my $peeraddr = $p{peeraddr};
 	my $peerport = $p{peerport};
  	my $time = time;
  	my $c = chr(0);

	#print Dumper($msg);
	
	if ($msg->message_type eq "xpl-stat" && $msg->class eq "sensor" && $msg->class_type eq "basic" &&
    	$msg->device && $msg->type eq "count") {
      	#print "Received count for " . $msg->device . " : " . $msg->current . "\n";
      	publish_reading($msg->device, $msg->current);
	}	

}

# Publish a response to a RRD database
sub publish_reading {
	
	my $device = shift();
	my $value  = shift();
	
	print (the_date());
	print ("Sensor $device got $value ticks\n");
	
	RRDs::update($device . '.rrd', "N:$value");
	my $err = RRDs::error;
	die "Error while updating $device rrd: $err\n" if $err;
	
	return;
}


# Returns the date.
sub the_date {
    my ($second, $minute, $hour, $dayOfMonth, $month, $yearOffset, $dayOfWeek, $dayOfYear, $daylightSavings) = localtime();
    my $year = 1900 + $yearOffset;
    my $hms  = sprintf("%02i:%02i:%02i", $hour, $minute, $second);
    my $ymd  = sprintf("%04i%02i%02i", $year, $month, $dayOfMonth);
    my $theTime = "[$ymd $hms] ";
    return $theTime;
}