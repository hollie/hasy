#!/usr/bin/perl -w

use strict;
use Switch;
use xPL::Client;

my $msg=xPL::Client->new ( vendor_id => 'bnz', device_id => 'test', );

if (!defined($ARGV[1])){
	die "Please pass node ID and command as parameters";
}

my $id = $ARGV[0];
my $command = $ARGV[1];

switch ($command) {
case 'set_on'  { $msg->send_from_string ("-m xpl-cmnd -c plugwise.basic command=on device=\"$id\"");}
case 'set_off' { $msg->send_from_string ("-m xpl-cmnd -c plugwise.basic command=off device=\"$id\"");}
case 'stat'    { $msg->send_from_string ("-m xpl-cmnd -c plugwise.basic command=status device='$id'"); }
case 'query'   { $msg->send_from_string ("-m xpl-cmnd -c plugwise.basic command=query_connected_circles");}
else { print "Unknown command!"; die;}
};

=head2 Switch ON (or OFF) a Circle

	$msg->send_from_string ("-m xpl-cmnd -c plugwise.basic command=on device='xxxxxx'");

	device='xxxxxx[,yyyyyy,zzzzzz, ...]' comma seperated list of mac-adresses (Last 6 digits)
	command=on|off (Switch a circle ON or OFF)

	The resulting xpl-trig message will confirm the status of the Circle
=cut


=head2 Power Info

	$msg->send_from_string ("-m xpl-cmnd -c plugwise.basic command=powerinfo device='37b4a7'");

	A power info request will return the following xpl-trig message:

		[xpl-trig/plugwise.basic: bnz-plugwise.debian -> * - powerinfo 37B4A7]
		plugwise.basic
		{
			command=powerinfo
			device=37B4A7
			pulse1sec=001E		(Current energy consumption - 1 second average)
			pulse8sec=001F		(Current energy consumption - 8 second average)
			unknown=000132C3	(Meaning yet unknown)
		}
=cut
#$msg->send_from_string ("-m xpl-cmnd -c plugwise.basic command=powerinfo device='469D91'");

=head2 Calibration info

	$msg->send_from_string ("-m xpl-cmnd -c plugwise.basic command=calibrate device='37b4a7'");

	Retrieves the calibration info from a circle. This info is needed to accurately calculate
	enegry consumption. The resulting xpl-trig message will return the following info:
	(The 8 digit numbers are just examples and will differ per Circle)

	[xpl-trig/plugwise.basic: bnz-plugwise.debian -> * - calibrate 37B4A7]
	plugwise.basic
	{
		command=calibrate
		device=37B4A7
		gaina=3F7CD762		(GainA)
		gainb=B5AFB9FB		(GainB)
		offtot=3C093941		(OffTot)
		offruis=00000000	(OffRuis)
	}
=cut
#$msg->send_from_string ("-m xpl-cmnd -c plugwise.basic command=calibrate device='37b4a7'");

=head2 Status

	$msg->send_from_string ("-m xpl-cmnd -c plugwise.basic command=status device='37b4a7'");

	This will request the status of a Circle. The resulting xpl-trig message will return this:

	[xpl-trig/plugwise.basic: bnz-plugwise.debian -> * - status 37B4A7]
	plugwise.basic
	{
		command=status
		device=37B4A7
		lastlog=00045770	(Last logaddress. First logaddress is always 00044000)
		abshour=00004553	(Hours passed since 1 june 2007 02:00)
		onoff=off		(Current status of a circle)
		hwver=000004730007	(Hardware version of a circle)
	}
=cut
#$msg->send_from_string ("-m xpl-cmnd -c plugwise.basic command=status device='469D91'");


=head2 Powerbuffer

	This will request powerbuffer information from the logaddress you specify:

	$msg->send_from_string ("-m xpl-cmnd -c plugwise.basic command=powerbuf lastlog='xxxxxxxx' device=\"37b4a7\"");

	Lastlog is the log-address from which you want to fetch powerbuffer info. The resulting xpl-trig message
	will look something line this:

	[xpl-trig/plugwise.basic: bnz-plugwise.debian -> * - powerbuf 37B4A7]
	plugwise.basic
	{
		command=powerbuf
		device=37B4A7
		firstbuf=00004224	(First buffer - Hours passed since 1 jun 2007 02:00)
		secondbuf=00004225	(Second buffer - Hours passed since 1 jun 2007 02:00)
		thirdbuf=00004226	(Third buffer - Hours passed since 1 jun 2007 02:00)
		fourthbuf=00004227	(Fourth buffer - Hours passed since 1 jun 2007 02:00)
		firstpulse=00000005	(Number of pulses counted during first hour)
		secondpulse=00017F67	(Number of pulses counted during second hour)
		thirdpulse=0001ADAF	(Number of pulses counted during third hour)
		fourthpulse=0001DE33	(Number of pulses counted during fourth hour)
		curlogaddr=00044000	(The logaddress that was requested)
	}
=cut
#$msg->send_from_string ("-m xpl-cmnd -c plugwise.basic command=powerbuf lastlog=\"00044000\" device=\"37b4a7\"");
