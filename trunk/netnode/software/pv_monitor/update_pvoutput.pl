#! /opt/local/bin/perl -w

#########################################################################
# Script to upload the PV status to pvoutput.org
#
# Lieven Hollevoet, 2011
#########################################################################

use strict;
use POSIX;

# PVOutput Settings
$system_id = '2358';
$api_key   = '90834250489189201734971078964523479120875';
 
# Get the production of today
my $production = `./update_zonnestroomopbrengst.pl pvoutput`;

#print "Production today is : $production Wh\n";

if ($production == 0) {
  print "PVoutput result not posted, no production yet\n";
  exit(0);
}

# Get the date and time for the request
my ($second, $minute, $hour, $dayOfMonth, $month, $yearOffset, $dayOfWeek, $dayOfYear, $daylightSavings) = localtime();
my $year = 1900 + $yearOffset;
# Convert to nicely formatted strings
my $hm  = sprintf("%02i:%02i", $hour, $minute);
my $ymd  = sprintf("%04i%02i%02i", $year, $month+1, $dayOfMonth);

my $command = "curl -s -d \"d=$ymd\" -d \"t=$hm\" -d\"v1=$production\" -H \"X-Pvoutput-Apikey: $api_key\" -H \"X-Pvoutput-SystemId: $system_id\" http://pvoutput.org/service/r2/addstatus.jsp\n";
#print "Sending: $command\n";

my $post_result = `$command`;

print "PVoutput curl response: $post_result\n";
