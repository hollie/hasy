#noloop=start
$blinds_command = new Voice_Cmd 'Send blinds [up,down,stop,sun1,sun45]';
my $sunblinds_enabled =0;
#noloop=stop

if ($state = state_changed $blinds_command) {
	print_log "Sending blinds to position '$state'\n";
	#net_mail_send(text => "Sending blinds to position '$state'\n");
	run "/Users/lieven/projects/home/netnode/software/blind_control/blinds_send_command.pl $state";
}

# Determine if we need sunblinding
if (new_minute) {

	$sunblinds_enabled = 0;
	# We need sunblinds if it is too hot inside and if the sun is present
	if ($venti_int_in->state >= 22 and $sa_lightlevel->measurement > 95) {
		$sunblinds_enabled = 1;
	}

	#print_log "Sunblinds enabled = $sunblinds_enabled because Season = $Season and TempOutdoor = " . $Weather{TempOutdoor};
	print_log "Sunblinds_enabled state == $sunblinds_enabled";
}

if (new_minute) {
	
    # Get current lightlevel
    my $lightlevel = $sa_lightlevel->measurement();
    # Verify we got a recent reading from the gateway, to avoid updating item states based on old values
    my $recent = ($sa_lightlevel->get_idle_time()<130) ? 1 : 0;
    #my $idletime = $sa_lightlevel->get_idle_time();
    #::print_log("Idletime currently is $idletime, recent is $recent");
        
    # If the blinds are down
    if (state $blinds_command eq 'down') {
	    # When the sensornode is down and we have sunrise, blinds go up unless we 
   		# have a sunrise before 06:30
    	if (time_greater_than "06:30" and time_greater_than "$Time_Sunrise - 0:10" and time_less_than "10:00" and !$recent and $Weekday) {
    		print_log "Blinds up based on caclulated lightlevel";
    		set $blinds_command 'up';
    	}
    	
    	if (time_greater_than "07:00" and time_greater_than "$Time_Sunrise - 0:10" and time_less_than "10:00" and !$recent and $Weekend) {
    		print_log "Blinds up based on caclulated lightlevel";
    		set $blinds_command 'up';
    	}
    	    
   		# When sensornode is active and it tells us it is light, send blinds up
    	# unless we are before "06:30" on weekdays
    	if ($recent and time_greater_than "06:30" and $lightlevel > 20 and $Weekday) {
    		print_log "Blinds up based on lightlevel == $lightlevel on a weekday";
    		set $blinds_command 'up';
    	}
    	
   		# When sensornode is active and it tells us it is light, send blinds up
    	# unless we are before "07:00" during the weekend
    	if ($recent and time_greater_than "07:00" and $lightlevel > 20 and $Weekend) {
    		print_log "Blinds up based on lightlevel == $lightlevel in the weekend";
    		set $blinds_command 'up';
    	}
    	
    	# Send the blinds up at 8:30 at the latest
    	if (time_now('8:30')) {
    		set $blinds_command 'up';
    	}
    
    }
    
    # If the blinds are not down
    if (state $blinds_command ne 'down' and time_greater_than('12:00')) {
    	# When the sensornode is down and it becomes dark, put the blinds down
    	if (!$recent and (time_now("$Time_Sunset + 00:15"))) {
    		print_log "Blinds down based on calculated lightlevel";
    		set $blinds_command 'down';
    	}
    
    	# When the sensornode is up and it becomes dark, put the blinds down
    	if ($recent and $lightlevel < 15) {
    		print_log "Blinds down based on lightlevel == $lightlevel";
	    	set $blinds_command 'down'
    	}
    }
    
    # Sunscreen mode based on the start conditions 
    # defined in the $sunblinds_enabled setter higher in this file.
    set $blinds_command 'sun1'   if (time_now "08:30" and $sunblinds_enabled);
    set $blinds_command 'sun45'  if (time_now "12:00" and $blinds_command->state() eq 'sun1');
    set $blinds_command 'unsun1' if (time_now "15:30" and $blinds_command->state() eq 'sun45');
  	set $blinds_command 'up'     if (time_now "17:30" and $blinds_command->state() eq 'unsun1');
  	
  	# If during the day the lightlevel drops, put the blinds out of sunscreen mode
  	if (time_greater_than "09:00" and time_less_than "16:00" and !$sunblinds_enabled and $blinds_command->state() ne 'up' and $Season eq 'Summer') {
  		set $blinds_command 'up';
  	}
  	
}