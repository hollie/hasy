#! /usr/bin/perl -w

# Create a settings file for when to steer the blinds up and down
# at sunrise/sunset based on your location on earth. 
#
# This file is then uploaded to a web server through FTP

use Astro::Sunrise;
#use XML::Simple;
use Net::FTP;

# Who is the blind controller in your local network
my $blind_controller_host = 'netnode02';
my $blind_controller_port = 10001;

# Blinds user time limits
## Blinds should stay down until
my $blinds_down_until = '06:45';

## Blinds should be up by
my $blinds_up_by = '08:30';

## Blinds should stay up until
my $blinds_up_until = '17:00';

## Blinds should be down by
my $blinds_down_by = '22:30';

# Where are we on earth?
my $long = 3.58;
my $lat  = 52.11;

# Sun altitude, see Astro::Sunrise documentation
my $altitude = -3.5;

# Command file 
my $command_file = 'blind_settings_today.xml';

# FTP related stuff
my $ftp_host    = 'hostname_here';
my $ftp_user    = 'username_here'; 
my $ftp_password;

# Get the FTP password from the command line
if (defined($ARGV[0])){
	$ftp_password = $ARGV[0];	
} else {
	die "Please pass the ftp password as command line argument!\n";
}

################# Program start, do not change below this line #######################

# Calculate sunrise/sunset
my $date = localtime(time);
print "On $date, ";
my $sunrise = Astro::Sunrise::sun_rise($long, $lat, $altitude);
print "sunrise at $sunrise and ";
my $sunset = Astro::Sunrise::sun_set($long, $lat, $altitude);
print "sunset at $sunset\n";

# Make sure all hours are written with 2 digits
if (length($sunrise) == 4){
	$sunrise = "0$sunrise";
}
if (length($sunset) == 4){
	$sunset = "0$sunset";
}

# Make sure to take into account the user defined time limits
$sunrise = ($sunrise lt $blinds_down_until)? $blinds_down_until : $sunrise;
$sunrise = ($sunrise gt $blinds_up_by)     ? $blinds_up_by      : $sunrise;

$sunset  = ($sunset lt $blinds_up_until)   ? $blinds_up_until   : $sunset;
$sunset  = ($sunset gt $blinds_down_by)    ? $blinds_down_by    : $sunset;

# Debug output
print "Writing to file: up @ $sunrise, down @ $sunset\n";

# Write to the xml file that will be read by the 'control_blinds' script
open (XML, ">", $command_file) or (die "Could not open command file for output: $!");

print XML "<config created=\"$date\">\n";
print XML "<target>\n";
print XML "<host>$blind_controller_host</host>\n";
print XML "<port>$blind_controller_port</port>\n</target>\n";
print XML "<command>\n";
print XML "<time>$sunrise</time>\n<direction>u</direction>\n";
print XML "</command>\n";
print XML "<command>\n";
print XML "<time>$sunset</time>\n<direction>d</direction>\n";
print XML "</command>\n";
print XML "</config>\n";

close(XML);

# Upload settings to web server where the client can grab them
# And upload the stuff to the website
my $ftp = Net::FTP->new($ftp_host, Timeout=>240) or die "Could not create ftp object";
$ftp->binary;
$ftp->login($ftp_user, $ftp_password) or die "Could not login :", $ftp->message;
$ftp->put($command_file);
$ftp->quit;



