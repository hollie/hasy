#! /usr/bin/perl

use lib qw( /opt/lib/perl );

use RRDs;
use Net::FTP;

my $db_folder = "light_level";
my $light     = "$db_folder/node01.rrd";
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


# Create the light_level graphs
RRDs::graph "light_days.png",
    "--start", "end-2days",
    "--title", "Ambient lightlevel (daily)", 
    light_cfgstring();
    ;

if ($err = RRDs::error) {
    die "ERROR: $err\n";
};

RRDs::graph "light_year.png",
    "--start", "end-1year",
    "--title", "Ambient lightlevel (year)", 
    #"--lazy",
    light_minmax();
    
    ;

if ($err = RRDs::error) {
    die "ERROR: $err\n";
};


print "Figures created...\n";

#exit(0);

# And upload the stuff to the website
my $ftp = Net::FTP->new($host, Timeout=>240) or die "Could not create ftp object";

$ftp->binary;

$ftp->login($ftp_user, $ftp_password) or die "Could not login :", $ftp->message;

&put_graph("light_days.png");
&put_graph("light_year.png");

$ftp->quit;

print "Figures uploaded to website...\n";

sub put_graph() 
{
	my $name = shift();
	$ftp->put($name) or die "Could not put $name\n";
}

# Config string for graphs
sub light_cfgstring {
	return  "--end", "now",
    "--vertical-label", "Volt",
    "--imgformat","PNG",
    "--lower-limit","0",
    "--upper-limit","5",
    "--rigid",
    "--color","BACK#EEF0F0",
    "--interlaced",
    "--watermark","http://bouw.lika.be",
    "DEF:solar=$light:solar_adc:AVERAGE",
    "DEF:vcc=$light:vcc_adc:AVERAGE",
    "DEF:t_real=$light:temperature:AVERAGE",
    "CDEF:t_scaled=t_real,10,/",
    "AREA:solar#FFCCCC",
    "LINE:solar#990000:Panel output",
    "LINE:vcc#000099:System voltage",
    "LINE:t_scaled#009900:Temperature / 10 degrees C",
    ;    
}
sub light_minmax {
	return  "--end", "now",
    "--vertical-label", "Volt",
    "--imgformat","PNG",
    "--lower-limit","0",
    "--upper-limit","5",
    "--rigid",
    "--color","BACK#EEF0F0",
    "--interlaced",
    "--watermark","http://bouw.lika.be",
    "DEF:vcc_min=$light:vcc_adc:MIN",
    "DEF:vcc_avg=$light:vcc_adc:AVERAGE",
    "DEF:vcc_max=$light:vcc_adc:MAX",
    "DEF:t_real=$light:temperature:AVERAGE",  
    "DEF:solar=$light:solar_adc:AVERAGE",
    "CDEF:t_scaled=t_real,10,/",
    "AREA:vcc_max#CCCCFF",
    "LINE:vcc_max#990000:Vcc maximum",
    "LINE:vcc_avg#009900:Vcc average",
    "AREA:vcc_min#FFFFFF",
    "LINE:vcc_min#000099:Vcc minimum",
    "LINE:t_scaled#999999:Temperature / 10 degrees C",
    "LINE:solar#FFC801:Vsolar average",
    ;    
}

