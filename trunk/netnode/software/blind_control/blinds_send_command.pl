#! /usr/bin/env perl -w

=head1 NAME

blinds_send_command - Perl script to control our window blinds

=head1 SYNOPSIS

  blinds_send_command [options] [position]
  
  where valid options are 
  	--verbose  - print extra info
  	--debug    - do not attempt to make the socket connection
  
  and valid positions are	
  	up        - move all blinds to uppermost position
  	down      - move all blinds down
  	sunblind  - set blinds in sunscreen position, starting from 
  	               uppermost position
  	               
  # Open all blinds in verbose mode
  blinds_send_command --verbose up
  
=head1 DESCRIPTION

This script is helper script to control the window blinds in our home.

Typically, blinds should go up when the lightlevel is above 8%, and 
they should go down when the lightleven is below 6%

=cut

use strict;

use IO::Socket;
use Net::hostent; 
use Getopt::Long;
use Pod::Usage;

# Register ALARM signal
$SIG{ALRM} = sub { die "timeout" };

# Settings
my $blinds_host  = 'blindnode';			# Host on the network that controls the blinds
my $blinds_port  = '10001';				# Port to connect to on the blind controller
my $debug;
my $help;

# Global variables
my $socket = 0;
my $response = 0;

my $cmd_time = get_current_time();      # Time of day for computation purposes
my $timestamp = date_time();            # For printing purpose, human readible with date

# Get paramters from command line
GetOptions('debug' => \$debug,
		   'help|?|h' => \$help) or pod2usage(2);
pod2usage(1) if ($help);


command_blinds('up');

exit(0);

=head2 C<command_blinds(command)>

This function will translate the command into the actual string that needs to be sent 
to the netnode hardware.

=cut
sub command_blinds  {
	my $blind_command = shift();
	
	# First check if we have a supported command
	my @cmnd_array = qw/up down sunblind/;
	my %cmnd_hash;
	@cmnd_hash{@cmnd_array} = ();
	
	if (!exists $cmnd_hash{$blind_command}) { print " Command '$blind_command' is not supported!"; return 0;}

	if ($debug) {
		print "Not actually sending the command since debug mode is active...\n";
		return 0;
	}
	
	print "$timestamp Connecting to socket $blinds_host... ";
		
	# Open the socket to send the command
	$socket = open_socket($blinds_host, $blinds_port);

	# If we got a valid socket
	if ($socket) {
	    print " Connected on port $blinds_port... ";
	
		$socket->send('?');
		sleep(1);
		
		# Send up, and send it twice to cover for the hardware error
		# that sometimes pops up
		if ($blind_command eq 'up') {
			$socket->send('u');
			sleep(30);
			$socket->send('u');
		}
		
		# Send down command
		if ($blind_command eq 'down') {
			$socket->send('d');
		}
		
		# Move blind 1 into sunblind position
		if ($blind_command eq 'sunblind') {
			$socket->send('b');
			sleep(1);
			$socket->send('1');
			sleep(1);
			$socket->send('d');
			sleep(20);
			$socket->send('s');							
		}
		
		sleep(1);
	
		close($socket);

		return 1;						
	
	} else {
		print "Could not open socket\n";
		return 0;
	}

}

=head2 C<open_socket(host, port)>

Tries to open a TCP session to 'host' on 'port'.
Retries if the server is not available, times out after 10 tries.

=cut
sub open_socket {

	# Read input parameters
    my $client_host = shift(); 
    my $client_port = shift();

	my $socket = 0;
	
    # Connect to the remote device 
    # create a tcp connection to the specified host and port
    my ($kidpid, $handle, $line);

    my $timeout = 0;
	
	my $cmd_time = get_current_time();
	
	print "Opening socket to $client_host" . "[" . "$client_port]\n" if ($debug);
	
    while () {
        if ($socket = IO::Socket::INET->new(Proto     => "tcp",
					PeerAddr  => $client_host,
					PeerPort  => $client_port,
					Type      => SOCK_STREAM)){
	   		last;
        } else {
	   		print "$timestamp Waiting for server '$client_host' to become available, timeout 10 seconds\n" if ($timeout == 0);
	   		print ".";
	   		$timeout++;
	   		if ($timeout == 10){
	     		print "\nServer not available, returning 0...\n";
	     		return 0;
	   		}
	   
	  		sleep 1;
        }
    }
    
    return $socket;
    
}

=head2 C<get_current_time()>

Returns the current time in human-readable format e.g. `09:47`

=cut
sub get_current_time {
	
	# Get the local time
    my ($sec, $min, $hour) = localtime(time);

	return sprintf("%02i:%02i", $hour, $min);
}

=head2 C<get_current_time()>

Returns the current date and time in human-readable format e.g. `20100701 17:45.23`

=cut
sub date_time {

	# Get localtime	
    my ($second, $minute, $hour, $dayOfMonth, $month, $yearOffset, $dayOfWeek, $dayOfYear, $daylightSavings) = localtime();
    my $year = 1900 + $yearOffset;
    # Convert to nicely formatted strings
    my $hms  = sprintf("%02i:%02i.%02i", $hour, $minute, $second);
    my $ymd  = sprintf("%04i%02i%02i", $year, $month, $dayOfMonth);
    my $theTime = "[$ymd $hms]";
    return $theTime;
	
}

=head1 BUGS

None known

=head1 SEE ALSO

Project website: http://electronics.lika.be/

=head1 AUTHOR

Lieven Hollevoet

=head1 COPYRIGHT

Copyright (C) 2010 by Lieven Hollevoet

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.8 or,
at your option, any later version of Perl 5 you may have available.

=cut