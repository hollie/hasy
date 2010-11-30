#Category=Monitoring
#
#
#@ Monitor the output of a php script, when it contains less than
#@  a defined number of lines, send a notification email.
#@
#@ $Revision$
#@
#@ Set in mh.ini the following parameters
#@    monitor_php_url to the URL that needs to be monitored
#@    monitor_php_lc  to the linecount that needs to be present
# by Lieven Hollevoet

# noloop=start
my $php_url = lc($config_parms{monitor_php_url});
my $php_lc  = $config_parms{monitor_php_lc};

$php_url = "http://www.example.com/test.php" unless $php_url;
$php_lc  = 5 unless $php_lc;

my $monitor_php_file=$config_parms{data_dir}.'/web/monitor_php.txt';

$p_monitor_php_page = new Process_Item(qq{get_url -quiet "$php_url" "$monitor_php_file"});

$v_get_php_output = new Voice_Cmd('Get php output');

my $allow_email_notification = 1;

# noloop=stop

# Set up a trigger to get the php output
if ($Reload) {

	# Make sure the trigger is installed when the monitor state is on
	if ($mode_webtmr_moni->state() eq 'on') {
		&install_monitor_php();
	}
}

# And allow to manually override the trigger for immediate action
if (said $v_get_php_output) {
	start $p_monitor_php_page;
	$v_get_php_output->respond('Reading the php output from the web');
}

# Activate the processing of the file we got from the web
if (done_now $p_monitor_php_page or $Reload) {
	&process_php;
}

# Be sure to reset the allow_email_notification once a day
if ($New_Minute and time_now("07:00")) {
	$allow_email_notification = 1;
}

# The actual processing is done here
sub process_php {
	my $html=file_read $monitor_php_file;
	return unless $html;

	my @lines = split(/<br \/>/, $html);
	my $count = scalar @lines;

	if ($count < $php_lc) {
		net_mail_send(text => "The status of the web timer device only contains only contains $count lines. It should contain $php_lc lines.\n\nPlease restart the web timer device to re-enable connectivity to the net.\n\nRegards,\n MisterHouse.", subject => "Misterhouse PHP monitor") if ($allow_email_notification);
		$allow_email_notification = 0;
	} else {
		print_log("The php script at $php_url contains $count lines. OK!");
	}

}

# Disable/enable the triggers for the monitoring
sub uninstall_monitor_php {
	&trigger_delete('Monitor the php script output');
	print_log("Trigger removed for monitor_php");
}

sub install_monitor_php {
	&trigger_set('$New_Minute and $Minute == 1', '$p_monitor_php_page->start', 'NoExpire', 'Monitor the php script output')
		unless &trigger_get('Monitor the php script output');
	print_log("Trigger installed for monitor_php");
}

# Create a mode so we can disable this check if required
$mode_webtmr_moni = new Generic_Item;
$mode_webtmr_moni->set_states('on', 'off');

if (state_changed $mode_webtmr_moni) {
	my $webtmr_moni_state = state $mode_webtmr_moni;
	main::print_log "Webtmr monitoring = ", $webtmr_moni_state;
	
	if ($webtmr_moni_state eq 'on') {
		&install_monitor_php();
	}
	
	if ($webtmr_moni_state eq 'off') {
		&uninstall_monitor_php();
	}
}