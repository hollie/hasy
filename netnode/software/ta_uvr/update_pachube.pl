#! /usr/bin/env perl -w

#########################################################################

#########################################################################
#use lib qw( /opt/lib/perl );

use strict;
use RRDs;

use Data::Dumper;


# Global variables
my $global;            # Program settings
my $version = 0.1;

print &the_date;


########################## MAIN PROGRAM ##########################

# Read the config files and possibly add command line parameters
$global->{verbose} = 0;

my $rrd_name = "solar";

my ($start,$step,$names,$data) = RRDs::fetch ("solar.rrd", "AVERAGE", "-r", "900", "-s", "now-1h", "-e", "now");
my $ERR=RRDs::error;
die "ERROR while fetching: $ERR\n" if $ERR;

#print "$start - $step\n";
#print Dumper($names);
#print Dumper($data);
my $temp_array = $$data[4];
if (defined($$temp_array[3])){
	my $temperature_top = (int($$temp_array[3]*10))/10;
	my $temperature_bottom = (int($$temp_array[1]*10))/10;
	my $temperature_panels = (int($$temp_array[0]*10))/10;
	my $pump            = (int($$temp_array[4]*10))/10;
	my $rep_string = "$temperature_top,$temperature_bottom,$temperature_panels,$pump";
	print "Report to Pachube is: $rep_string\n";
	# Post to pachube
	system('/usr/bin/curl --silent --request PUT --header "X-PachubeApiKey: 0e180572f2b76956ba2305f7173892b6bdbe2397e9277abbb80ae9c8aa523" --data "' . $rep_string . '" "http://www.pachube.com/api/1536.csv"');
}

exit(0);


# Returns the date. Used to put a timestamp to the XML file.
sub the_date() {
    my ($second, $minute, $hour, $dayOfMonth, $month, $yearOffset, $dayOfWeek, $dayOfYear, $daylightSavings) = localtime();
    my $year = 1900 + $yearOffset;
    my $hms  = sprintf("%02i:%02i:%02i", $hour, $minute, $second);
    my $ymd  = sprintf("%04i%02i%02i", $year, $month, $dayOfMonth);
    my $theTime = "[$ymd $hms] ";
    return $theTime;
}
