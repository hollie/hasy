#! /usr/bin/perl -w

# Control blinds script
#
# Control the blinds directly. 
# 
# Extracts the settings from an xml file.
#
# L. Hollevoet, 2007.
use strict;

use XML::Simple;
use IO::Socket;
use Net::hostent; 

my $xml = new XML::Simple(keyattr => ['time']);

my $config = $xml->XMLin("blind_settings.xml");

if (command_blinds($ARGV[0])) {
	print '<div id="battery" title="Battery" class="panel"><h2>Better recharge soon!</h2></div>';
	#print "Command send completed\n";
} else {
	print "Command send failed!!\n";
}

exit(0);

############################################################################
# Subroutines
################

#
# Blind controller related
#
sub command_blinds {
	my $blind_command = shift();

	# Sanity check	
	if ($blind_command ne "u" && $blind_command ne "d") {print "Cannot perform action '$blind_command'. Command should be either 'u' or 'd'."; return 0;};

	my $host = $config->{target}->{host};
	my $port = $config->{target}->{port};
	
	#print "SENDING COMMAND TO [$host:$port] : $blind_command\n";
	
	my $handle = IO::Socket::INET->new(Proto => "tcp", PeerAddr => $config->{target}->{host}, PeerPort => $config->{target}->{port}, Type => SOCK_STREAM);
	if (!defined($handle)){
		print "Could not connect to '$host'!";
		return 0;
	}
	print $handle $blind_command;

	$handle->close();
					
	return 1;
}

