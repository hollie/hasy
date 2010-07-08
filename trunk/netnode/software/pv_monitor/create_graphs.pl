#! /usr/bin/env perl -w

use strict;

use RRDs;
use Net::FTP;

my $db_folder = ".";
my $pv        = "$db_folder/pv.rrd";

my $host    ="ftp.lika.be";
my $ftp_user = "stats\@lika.be";
my $ftp_password;

# Get the FTP password from the command line
if (defined($ARGV[0])){
	$ftp_password = $ARGV[0];	
} else {
	die "Please pass the ftp password as command line argument!\n";
}


##################################################################
## Main program code
##################################################################
my $err;

# Create the graphs
RRDs::graph "pv_days.png",
    #"--end", "now",
    "--start", "end-2days",
	"--title", "Productie PV installatie voorbije dagen", 
    "--vertical-label", "W",
    config_string(),
    "DEF:whly=$pv:watthour:MAX:end=now-1m:start=end-2d",
    "CDEF:whc=wh,3600,*,1000,/",
    "CDEF:whmaxly=whly",
    "AREA:whc#8F8FFF",
    "LINE:whc#5252FF:Productie elektriciteit",
    #"LINE:whmaxly#FFFF00:Maximum vorig jaar",
	;
	
if ($err = RRDs::error) {
    die "ERROR: $err\n";
};

RRDs::graph "pv_month.png",
    #"--end", "now",
    "--start", "end-1month",
	"--title", "Productie PV laatste maand", 
    "--vertical-label", "kWh / dag",
    "--step", "86400",
    config_string(),
    "CDEF:whc=wh,3600,*,24,*,1000,/",
    "AREA:whc#8F8FFF",
    "LINE:whc#5252FF:Productie elektriciteit",
	;
	
if ($err = RRDs::error) {
    die "ERROR: $err\n";
}






print "Figures created...\n";


# And upload the stuff to the website
my $ftp = Net::FTP->new($host, Timeout=>240) or die "Could not create ftp object";

$ftp->binary;

$ftp->login($ftp_user, $ftp_password) or die "Could not login :", $ftp->message;

&put_graph("pv_days.png");
&put_graph("pv_month.png");


$ftp->quit;

print "Figures uploaded to website...\n";

sub put_graph() 
{
	my $name = shift();
	$ftp->put($name) or die "Could not put $name\n";
}


sub config_string {
	return "--end", "now",
    	"--imgformat","PNG",
    	"--lower-limit","0",
    	"--lazy",
    	"--color","BACK#EEF0F0",
    	"--interlaced",
    	"--watermark","http://bouw.lika.be",
    	"DEF:wh=$pv:watthour:AVERAGE",
    	;
}