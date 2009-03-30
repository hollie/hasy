#! /usr/bin/perl

use lib qw( /opt/lib/perl );

use RRDs;
use Net::FTP;

my $db_folder = "ventilatie";
my $aww_uit = "$db_folder/aww_uit.rrd";
my $int_in  = "$db_folder/unit_int_in.rrd";
my $int_uit = "$db_folder/unit_int_uit.rrd";
my $ebos    = "$db_folder/ebos.rrd";
my $humi    = "$db_folder/humi_binnen.rrd";
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
RRDs::graph "humi_week.png",
    "--end", "now",
    "--start", "end-1week",
    "--title", "Luchtvochtigheid weekoverzicht", 
    "--vertical-label", "graden C / %",
    "--imgformat","PNG",
    "--lower-limit","0",
    #"--lazy",
    #"--slope-mode",
    "--color","BACK#EEF0F0",
    "--interlaced",
    "--watermark","http://bouw.lika.be",
    "DEF:rv=$humi:rhumi:AVERAGE",
    "DEF:dewpt=$humi:dewpt:AVERAGE",
    "LINE:rv#0000FF:Relatieve vochtigheid (%)",
    "LINE:dewpt#00FF00:Dauwpunt (graden C)",
    ;

if ($err = RRDs::error) {
    die "ERROR: $err\n";
};


