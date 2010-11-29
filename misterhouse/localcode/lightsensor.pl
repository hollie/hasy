# Category = Weather

#@ This script collects information from the wireless light level node located in our
#@ garden. The sensor reports its values to the wireless gateway that has an 
#@ ethernet inteface.
#@ Set the weather_lightsensor_host to the correct value for your network.
#@ Example: weather_lightsensor_host = example_server
#@
#@ Additionally, add to your items.mht an entry:
#@ ANALOG_SENSOR, lightlevel, sa_lightlevel
#
#
# 01/09/2009 created by Lieven Hollevoet.

#noloop=start
# Get the lightsensor gateway host from the ini file
my $lightsensor_host = $config_parms{'weather_lightsensor_host'} if $config_parms{'weather_lightsensor_host'};
if (!defined($lightsensor_host)) { print_log "To use the lightsensor script, please define 'weather_lightsensor_host' in your ini file!" };
$lightsensor_host = &escape($lightsensor_host);

# Make a socket item to communicate
$sensor_host = new  Socket_Item(undef, undef, $lightsensor_host.":10001");

# And create the voice commannds
$v_report_lightlevel = new Voice_Cmd 'What is the current lightlevel';
$v_report_lightlevel ->set_info('Report the current lightlevel');

#noloop=stop

# Start a connection and request data every minute or at start
if (new_minute || $Reload) {
    unless (active $sensor_host) {
	#print_log "Start a connection to sensor gateway";
	start $sensor_host;
    }
    # Request data from the client
    if (active $sensor_host){
  	set $sensor_host "?\n";
    }
}

# Process the response of the sensor node
if (my $data = said $sensor_host) {
    
    # If we get the End Of Transmission sequence, close the connection
    if ($data =~ /EOT/) {
	#print_log "Closing socket connection";
	stop $sensor_host;
    }
    
    # Parse the data for node 1: the lightlevel node
    if ($data =~ /Node 1:\s+([0-9A-F]{2})\s+([0-9A-F]{2})\s+([0-9A-F]{2})\s+([0-9A-F]{2})/) {
	my $solar_adc   = $1;
	#my $vcc_adc     = $2;
	my $temp_adc    = $3;
	my $report_age  = hex($4);
	
	#my $temperature = ((hex($temp_adc) / 255 * 2.5) - .6) * 100;
	
	# Convert solar/vcc to voltage values
	my $solar = int((hex($solar_adc) / 255 * 100)+.5);
	my $solar_prnt = sprintf("%i", $solar);
	#my $vcc   = 2.5 * 255 / hex($vcc_adc);
	
	#print_log "Solar lightlevel is now $solar_prnt \% and the report is $report_age ticks old" if ($report_age < 250);
	if ($report_age < 250) {
	    #$Weather{'Lightlevel'} = $solar;
	    $sa_lightlevel->measurement($solar);
	} else {
	    #undef $Weather{'Lightlevel'};
	}
	
    }
    #print_log "Lightsensor data: $data";
}

# Report the current lightlevel
if (said $v_report_lightlevel){

    my $lvalue = $sa_lightlevel->measurement;

    speak "The current lightlevel outside is $lvalue percent."; 

}
