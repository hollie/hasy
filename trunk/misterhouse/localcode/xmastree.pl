#Category=Lights
#
#
#@ Control the xmas tree lights. This file creates a mode that allows to switch off
#@ the control of the socket where the xmas tree lights are connected to when
#@ it is not required to control them (the larger part of the year ;-))
#
# by Lieven Hollevoet

#noloop=start
$xmastree_command = new Voice_Cmd 'Send xmastree to [on,off]';
my $sunblinds_enabled =0;
#noloop=stop

# Create a mode so we can disable the xmas tree ligt switching when it is not required
$mode_xmastree = new Generic_Item;       #noloop
$mode_xmastree->set_states('on', 'off'); #noloop

if (state_changed $mode_xmastree) {
	my $xmastree_state = state $mode_xmastree;
	main::print_log "Xmas tree autolights = ", $xmastree_state;
		
	if ($xmastree_state eq 'off') {
		$kerstboom->set(OFF);
	}
}

sub conditionally_set_xmastree {
	my $cmnd = shift();
	
	if ($mode_xmastree->state() eq 'on') {
		main::print_log "Setting kerstboom to " . $cmnd;
		$kerstboom->set($cmnd);
	} else {
		main::print_log "Xmas tree not set because mode is not 'on' but " . $mode_xmastree->state();
	}
}

if ($state = state_changed $xmastree_command) {
	print_log "Conditionally setting xmastree to '$state'\n";
	#net_mail_send(text => "Sending blinds to position '$state'\n");
	conditionally_set_xmastree($state);
}