#! /usr/bin/env perl -w

use lib qw( /opt/lib/perl );

use RRDs;
use Net::FTP;

my $db_folder = ".";
my $gas       = "$db_folder/gas.rrd";
my $water     = "$db_folder/water.rrd";

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
RRDs::graph "gas_days.png",
    #"--end", "now",
    "--start", "end-2days",
	"--title", "Gasverbruik voorbije dagen", 
    "--vertical-label", "m3 / 15 min",
    config_string(),
   	"DEF:pulses=$gas:pulses:AVERAGE",
    "CDEF:m3=pulses,100,/,900,*",
    "AREA:m3#8F8FFF",
    "LINE:m3#5252FF:Gasverbruik",
	;
	
if ($err = RRDs::error) {
    die "ERROR: $err\n";
};

# Create the graphs
RRDs::graph "water_days.png",
    #"--end", "now",
    "--start", "end-2days",
	"--title", "Waterverbruik voorbije dagen", 
    "--vertical-label", "l / 15 min",
    config_string(),
   	"DEF:pulses=$water:pulses:AVERAGE",
    "CDEF:lh=pulses,2,/,900,*",
    "AREA:lh#8F8FFF",
    "LINE:lh#5252FF:Waterverbruik",
	;
	
if ($err = RRDs::error) {
    die "ERROR: $err\n";
};


RRDs::graph "gas_month.png",
    #"--end", "now",
    "--start", "end-1month",
	"--title", "Gasverbruik laatste maand", 
    "--vertical-label", "m3 / dag",
    "--step", "86400",
    config_string(),
   	"DEF:pulses=$gas:pulses:AVERAGE",
    "CDEF:m3=pulses,100,/,3600,*,24,*",
    "AREA:m3#8F8FFF",
    "LINE:m3#5252FF:Gasverbruik",
	;
	
if ($err = RRDs::error) {
    die "ERROR: $err\n";
}

RRDs::graph "gas_year.png",
    #"--end", "now",
    "--start", "end-1year",
	"--title", "Gasverbruik laatste jaar", 
    "--vertical-label", "m3 / dag",
    "--step", "86400",
    config_string(),
   	"DEF:pulses=$gas:pulses:AVERAGE",
    "CDEF:m3=pulses,100,/,3600,*,24,*",
    "AREA:m3#8F8FFF",
    "LINE:m3#5252FF:Gasverbruik",
	;
	
if ($err = RRDs::error) {
    die "ERROR: $err\n";
}

RRDs::graph "water_month.png",
    #"--end", "now",
    "--start", "end-1month",
	"--title", "Waterverbruik laatste maand", 
    "--vertical-label", "l / dag",
    "--step", "86400",
    config_string(),
   	"DEF:pulses=$water:pulses:AVERAGE",
    "CDEF:lh=pulses,2,/,3600,*,24,*",
    "AREA:lh#8F8FFF",
    "LINE:lh#5252FF:Waterverbruik",
	;
	
if ($err = RRDs::error) {
    die "ERROR: $err\n";
}

RRDs::graph "water_year.png",
    #"--end", "now",
    "--start", "end-1year",
	"--title", "Waterverbruik laatste jaar", 
    "--vertical-label", "l / dag",
    "--step", "86400",
    config_string(),
   	"DEF:pulses=$water:pulses:AVERAGE",
    "CDEF:lh=pulses,2,/,3600,*,24,*",
    "AREA:lh#8F8FFF",
    "LINE:lh#5252FF:Waterverbruik",
	;
	
if ($err = RRDs::error) {
    die "ERROR: $err\n";
}





print "Figures created...\n";



# And upload the stuff to the website
my $ftp = Net::FTP->new($host, Timeout=>240) or die "Could not create ftp object";

$ftp->binary;

$ftp->login($ftp_user, $ftp_password) or die "Could not login :", $ftp->message;

&put_graph("gas_days.png");
&put_graph("water_days.png");
&put_graph("gas_month.png");
&put_graph("water_month.png");
&put_graph("gas_year.png");
&put_graph("water_year.png");


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
    	;
}
