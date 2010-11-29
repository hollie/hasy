
#noloop=start
my $orcon_address = "oswald06:10001";

$set_venti_normal = new Voice_Cmd 'Set ventilation to normal speed';
$set_venti_low    = new Voice_Cmd 'Set ventilation to low speed';
$orcon_client = new Socket_Item(undef, undef, $orcon_address, 'orcon', 'tcp', 'raw');
#noloop=stop

if (said $set_venti_normal) {
	speak "Setting ventilation system to normal speed";
	start $orcon_client;
       
	
	set $orcon_client "venti normal\n";

	if (my $data = said $orcon_client){
		print_log "Orcon said: $data";
	}
	stop $orcon_client;
}

if (said $set_venti_low) {
	speak "Setting ventilation system to low speed";

}