# Create the weekly temp graph
# RRDs::graph "ventilatie_week.png",
#     "--end", "now",
#     "--start", "end-1week",
#     "--title", "Balansventilatie weekoverzicht", 
#     "--vertical-label", "graden C",
#     "--imgformat","PNG",
#     "--lazy",
#     #"--slope-mode",
#     "--color","BACK#EEF0F0",
#     "--interlaced",
#     "--watermark","http://bouw.lika.be",
#     "DEF:aww_uit=$aww_uit:temperature:AVERAGE",
#     "DEF:aww_uit_min=$aww_uit:temperature:MIN",
#     "DEF:aww_uit_max=$aww_uit:temperature:MAX",
#     "DEF:int_in=$int_in:temperature:AVERAGE",
#     "DEF:int_uit=$int_uit:temperature:AVERAGE",
#     "DEF:buiten=$ebos:temperature:AVERAGE",
#     "COMMENT:Meetpunt                \t   min          max          gem\\n",
#     "LINE:buiten#0000FF:buitenlucht         ",
#     "GPRINT:buiten:MIN:\t%5.1lf",
#     "GPRINT:buiten:MAX:\t%5.1lf",
#     "GPRINT:buiten:AVERAGE:\t%5.1lf\\n",
#     "LINE:aww_uit#00b6e4:na AWW              ",
#     "GPRINT:aww_uit:MIN:\t%5.1lf",
#     "GPRINT:aww_uit:MAX:\t%5.1lf",
#     "GPRINT:aww_uit:AVERAGE:\t%5.1lf\\n",
#     "LINE:int_uit#00FF00:inblaas woning      ",
#     "GPRINT:int_uit:MIN:\t%5.1lf",
#     "GPRINT:int_uit:MAX:\t%5.1lf",
#     "GPRINT:int_uit:AVERAGE:\t%5.1lf\\n",
#     "LINE:int_in#FF0000:afvoer  woning      ",
#     "GPRINT:int_in:MIN:\t%5.1lf",
#     "GPRINT:int_in:MAX:\t%5.1lf",
#     "GPRINT:int_in:AVERAGE:\t%5.1lf\\n",
#     ;
# 
# 
# if ($err = RRDs::error) {
#     die "ERROR: $err\n";
# };
# 
# # Create the monthly temp graph
# RRDs::graph "ventilatie_month.png",
#     "--end", "now",
#     "--start", "end-1month",
#     "--title", "Balansventilatie maandoverzicht", 
#     "--vertical-label", "graden C",
#     "--imgformat","PNG",
#     "--lazy",
#     #"--slope-mode",
#     "--color","BACK#EEF0F0",
#     "--interlaced",
#     "--watermark","http://bouw.lika.be",
#     "DEF:aww_uit=$aww_uit:temperature:AVERAGE",
#     "DEF:aww_uit_min=$aww_uit:temperature:MIN",
#     "DEF:aww_uit_max=$aww_uit:temperature:MAX",
#     "DEF:int_in=$int_in:temperature:AVERAGE",
#     "DEF:int_uit=$int_uit:temperature:AVERAGE",
#     "DEF:buiten=$ebos:temperature:AVERAGE",
#     "COMMENT:Meetpunt                \t   min          max          gem\\n",
#     "LINE:buiten#0000FF:buitenlucht         ",
#     "GPRINT:buiten:MIN:\t%5.1lf",
#     "GPRINT:buiten:MAX:\t%5.1lf",
#     "GPRINT:buiten:AVERAGE:\t%5.1lf\\n",
#     "LINE:aww_uit#00b6e4:na AWW              ",
#     "GPRINT:aww_uit:MIN:\t%5.1lf",
#     "GPRINT:aww_uit:MAX:\t%5.1lf",
#     "GPRINT:aww_uit:AVERAGE:\t%5.1lf\\n",
#     "LINE:int_uit#00FF00:inblaas woning      ",
#     "GPRINT:int_uit:MIN:\t%5.1lf",
#     "GPRINT:int_uit:MAX:\t%5.1lf",
#     "GPRINT:int_uit:AVERAGE:\t%5.1lf\\n",
#     "LINE:int_in#FF0000:afvoer  woning      ",
#     "GPRINT:int_in:MIN:\t%5.1lf",
#     "GPRINT:int_in:MAX:\t%5.1lf",
#     "GPRINT:int_in:AVERAGE:\t%5.1lf\\n",
#     ;
# 
# 
# if ($err = RRDs::error) {
#     die "ERROR: $err\n";
# };
# 
# # Create the yearly temp graph
# RRDs::graph "ventilatie_year.png",
#     "--end", "now",
#     "--start", "end-1year",
#     "--title", "Balansventilatie jaaroverzicht", 
#     "--vertical-label", "graden C",
#     "--imgformat","PNG",
#     "--lazy",
#     #"--slope-mode",
#     "--color","BACK#EEF0F0",
#     "--interlaced",
#     "--watermark","http://bouw.lika.be",
#     "DEF:aww_uit=$aww_uit:temperature:AVERAGE",
#     "DEF:aww_uit_min=$aww_uit:temperature:MIN",
#     "DEF:aww_uit_max=$aww_uit:temperature:MAX",
#     "DEF:int_in=$int_in:temperature:AVERAGE",
#     "DEF:int_uit=$int_uit:temperature:AVERAGE",
#     "DEF:buiten=$ebos:temperature:AVERAGE",
#     "COMMENT:Meetpunt                \t   min          max          gem\\n",
#     "LINE:buiten#0000FF:buitenlucht         ",
#     "GPRINT:buiten:MIN:\t%5.1lf",
#     "GPRINT:buiten:MAX:\t%5.1lf",
#     "GPRINT:buiten:AVERAGE:\t%5.1lf\\n",
#     "LINE:aww_uit#00b6e4:na AWW              ",
#     "GPRINT:aww_uit:MIN:\t%5.1lf",
#     "GPRINT:aww_uit:MAX:\t%5.1lf",
#     "GPRINT:aww_uit:AVERAGE:\t%5.1lf\\n",
#     "LINE:int_uit#00FF00:inblaas woning      ",
#     "GPRINT:int_uit:MIN:\t%5.1lf",
#     "GPRINT:int_uit:MAX:\t%5.1lf",
#     "GPRINT:int_uit:AVERAGE:\t%5.1lf\\n",
#     "LINE:int_in#FF0000:afvoer  woning      ",
#     "GPRINT:int_in:MIN:\t%5.1lf",
#     "GPRINT:int_in:MAX:\t%5.1lf",
#     "GPRINT:int_in:AVERAGE:\t%5.1lf\\n",
#     ;
# 
# 
# if ($err = RRDs::error) {
#     die "ERROR: $err\n";
# };
# 
# # Create the weekly efficiency graph
# RRDs::graph "rendement_week.png",
#     "--end", "now",
#     "--start", "end-1week",
#     "--title", "Rendement interne warmtewisselaar (week)", 
#     "--vertical-label", "%",
#     "--upper-limit","100",
#     "--lower-limit","0",
#     "--rigid",
# #  "--alt-autoscale-max","100",
#     "--imgformat","PNG",
#     "--lazy",
#     #"--slope-mode",
#     "--color","BACK#EEF0F0",
#     "--interlaced",
#     "--watermark","http://bouw.lika.be",
#     "DEF:aww_uit=$aww_uit:temperature:AVERAGE",
#     "DEF:int_in=$int_in:temperature:AVERAGE",
#     "DEF:int_uit=$int_uit:temperature:AVERAGE",
#     "DEF:dewpoint=$ebos:dewpoint:AVERAGE",
#     "DEF:buiten=$ebos:temperature:AVERAGE",
#     "CDEF:rendement=int_in,aww_uit,-,DUP,int_in,int_uit,-,-,2,REV,/,100,*", 
#     "CDEF:no_condense=aww_uit,buiten,LT,aww_uit,dewpoint,-,5,GE,100,0,IF,100,IF",
#     "CDEF:low_condense=aww_uit,buiten,LT,aww_uit,dewpoint,-,1,5,LIMIT,UN,0,100,IF,0,IF",
#     "CDEF:high_condense=aww_uit,buiten,LT,aww_uit,dewpoint,-,1,LE,100,0,IF,0,IF",
#     "CDEF:unknown_condense=aww_uit,UN,100,0,IF",
#     "AREA:no_condense#8FEEA5:Geen condensgevaar AWW\\n",
#     "AREA:low_condense#FCC070:Mogelijke condensvorming in AWW\\n",
#     "AREA:high_condense#F37e77:Controleer condensput!!\\n",
#     "LINE:rendement#00b6e4:Rendement interne WW (gemiddeld",
#     "GPRINT:rendement:AVERAGE:%2.1lf %%)",
#     "AREA:unknown_condense#D7D7D7",
#     ;
# if ($err = RRDs::error) {
#     die "ERROR: $err\n";
# };
# 
# # Create the yearly efficiency graph
# RRDs::graph "rendement_year.png",
#     "--end", "now",
#     "--start", "end-1year",
#     "--title", "Rendement interne warmtewisselaar (jaar)", 
#     "--vertical-label", "%",
#     "--upper-limit","100",
#     "--lower-limit","0",
#     "--rigid",
# #  "--alt-autoscale-max","100",
#     "--imgformat","PNG",
#     "--lazy",
#     #"--slope-mode",
#     "--color","BACK#EEF0F0",
#     "--interlaced",
#     "--watermark","http://bouw.lika.be",
#     "DEF:aww_uit=$aww_uit:temperature:AVERAGE",
#     "DEF:int_in=$int_in:temperature:AVERAGE",
#     "DEF:int_uit=$int_uit:temperature:AVERAGE",
#     "DEF:dewpoint=$ebos:dewpoint:AVERAGE",
#     "DEF:buiten=$ebos:temperature:AVERAGE",
#     "CDEF:rendement=int_in,aww_uit,-,DUP,int_in,int_uit,-,-,2,REV,/,100,*", 
#     "CDEF:no_condense=aww_uit,buiten,LT,aww_uit,dewpoint,-,5,GE,100,0,IF,100,IF",
#     "CDEF:low_condense=aww_uit,buiten,LT,aww_uit,dewpoint,-,1,5,LIMIT,UN,0,100,IF,0,IF",
#     "CDEF:high_condense=aww_uit,buiten,LT,aww_uit,dewpoint,-,1,LE,100,0,IF,0,IF",
#     "CDEF:unknown_condense=aww_uit,UN,100,0,IF",
#     "AREA:no_condense#8FEEA5:Geen condensgevaar AWW\\n",
#     "AREA:low_condense#FCC070:Mogelijke condensvorming in AWW\\n",
#     "AREA:high_condense#F37e77:Controleer condensput!!\\n",
#     "LINE:rendement#00b6e4:Rendement interne WW (gemiddeld",
#     "GPRINT:rendement:AVERAGE:%2.1lf %%)",
#     "AREA:unknown_condense#D7D7D7",
#     ;
# if ($err = RRDs::error) {
#     die "ERROR: $err\n";
# };


print "Figures created...\n";

#exit(0);

# And upload the stuff to the website
my $ftp = Net::FTP->new($host, Timeout=>240) or die "Could not create ftp object";

$ftp->binary;

$ftp->login($ftp_user, $ftp_password) or die "Could not login :", $ftp->message;

#&put_graph("ventilatie_week.png");
#&put_graph("ventilatie_month.png");
#&put_graph("ventilatie_year.png");
#&put_graph("rendement_week.png");
#&put_graph("rendement_year.png");
&put_graph("humi_week.png");

$ftp->quit;

print "Figures uploaded to website...\n";

sub put_graph() 
{
	my $name = shift();
	$ftp->put($name) or die "Could not put $name\n";
}

