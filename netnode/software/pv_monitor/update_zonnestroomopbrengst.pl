#! /usr/bin/perl -w

#########################################################################
# Script to generate the input file for zonnestroomopbrengst.eu
#
# Lieven Hollevoet, 2009
#########################################################################
use lib qw( /opt/lib/perl );

use strict;
use POSIX;
use RRDs;
use Net::FTP;

use Data::Dumper;

use Getopt::Std;

my $log;

my $ctime = time;
my $rrdres = 86400;


my $ftp_user = "stats\@lika.be";
my $ftp_password;

# Get the FTP password from the command line
if (defined($ARGV[0])){
	$ftp_password = $ARGV[0];	
} else {
	die "Please pass the ftp password as command line argument!\n";
}



my ($start,$step,$names,$data) = RRDs::fetch ("pv.rrd", "AVERAGE", "-r", "86400", "-s", "01.04.2009,", "-e", "midnight");
my $ERR=RRDs::error;
die "ERROR while fetching: $ERR\n" if $ERR;

	
	
#print "Start:       ", scalar localtime($start), " ($start)\n";
#print "Step size:   $step seconds\n";
#print "DS names:    ", join (", ", @$names)."\n";
#print "Data points: ", $#$data + 1, "\n";
#print "Data:\n";

#$start=$ctime;

init_offsets();

for my $line ((@$data)) {
  #print "  ", scalar localtime($start), " ($start) ";
  for my $val (@$line) {
   if (defined $val){
    	#printf "%12.1f ", $val*86400;
    	push_value($start, $val*86400);
   }
  }
  $start += $step;

  #print "\n";
}


my $production = generate_months_js();

# Convert prodction to kWh
$production = floor($production/100)/10;

if ($ftp_password eq "report" ) {
	print "Total energy produced: $production kWh\n";
} else {
	upload_file();
}

exit(0);

sub push_value {
	my $stamp = shift();
	my $value = shift();
	
	# Correct stamp for RRD retrieval (-1day)
	$stamp -= 86400;
	
	my $year  = strftime("%y", localtime($stamp));
	my $month = strftime("%m", localtime($stamp));
	my $day   = strftime("%d", localtime($stamp));
	
	#printf "Adding $value Wh for $day-$month-$year\n";
	
	# Create or add the value in the log hash
	if (!defined($log->{$year}->{$month}->{day})){
		$log->{$year}->{$month}->{value} = $value;
		$log->{$year}->{$month}->{day} = $day;
	} else {
		$log->{$year}->{$month}->{value} += $value;
	}

	# Update the day if we encounter the latest day
	if ($day ge $log->{$year}->{$month}->{day}){
		$log->{$year}->{$month}->{day} = $day;
	}	
	 
}

sub generate_months_js {
	# Loop over the months, starting at the latest month and print the status line
	my ($year, $month);
	my $total=0;
	
	open F, "> months.js" or die "Could not open months.js for writing: $!\n";
	
	
	foreach $year (reverse sort keys %{$log}){
		foreach $month (reverse sort keys %{$log->{$year}}){
			print F "mo[mx++]=\"" . $log->{$year}->{$month}->{day} . ".$month.$year|" . floor($log->{$year}->{$month}->{value}) . "\"\n";
			$total += $log->{$year}->{$month}->{value};
		}
	}
	
	close F;
	
	return floor($total);
}

sub init_offsets {
	$log->{'09'}->{'04'}->{day} = 0;
	$log->{'09'}->{'04'}->{value} = 30850;
	$log->{'09'}->{'05'}->{day} = 0;
	$log->{'09'}->{'05'}->{value} = 830;
	$log->{'09'}->{'07'}->{day} = 0;
	$log->{'09'}->{'07'}->{value} = 65300;
	$log->{'09'}->{'09'}->{day} = 0;
	$log->{'09'}->{'09'}->{value} = 10800;
	$log->{'09'}->{'12'}->{day} = 0;
	$log->{'09'}->{'12'}->{value} = -1700;
	
	

}

sub upload_file {
	# And upload the stuff to the website
	my $host = 'ftp.lika.be';
	
	my $ftp = Net::FTP->new($host, Timeout=>240) or die "Could not create ftp object";

	$ftp->binary;

	$ftp->login($ftp_user, $ftp_password) or die "Could not login :", $ftp->message;

	$ftp->put('months.js') or die "Could not put months.js\n";

	$ftp->quit;


}
