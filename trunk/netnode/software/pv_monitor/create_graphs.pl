#! /usr/bin/perl

use lib qw( /opt/lib/perl );

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

# Create the humi graph
RRDs::graph "pv_week.png",
    "--end", "now",
    "--start", "end-1week",
    "--title", "Productie PV installatie", 
    "--vertical-label", "Wh",
    "--imgformat","PNG",
    "--lower-limit","0",
    #"--lazy",
    #"--slope-mode",
    "--color","BACK#EEF0F0",
    "--interlaced",
    "--watermark","http://bouw.lika.be",
    "DEF:wh=$pv:watthour:AVERAGE",
    "AREA:wh#0000FF:Geproduceerde Wh electriciteit",
    ;

if ($err = RRDs::error) {
    die "ERROR: $err\n";
};



print "Figures created...\n";

exit(0);

# And upload the stuff to the website
my $ftp = Net::FTP->new($host, Timeout=>240) or die "Could not create ftp object";

$ftp->binary;

$ftp->login($ftp_user, $ftp_password) or die "Could not login :", $ftp->message;

&put_graph("pv_week.png");

$ftp->quit;

print "Figures uploaded to website...\n";

sub put_graph() 
{
	my $name = shift();
	$ftp->put($name) or die "Could not put $name\n";
}

