#! /usr/bin/perl -w

# Script to scrape live temperature/dewpoint readings from 
# the metar report of an airport.
#
# Original code found in the infobot source tree.
#
# Lieven Hollevoet, 2006

use lib qw( /opt/lib/perl );
use LWP::UserAgent;
use HTML::Entities;
use RRDs;

my $site_id = 'EBOS';
my $metar_url = "http://weather.noaa.gov/cgi-bin/mgetmetar.pl?cccc=$site_id";
	
# Grab METAR report from Web.   
my $agent = new LWP::UserAgent;
$agent->timeout(10);
my $grab = new HTTP::Request GET => $metar_url;

my $reply = $agent->request($grab);

# extract METAR from incredibly and painfully verbose webpage
my $webdata = $reply->as_string;
$webdata =~ m/($site_id\s\d+Z.*?)</s;    
my $metar = $1;                       
$metar =~ s/\n//gm;
$metar =~ s/\s+/ /g;

my $ebos_temp;
my $ebos_dew; 

if ($metar =~ /\s(M?\d{2})\/(M?\d{2})\s/){
    $ebos_temp = $1;
    $ebos_dew  = $2;
}

#print "temp -$ebos_temp-\n";

$ebos_temp =~ s/M/-/;
$ebos_dew  =~ s/M/-/;
#print "temp -$ebos_temp-\n";

print "METAR info for $site_id: $metar\n";
print "EBOS temp  = $ebos_temp degrees C\n";
print "EBOS dewpt = $ebos_dew degrees C\n";

if (defined $ebos_temp && defined $ebos_dew){
  RRDs::update("ventilatie/ebos.rrd","N:$ebos_temp:$ebos_dew");
    my $err = RRDs::error;
    die "Error while updating temp.rrd: $err\n" if $err;
}
