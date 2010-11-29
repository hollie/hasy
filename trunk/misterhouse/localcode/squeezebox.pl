# Category=Audio

# Uses the xPL_Squeezebox module to interface with Squeezeboxes.
# The main idea is to be able to perform basic control of the
# Squeezebox, and to be able to turn the amplifier that is connected
# to the Squeezebox on and off.
#
# For the time being, a timer is set to query the state of the 
# Squeezeboxes because not all actions of a Squeezebox 
# generate the required xPl messages. 

#noloop=start
$sb_stop =   new Voice_Cmd 'Stop squeezebox [keuken,living,wekker]'; 
$sb_report = new Voice_Cmd 'Report squeezebox state'; 
$sb_status_req_timer = new Timer;
set $sb_status_req_timer 10;
$sb_keuken->manage_heartbeat_timeout(360, "speak 'Squeezebox keuken is niet online'", 1);
$sb_living->manage_heartbeat_timeout(360, "speak 'Squeezebox living is niet online'", 1);
my $device;
#noloop=stop

# Handle changes in the state of a squeezebox
if ( $state = $sb_living->state_now() ){
	control_amp('living', $state, $radio_living);
}

if ( $state = $sb_keuken->state_now() ){
	control_amp('keuken', $state, $radio_keuken);
}

# Request the state of every squeezebox periodically
# This needs to be done as long as not all events on a squeezebox are 
# generating an xpl message. 
if (expired $sb_status_req_timer) {
	set $sb_status_req_timer 15;
	xPL_Squeezebox::request_all_stat();
}

# Stop one of the squeezeboxes based on a voice command
if ($device = said $sb_stop) {
	$sb_keuken->send_cmnd('audio.slimserv' => {'command' => 'stop'}) if ($device eq "keuken");
	$sb_living->send_cmnd('audio.slimserv' => {'command' => 'stop'}) if ($device eq "living");
	$sb_wekker->send_cmnd('audio.slimserv' => {'command' => 'stop'}) if ($device eq "wekker");
	
}

# Report the status of the squeezeboxes
if (said $sb_report) {
	print_log "Squeezebox keuken: " . $sb_keuken->state();
	print_log "Squeezebox living: " . $sb_wekker->state();
	print_log "Squeezebox wekker: " . $sb_wekker->state();		
}

# Control an amplifier that is connected to a squeezebox. When the SB is playing
# the amplifier is switched on.
# Pass as parameters a name for the squeezebox, the state of the squeezebox and 
# the amplifier that needs to be controlled.
sub control_amp {
	my $nicename = shift();
	my $status = shift();
	my $amp = shift();
	
	# Catch invalid invocation of the function
	if (!defined($status) || !defined($amp)){
		print "Pass squeezebox name, status and amplifier device as parameters to 'control_amp!";
		return;
	}
	
	if ($status eq 'next' || $status eq 'volumeup' || $status eq 'volumedown') {
		print_log "Squeezebox $nicename status is now " . $status;
		return;
	}
	
	
	print_log "Squeezebox $nicename is now $status, switching amplifier accordingly";
	
	
	if ($status eq 'playing') {
		set $amp ON;
	} else {
		set $amp OFF;
	}
	
}
