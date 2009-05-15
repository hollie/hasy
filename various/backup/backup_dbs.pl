#! /usr/bin/perl

# Script to upload all RRD databases to an offsite backup. 
#
# The files to be backed up are specified in an XML file.
#
# Known limitations:
# - only supports a one-level deep folder hierarchy in the server folder
# - the folder structure has to exist on the server before the script is run
#
# Lieven Hollevoet, 2009

use lib qw( /opt/lib/perl );

use Net::FTP;
use XML::Simple;
use Data::Dumper;

my $settings_file = 'backup_settings.xml';

my $config;
my $ftp;

########################## MAIN PROGRAM ##########################

# Read the config file
get_config();

# Get the command line password
get_password();

# Connect to FTP server
ftp_connect();

# Upload files
ftp_upload();

$ftp->quit;

########################## SUBROUTINES ##########################

# Read script configuration from the xml config file
sub get_config {
	# Read the XML config file
	my $xml = new XML::Simple(NormaliseSpace => '2', keyattr => ['name'], ForceArray => ['item'] );
    $config = $xml->XMLin($settings_file);
	print Dumper($config);
}

# add the password passed through the commandline to the config hash
sub get_password {
	if (defined($ARGV[0])){
		$config->{settings}->{password} = $ARGV[0];	
	} else {
		die "Please pass the ftp password as command line argument!\n";
	}
}

# Connect to the FTP server with the settings from the XML file
sub ftp_connect {

	my $host = $config->{settings}->{host};
	my $user = $config->{settings}->{user};
	my $pass = $config->{settings}->{password};
	
	$ftp = Net::FTP->new($host, Timeout=>240) or die "Could not create ftp object";
	$ftp->binary;
	$ftp->login($user, $pass) or die "Could not login :", $ftp->message;
	
}

# Upload the files to the correct folders on the server
sub ftp_upload {
	
	my $folder;
	my $file;
	
	foreach $folder (keys %{$config->{folder}}){
		# Change to the correct folder on the server 
		$ftp->cwd($folder) or die "Could not change to folder : ", $ftp->message;	
		
		# Put the files up...			
		foreach $file (keys %{$config->{folder}->{$folder}->{item}}){
			ftp->put($file) or die "Could not upload file : ", $ftp->message;
		}
		
		# Go back to root folder
		$ftp->cwd('..');
	}
}