#!/usr/bin/env perl -w

use strict;
use xPL::Client;

use Data::Dumper;

my $xpl=xPL::Client->new ( vendor_id => 'hollie', device_id => 'netmon' );

$xpl->add_xpl_callback(id => "xpl",
                       self_skip => 1, targetted => 0,
                       callback => \&parse_response);
                       
$xpl->add_timer(id => "query_meter", timeout => 15*60, callback => \&query_meter);


# Run the main loop
$xpl->main_loop();


sub query_meter {

$xpl->send_from_string("-t hollie-utilmon.meter -m xpl-cmnd -c sensor.request command=current device=water");
sleep(1);
$xpl->send_from_string("-t hollie-utilmon.meter -m xpl-cmnd -c sensor.request command=current device=gas");
}


sub parse_response {

  my %p = @_;
  my $msg = $p{message};
  my $peeraddr = $p{peeraddr};
  my $peerport = $p{peerport};
  my $time = time;
  my $c = chr(0);

	#print Dumper($msg);
	
	if ($msg->message_type eq "xpl-stat" && $msg->class eq "sensor" && $msg->class_type eq "basic" &&
      $msg->device && $msg->type eq "count") {
      print "Received count for " . $msg->device . " : " . $msg->current . "\n";
	}	

}
#sleep(2);
#$msg->send_from_string("-t hollie-utilmon.meter -m xpl-cmnd -c sensor.request command=current device=water");
#sleep(2);
#$msg->send_from_string("-t hollie-utilmon.meter -m xpl-cmnd -c sensor.request command=current device=water");
#sleep(2);
#$msg->send_from_string("-t hollie-utilmon.meter -m xpl-cmnd -c sensor.request command=current device=elec");
#sleep(2);
#$msg->send_from_string("-t hollie-utilmon.meter -m xpl-cmnd -c sensor.request command=current device=gas");
#sleep(2);



#use xPL::Message;
#my $msg = xPL::Message->new(message_type => 'xpl-cmnd',
#						head => 
#						{
#						 hop => 1,
#						 source => 'hollie-netmon.mini',
#						 target => '*',
#						},
#						class => 'sensor.request',
#						body =>
#						{
#						 command => 'current',
#						 device => 'gas',
#						},
#					);
#					
#					
#$msg->send();

exit(0);

