#! /usr/bin/perl -w

#########################################################################

#########################################################################
use lib qw( /opt/lib/perl );

use strict;
use POSIX;
use RRDs;

use Data::Dumper;

use Getopt::Std;

use IO::Socket;
use Net::hostent; 


my $rrd_name = "solar";
my $rrd_heating_name = "heating";

my $host     = "solarnode";

# Register ALARM signal
$SIG{ALRM} = sub { die "timeout" };

# Global variables
my $global;            # Program settings
my $version = 0.1;

print &the_date;

my $socket;

########################## MAIN PROGRAM ##########################

# Read the config files and possibly add command line parameters
$global->{verbose} = 0;

# Connect to the remote device 
# create a tcp connection to the specified host and port
my ($client_host, $client_port, $kidpid, $handle, $line);

$client_host = $host; 
$client_port = 10001;

my $timeout = 0;

while () {
    if ($socket = IO::Socket::INET->new(Proto     => "tcp",
					PeerAddr  => $client_host,
					PeerPort  => $client_port,
					Type      => SOCK_STREAM)){
	last;
    } else {
	print "Waiting for server to become available...\n";
	$timeout++;
	if ($timeout == 10){
	    die "Server not available for 10 seconds...\n";
	}
	sleep 1;
    }
}
#print STDERR "[Connected to $client_host:$client_port]\n";

# Send a character to the remote server
$socket->send("?");

my $response = &read_serial(10);

&parse_and_post($response);


$socket->close();

&clean_and_exit();

########################## SUBROUTINES  ##########################
###############################################################
## parse_and_post(response)
# Parse the returned string and post the results to the RRD 
# database
###############################################################
sub parse_and_post() {
	my $data = shift();
	
	my ($t1, $t2, $t3, $t4, $t5, $pump);
	
	# Extract temperatures
	if ($data =~ /T1: (-?\d+.\d)/) { $t1 = $1; }
	if ($data =~ /T2: (-?\d+.\d)/) { $t2 = $1; }
	if ($data =~ /T3: (-?\d+.\d)/) { $t3 = $1; }
	if ($data =~ /T4: (-?\d+.\d)/) { $t4 = $1; }
	if ($data =~ /T5: (-?\d+.\d)/) { $t5 = $1; }
	if ($data =~ /Pump: (\d+)/)    { $pump = $1; }
	
	print "UVR reads: $t1 -- $t2 -- $t3 -- $t4 -- $t5 -- $pump\n";
	
	RRDs::update("$rrd_name.rrd","N:$t1:$t2:$t3:$t4:$pump");
	my $err = RRDs::error;
	die "Error while updating $rrd_name.rrd: $err\n" if $err;
	RRDs::update("$rrd_heating_name.rrd","N:$t5");
	$err = RRDs::error;
	die "Error while updating $rrd_heating_name.rrd: $err\n" if $err;

}

###############################################################
## read_serial(timeout)
#   Reads data from the serial port. Times out if nothing is
#   received after <timeout> seconds.
###############################################################
sub read_serial() {
    my $timeout = shift();

    my @numresult;
    my $result;

    eval {
	# Set alarm
	alarm($timeout);

	# Execute receive code
	my $waiting = 1;
	$result = "";
	my $res = "";
	while ($waiting){

	    # Read reply
	    ($socket->recv($res, 32));
	    # Verify we have the entire string (should end with 0x04 and no preceding 0x05)
	    $result .= $res;
	    if (($result =~ /EOT/)) {
		$waiting = 0;
	    }
	}
	
	# Clear alarm
	alarm(0);
    };

    # Check what happened in the eval loop
    if ($@) {
	if ($@ =~ /timeout/) {
	    # Oops, we had a timeout
	    print "Received up to now: $result";

	    &handle_timeout;
	    
	} else {
	    # Oops, we died
	    alarm(0);           # clear the still-pending alarm
	    die;                # propagate unexpected exception
	} 
	
    } 

    # We get here if the eval exited normally
    #@numresult = &parse_response($result);
	return $result;
	
}


###############################################################
## handle_timeout
#   Close everything and exit if we have a timeout
###############################################################
sub handle_timeout() {
    &close_port();
    &error("Timeout while waiting for data from PIC! Check your cables and connections.\n");
}

###############################################################
## Print fancy header at program startup
###############################################################
sub print_header() {

    # Calculate file age
    #my @info = stat($r_config->{filename});
    #my @nowtime = Time_to_Date(time());
    #my @filetime =Time_to_Date($info[9]); 
    #my @diff = Delta_DHMS(@filetime, @nowtime);
   
    print "--------------------------------------\n";
    print "Net Temp listener v$version\n";
    print "L. Hollevoet 2006\n";
    print "--------------------------------------\n";
    #print "\nOn port: $r_config->{comport}, $r_config->{baudrate}\n\n";


}

###############################################################
## debug
#   Debug print supporting multiple log levels
###############################################################
sub debug {

    my $debuglevel = shift();
    my $logline = shift();
	
    if ($debuglevel <= $global->{verbose}) {
	print(STDOUT "+$debuglevel= $logline\n");
    } # end print to log or STDERR

} 

###############################################################
## dec2hex
#   Convert dec number into hex string
###############################################################
sub dec2hex() {
    my $dec  = shift();
    my $fill = shift();

    my $fmt_string;

    if (defined($fill)){
	$fmt_string = "%0" . $fill . "X";
    } else {
	$fmt_string = "%02X";
    }
    return sprintf($fmt_string, $dec );
}

## Generate 3 address bytes from integer number
sub gen_address(){
    my $address = shift();

    my $string = &dec2hex($address, 6);

    # Address format required by bootloader: <ADDRL:ADDRH:ADDRU>
    my $addr = substr($string, 4, 2) . substr($string, 2, 2) . substr($string, 0, 2);
    
    return $addr; 
}
###############################################################
## min(val1, val2)
#   Return the minimum of 2 values
###############################################################
sub min(){
    my $a = shift();
    my $b = shift();

    return  ($a<$b) ? $a : $b;
}

###############################################################
## clean_and_exit
#   Shutdown cleanly
###############################################################
sub clean_and_exit() {
    &close_port();    
    exit 0;
}

###############################################################
## error
#   Signal error and exit
###############################################################
sub error() {
    my $data = shift();
    print $data;
    &close_port();
    exit 1;
}

###############################################################
## close_port
#   Close the serial port
###############################################################
sub close_port(){
    if (defined $socket){
	$socket->close();
    }    
}

# Returns the date. Used to put a timestamp to the XML file.
sub the_date() {
    my ($second, $minute, $hour, $dayOfMonth, $month, $yearOffset, $dayOfWeek, $dayOfYear, $daylightSavings) = localtime();
    my $year = 1900 + $yearOffset;
    my $hms  = sprintf("%02i:%02i:%02i", $hour, $minute, $second);
    my $ymd  = sprintf("%04i%02i%02i", $year, $month, $dayOfMonth);
    my $theTime = "[$ymd $hms] ";
    return $theTime;
}
