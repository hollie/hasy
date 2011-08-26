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
my $blinds_host  = '192.168.1.21';			# Host on the network that controls the blinds
my $blinds_port  = '10001';				# Port to connect to on the blind controller
my $debug   = 0;
my $verbose = 0;
my $help;

# Global variables
my $socket = 0;
my $response = 0;

my $cmd_time = get_current_time();      # Time of day for computation purposes
my $timestamp = date_time();            # For printing purpose, human readible with date

# Get paramters from command line
GetOptions('debug' => \$debug,
		   'verbose|v' => \$verbose,
		   'help|?|h' => \$help) or pod2usage(2);
pod2usage(1) if ($help);


command_blinds($ARGV[0]);

exit(0);

=head2 C<command_blinds(command)>

This function will translate the command into the actual string that needs to be sent 
to the netnode hardware.

=cut
sub command_blinds  {
	my $blind_command = shift();
	
	# First check if we have a supported command
	my @cmnd_array = qw/up down sun1 unsun1 stop sun45/;
	my %cmnd_hash;
	@cmnd_hash{@cmnd_array} = ();
	
	if (!exists $cmnd_hash{$blind_command}) { print "Command '$blind_command' is not supported!\n"; return 0;}

	print "$timestamp Connecting to socket $blinds_host...\n";
		
	# Open the socket to send the command
	$socket = open_socket($blinds_host, $blinds_port) unless ($debug);

	# If we got a valid socket
	if ($socket || $debug) {
	    print " Connected on port $blinds_port...\n" if ($verbose && !$debug);
	
		socket_send('?');
		sleep(1);
		
		# Send up, and send it twice to cover for the hardware error
		# that sometimes pops up
		if ($blind_command eq 'up') {
			socket_send('u');
			print "Sleeping 30 seconds before resending 'u'\n" if ($verbose);
			sleep(30);
			socket_send('u');
		}
		
		# Send down command
		if ($blind_command eq 'down') {
			socket_send('d');
		}
		
		# Move blind 1 into sunblind position
		if ($blind_command eq 'sun1') {
			socket_send('b1d');
			print "Sleeping 16 seconds before sending 's'\n" if ($verbose);
			sleep(16);
			socket_send('s');							
		}
		# Move blind 1 back up
		if ($blind_command eq 'unsun1') {
			socket_send('b1u');
		}

		# Move blinds 4 and 5 into sunblind position
		if ($blind_command eq 'sun45') {
			socket_send('b4d');
			sleep(14);
			socket_send('s');
			socket_send('b5d');
			sleep(14);
			socket_send('s');
		}
			
		if ($blind_command eq 'stop') {
			socket_send('s');
		}
		sleep(1);
	
		close($socket) unless ($debug);

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
	
	print "Opening socket to $client_host" . "[" . "$client_port]\n" if ($verbose);
	
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

=head2 C<socket_send(data)>

Wrapper around the socket->send(data) function that allows us to 
disable socket actions when running the script in debug mode.

It also chops a string of more than one character into characters that 
are transmitted with 1-second delays in between. This is a safeguard
against UART overflow in the receiving hardware.
/
=cut
sub socket_send {

	my $data = shift();
	
	my @data_array = split //, $data;
	my $char;
	
	foreach $char (@data_array) {

		sleep(1);

		if ($debug || $verbose) {
			print "socket_send '$char' - debug: $debug - verbose: $verbose\n";
			next if ($debug);
		}
	
		$socket->send($char);		
	}
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