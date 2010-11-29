#if ($humidity_in->state_now){
#	print_log "Received data from humidity sensor.";
#}

if ($venti_int_in->state_now){
	print_log "Received data from venti unit: extracted internal air temp is " . $venti_int_in->state;
}
if ($venti_int_uit->state_now){
	print_log "Received data from venti unit: injected internal air temp is " . $venti_int_uit->state;
}
if ($venti_ext_in->state_now){
	print_log "Received data from venti unit: external air input temp is " . $venti_ext_in->state;
}
if ($venti_aww_uit->state_now){
	print_log "Received data from venti unit: aww exhaust air temp is " . $venti_aww_uit->state;
}

if ($pv_yield->state_now){
	print_log "Pv current yield is " . $pv_yield->state . " W";
}

# Map xPL messages to weather variables
#$sa_humidity_int -> map_to_weather('HumidInside', 'RH binnen');

if ($Reload) {
   $plugwise_gateway->request_stat();
   
}
 


 
# Switch on the desklight if it is getting dark
my $desklight_auto_on_allowed = 0;

my $desklight_off_time = "21:58";


if (new_minute) {
	
    # Get current lightlevel
    my $lightlevel = $sa_lightlevel->measurement();
    # Verify we got a recent reading from the gateway, to avoid updating item states based on old values
    my $recent = ($sa_lightlevel->get_idle_time()<130) ? 1 : 0;
    #my $idletime = $sa_lightlevel->get_idle_time();
    #::print_log("Idletime currently is $idletime, recent is $recent");
    
    # Make sure we enable auto_allow_on 
    if ($lightlevel > 70 and $recent and time_between('12:00', $desklight_off_time)) {
		$desklight_auto_on_allowed = 1;
    }
    
    # Switch lights on after 17:30
    if ($lightlevel < 30 and $desklight_auto_on_allowed and $recent and time_between('17:30', $desklight_off_time)){
		&::print_log("It is dark outside ($lightlevel %), switching lights on...");
		$desklight->set("ON");
		$kat_lamp->set("ON");
		$desklight_auto_on_allowed = 0;
    }

	# Switch lights off when we go to bed
    if (time_now($desklight_off_time)) {
    	&::print_log("Time to go to sleep, switch lights off...");
       	$desklight->set("OFF");
       	$kat_lamp->set("OFF");
		$desklight_auto_on_allowed = 0;
    }
    
}

#my $sb_keuken = new xPL_Item('slimdev-slimserv.keuken');

