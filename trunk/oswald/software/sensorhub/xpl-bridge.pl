#! /usr/bin/env perl

use strict;
use RRDs;
use Data::Dumper;
use XML::Simple;
use xPL::Client;

# Settings
my $vendor_id   = 'hollie';                # xPL vendor id of this program
my $device_id   = 'sensehub';              # xPL device id of this program
my $target      = 'mhouse-mh.misterhouse'; # Target device name
my $interval    = -60;                     # Time in seconds between two queries of the database files.
my $report_freq = 10;				       # Every sensor value is sent after $report_freq intervals when the value has not changed


# Global variables
my $config;
my $livedata;
my $debug = 0;

# Read configuration settings (map of all available sensors)
get_config();

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
	fetch_livedata();
	
	# Check if we need to broadcast new values
	# A new value is sent whenever the value changes, or after  passes through this loop.
	my $sensor;
	foreach $sensor (keys %$livedata){
		my $shash = $livedata->{$sensor};
		
		if ($shash->{'bcast_timer'} < 1){
			print "Sending $sensor value: $shash->{'value'}\n";
			$livedata->{$sensor}{'bcast_timer'} = $report_freq;
			$xpl->send_from_string("-t $target -m xpl-stat -c sensor.basic device=$sensor type=temp current=$shash->{'value'}");
			sleep(1);
			}
	}	
	print Dumper($livedata) if $debug;
	
	print "Done!\n";
	
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

sub fetch_livedata {
	
	my $sensor;
	my $dbname;
	my $sensorname;
	my $sensorvalue;
	
	foreach $sensor ( keys %{$config->{'onewire'}{'node'}} ){
		# Get database name and sensor name
		$dbname = $config->{'onewire'}{'node'}{$sensor}{'db'};
		if ($dbname =~ /\/(\w+).rrd/) { $sensorname = $1; } else { $sensorname = 'undefined'};
		
		# Get the last value from the database
		my $data = RRDs::info($dbname);
		my $err=RRDs::error;
		if ($err) {print "Problem fetching the info from $dbname: $err\n";}
     
     	$sensorvalue = $data->{'ds[temperature].last_ds'};
     	
     	# Push name/value pair in live hash, and check if it needs a broadcast of the value
     	if (!defined($livedata->{$sensorname}) || ($livedata->{$sensorname}{'value'} != $sensorvalue)){
     		$livedata->{$sensorname}{'bcast_timer'} = 0;
     	} else {
     		$livedata->{$sensorname}{'bcast_timer'} -= 1;     	
     	}
     	$livedata->{$sensorname}{'value'} = $sensorvalue;
	}
	
	#print Dumper($livedata) if $debug;
}
