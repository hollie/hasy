#! /usr/bin/env perl

use strict;
use RRDs;
use Data::Dumper;
use XML::Simple;
use xPL::Client;

# Settings
my $vendor_id = 'hollie';                # xPL vendor id of this program
my $device_id = 'sensrhub';              # xPL device id of this program
my $target    = 'hollie-utilmon.meter';  					 # Target device name
my $interval  = 5;                   # Time in seconds between two queries of the database files.


# Global variables
my $config;
my $livedata;
my $debug = 1;

# Read configuration settings (map of all available sensors)
# get_config();

# Create xPL object
my $xpl=xPL::Client->new ( vendor_id => $vendor_id, device_id => $device_id );

# When a message is received, this function will be called
# $xpl->add_xpl_callback(id => "xpl",
#                       self_skip => 1, targetted => 0,
#                       callback => \&parse_response);
                       
# Query the meter every $interval seconds
$xpl->add_timer(id => "query_database", timeout => $interval, callback => \&query_database);

# Run the main loop
$xpl->main_loop();

exit(0);

# Query the meter device
sub query_database {
	print the_date() . "Fetching data from RRD databases\n";
	
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


########################## SUBROUTINES  ##########################
# Read configuration settings from XML file
sub get_config {
	# Read the XML config file
	my $xml = new XML::Simple(keyattr => ['id'], ForceArray => '0', NormaliseSpace => '2');
    $config = $xml->XMLin("config.xml");
	#print Dumper($config);
	$xml=undef;
}

