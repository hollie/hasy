#! /usr/bin/perl -w

use POSIX;
use Data::Dumper;

my $log;

# Offsets to the PV installation, due to communication errors of power failures in the reader
$log->{'09'}->{'04'}->{day} = 0;
$log->{'09'}->{'04'}->{value} = 100;

push_value(time(), 200);

print Dumper($log);


generate_months_js();


sub push_value {
	my $stamp = shift();
	my $value = shift();
	
	# Correct stamp for RRD retrieval (-1day)
	$stamp -= 86400;
	
	my $year  = strftime("%y", localtime($stamp));
	my $month = strftime("%m", localtime($stamp));
	my $day   = strftime("%d", localtime($stamp));
	
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
	
	foreach $year (reverse sort keys %{$log}){
		foreach $month (reverse sort keys %{$log->{$year}}){
			print "mo[mx++]=\"" . $log->{$year}->{$month}->{day} . ".$month.$year|" . $log->{$year}->{$month}->{value} . "\"\n";
		}
	}
}

