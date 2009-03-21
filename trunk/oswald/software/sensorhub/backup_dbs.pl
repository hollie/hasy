#! /usr/bin/perl

use lib qw( /opt/lib/perl );

use Net::FTP;

my $db_folder = "ventilatie";
my $aww_uit = "$db_folder/aww_uit.rrd";
my $int_in  = "$db_folder/unit_int_in.rrd";
my $int_uit = "$db_folder/unit_int_uit.rrd";
my $ebos    = "$db_folder/ebos.rrd";

my $host    ="ftp.lika.be";
my $ftp_user = "stats\@lika.be";
my $ftp_password;

# Get the FTP password from the command line
if (defined($ARGV[0])){
	$ftp_password = $ARGV[0];	
} else {
	die "Please pass the ftp password as command line argument!\n";
}


# Upload the databases to the website for backup
my $ftp = Net::FTP->new($host, Timeout=>240) or die "Could not create ftp object";

$ftp->binary;

$ftp->login($ftp_user, $ftp_password) or die "Could not login :", $ftp->message;

print "DB backup logged in...\n";

$ftp->cwd("/$db_folder") or die "Could not change to folder : ", $ftp->message;


print "DB backup changed to dest folder...\n";

$ftp->put($aww_uit) or die "Could not upload file : ", $ftp->message;
print "DB 1 upload done...\n";

$ftp->put($int_in)  or die "Could not upload file : ", $ftp->message;
print "DB 2 upload done...\n";

$ftp->put($int_uit)  or die "Could not upload file : ", $ftp->message;
print "DB 3 upload done...\n";

$ftp->put($ebos)  or die "Could not upload file : ", $ftp->message;
print "DB 4 upload done...\n";

$ftp->quit;

print "Database backup uploaded to website...\n";


