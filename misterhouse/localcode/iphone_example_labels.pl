$gEG               = new Group;
$gEG               -> set_label('Beneden');
$gEG               -> set_icon('eg1');
#$gEG               -> add($Living);
#$Living            -> set_label('Living');
#$Living            -> set_icon('flur');
$desklight         -> set_icon('lampe');
$desklight         -> set_label('Bureau');
$kat_lamp          -> set_icon('lampe');
$kat_lamp          -> set_label('Zithoek');

$radio_living      -> set_label('Radio');
$radio_living      -> set_icon('video');
#$gEG               -> add($Keuken);
#$Keuken            -> set_icon('kueche');
#$Keuken            -> set_label('Keuken');
$radio_keuken      -> set_label('Radio');
$radio_keuken      -> set_icon('video');


$gOG               = new Group;
$gOG               -> set_label('Boven');
$gOG               -> set_icon('og2');

$Radios            -> set_icon('video');
$Radios            -> set_label('Radios');

# if label starts with a ":" there will be no hyperlink to change the object

$gWeather = new Group;
$gWeather -> set_label('Weer');
$gWeather -> set_icon('temperatur');
$sa_lightlevel -> set_label('Lichtniveau [%i%%]');
$gWeather -> add($sa_lightlevel);

$Main = new Group;
$Main -> add($desklight);
$Main -> add($kat_lamp);
$Main -> add($gWeather);
#$Main -> add($Radios);

