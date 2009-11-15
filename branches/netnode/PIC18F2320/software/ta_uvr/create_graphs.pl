#! /usr/bin/perl

use lib qw( /opt/lib/perl );

use RRDs;
use Net::FTP;

my $db_folder = ".";
my $db  = "solar.rrd";
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

# Create the daily graph
RRDs::graph "solar_days.png",
    "--end", "now",
    "--start", "end-2days",
    "--title", "Zonneboiler vandaag en gisteren", 
    config_string();
    


if ($err = RRDs::error) {
    die "ERROR: $err\n";
};


# Create the weekly temp graph
RRDs::graph "solar_week.png",
    "--end", "now",
    "--start", "end-1week",
    "--title", "Zonneboiler weekoverzicht", 
    config_string();
    


if ($err = RRDs::error) {
    die "ERROR: $err\n";
};

# Create the monthly temp graph
RRDs::graph "solar_month.png",
    "--end", "now",
    "--start", "end-4weeks",
    "--title", "Zonneboiler maandoverzicht", 
    config_string_nopanels();
    


if ($err = RRDs::error) {
    die "ERROR: $err\n";
};

# Create the yearly temp graph
RRDs::graph "solar_year.png",
    "--end", "now",
    "--start", "end-1year",
    "--title", "Zonneboiler jaaroverzicht", 
    config_string();
    


if ($err = RRDs::error) {
    die "ERROR: $err\n";
};


print "Figures created...\n";

#exit(0);


# And upload the stuff to the website
my $ftp = Net::FTP->new($host, Timeout=>240) or die "Could not create ftp object";

$ftp->binary;

$ftp->login($ftp_user, $ftp_password) or die "Could not login :", $ftp->message;

&put_graph("solar_days.png");
&put_graph("solar_week.png");
&put_graph("solar_month.png");
&put_graph("solar_year.png");

$ftp->quit;

print "Figures uploaded to website...\n";

sub put_graph() 
{
	my $name = shift();
	$ftp->put($name) or die "Could not put $name: ", $ftp->message;
}

sub config_string() {
	return "--vertical-label", "graden C",
    "--imgformat","PNG",
    "--lazy",
    #"--slope-mode",
    "--color","BACK#EEF0F0",
    "--interlaced",
    "--watermark","http://www.lika.be/stats",
    "DEF:panels=$db:t_panel:AVERAGE",
    "DEF:panels_min=$db:t_panel:MIN",
    "DEF:panels_max=$db:t_panel:MAX",
    "DEF:bottom=$db:t_bottom:AVERAGE",
    "DEF:bottom_min=$db:t_bottom:MIN",
    "DEF:bottom_max=$db:t_bottom:MAX",
    "DEF:middle=$db:t_middle:AVERAGE",
    "DEF:middle_min=$db:t_middle:MIN",
    "DEF:middle_max=$db:t_middle:MAX",
    "DEF:top=$db:t_top:AVERAGE",
    "DEF:top_min=$db:t_top:MIN",
    "DEF:top_max=$db:t_top:MAX",
    "DEF:pump=$db:pump:AVERAGE",
    "CDEF:pump_sc=pump,30,/,20,*",
    "COMMENT:Meetpunt                \t   min          max          gem\\n",
    "AREA:top#FFCCCC",
    "LINE:top#990000:bovenkant boiler    ",
    "GPRINT:top:MIN:\t%5.1lf",
    "GPRINT:top:MAX:\t%5.1lf",
    "GPRINT:top:AVERAGE:\t%5.1lf\\n",
    "AREA:middle#FFFFBB",
    "LINE:middle#FFA852:midden boiler       ",
    "GPRINT:middle:MIN:\t%5.1lf",
    "GPRINT:middle:MAX:\t%5.1lf",
    "GPRINT:middle:AVERAGE:\t%5.1lf\\n",
    "AREA:bottom#CCCCFF",
    "LINE:bottom#000099:bodem boiler        ",
    "GPRINT:bottom:MIN:\t%5.1lf",
    "GPRINT:bottom:MAX:\t%5.1lf",
    "GPRINT:bottom:AVERAGE:\t%5.1lf\\n",
    "LINE:top#990000",
    "LINE:panels#00DD00:panelen             ",
    "GPRINT:panels:MIN:\t%5.1lf",
    "GPRINT:panels:MAX:\t%5.1lf",
    "GPRINT:panels:AVERAGE:\t%5.1lf\\n",
    "AREA:pump_sc#8F8FFF",
    "LINE:pump_sc#5252FF:pompaansturing (20 == MAX)",
    
}

sub config_string_nopanels() {
	return "--vertical-label", "graden C",
    "--imgformat","PNG",
    "--lazy",
    #"--slope-mode",
    "--color","BACK#EEF0F0",
    "--interlaced",
    "--watermark","http://www.lika.be/stats",
    "DEF:panels=$db:t_panel:AVERAGE",
    "DEF:panels_min=$db:t_panel:MIN",
    "DEF:panels_max=$db:t_panel:MAX",
    "DEF:bottom=$db:t_bottom:AVERAGE",
    "DEF:bottom_min=$db:t_bottom:MIN",
    "DEF:bottom_max=$db:t_bottom:MAX",
    "DEF:middle=$db:t_middle:AVERAGE",
    "DEF:middle_min=$db:t_middle:MIN",
    "DEF:middle_max=$db:t_middle:MAX",
    "DEF:top=$db:t_top:AVERAGE",
    "DEF:top_min=$db:t_top:MIN",
    "DEF:top_max=$db:t_top:MAX",
    "DEF:pump=$db:pump:AVERAGE",
    "CDEF:pump_sc=pump,30,/,20,*",
    "COMMENT:Meetpunt                \t   min          max          gem\\n",
    "AREA:top#FFCCCC",
    "LINE:top#990000:bovenkant boiler    ",
    "GPRINT:top:MIN:\t%5.1lf",
    "GPRINT:top:MAX:\t%5.1lf",
    "GPRINT:top:AVERAGE:\t%5.1lf\\n",
    "AREA:middle#FFFFBB",
    "LINE:middle#FFA852:midden boiler       ",
    "GPRINT:middle:MIN:\t%5.1lf",
    "GPRINT:middle:MAX:\t%5.1lf",
    "GPRINT:middle:AVERAGE:\t%5.1lf\\n",
    "AREA:bottom#CCCCFF",
    "LINE:bottom#000099:bodem boiler        ",
    "GPRINT:bottom:MIN:\t%5.1lf",
    "GPRINT:bottom:MAX:\t%5.1lf",
    "GPRINT:bottom:AVERAGE:\t%5.1lf\\n",
    "LINE:top#990000",
    "AREA:pump_sc#8F8FFF",
    "LINE:pump_sc#5252FF:pompaansturing (20 == MAX)",
    
}
