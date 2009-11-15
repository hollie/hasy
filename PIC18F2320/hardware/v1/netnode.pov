//POVRay-File created by 3d41.ulp v1.04
//d:/hollevo/projects/personal/svn/hasy/trunk/netnode/hardware/netnode/netnode.brd
//24/07/2006 14:04:29 

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 0;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare environment = on;

#local cam_x = 0;
#local cam_y = 250; //339
#local cam_z = -181;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -7;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = -60;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 18;
#local lgt1_pos_y = 45;
#local lgt1_pos_z = 41;
#local lgt1_intense = 0.755631;
#local lgt2_pos_x = -18;
#local lgt2_pos_y = 45;
#local lgt2_pos_z = 41;
#local lgt2_intense = 0.755631;
#local lgt3_pos_x = 18;
#local lgt3_pos_y = 45;
#local lgt3_pos_z = -28;
#local lgt3_intense = 0.755631;
#local lgt4_pos_x = -18;
#local lgt4_pos_y = 45;
#local lgt4_pos_z = -28;
#local lgt4_intense = 0.755631;

//Do not change these values
#declare pcb_hight = 1.500000;
#declare pcb_cuhight = 0.035000;
#declare pcb_x_size = 49.265000;
#declare pcb_y_size = 79.045000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(879);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "tools.inc"
#include "user.inc"

global_settings{charset utf8}

#if(environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-24.632500,0,-39.522500>
}
#end

background{col_bgr}


//Axis uncomment to activate
//object{TOOLS_AXIS_XYZ(100,100,100 //texture{ pigment{rgb<1,0,0>} finish{diffuse 0.8 phong 1}}, //texture{ pigment{rgb<1,1,1>} finish{diffuse 0.8 phong 1}})}

light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro NETNODE(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<-0.630000,0.165000><48.635000,0.165000>
<48.635000,0.165000><48.635000,79.210000>
<48.635000,79.210000><-0.630000,79.210000>
<-0.630000,79.210000><-0.630000,0.165000>
texture{col_brd}}
}//End union(Platine)
//Holes(real)/Parts
cylinder{<10.850000,1,23.470000><10.850000,-5,23.470000>1.650000 texture{col_hls}}
cylinder{<10.850000,1,35.770000><10.850000,-5,35.770000>1.650000 texture{col_hls}}
cylinder{<22.225000,1,68.580000><22.225000,-5,68.580000>1.650000 texture{col_hls}}
cylinder{<10.795000,1,68.580000><10.795000,-5,68.580000>1.650000 texture{col_hls}}
cylinder{<38.735000,1,68.580000><38.735000,-5,68.580000>1.650000 texture{col_hls}}
cylinder{<27.305000,1,68.580000><27.305000,-5,68.580000>1.650000 texture{col_hls}}
cylinder{<6.600000,1,42.230000><6.600000,-5,42.230000>1.650000 texture{col_hls}}
cylinder{<6.600000,1,52.390000><6.600000,-5,52.390000>1.650000 texture{col_hls}}
//Holes(real)/Board
cylinder{<44.315000,1,3.810000><44.315000,-5,3.810000>2.500000 texture{col_hls}}
cylinder{<3.810000,1,3.810000><3.810000,-5,3.810000>2.500000 texture{col_hls}}
cylinder{<3.810000,1,74.930000><3.810000,-5,74.930000>2.500000 texture{col_hls}}
cylinder{<44.385000,1,74.930000><44.385000,-5,74.930000>2.500000 texture{col_hls}}
//Holes(real)/Vias
cylinder{<7.500000,0.095000,15.930000><7.500000,-1.595000,15.930000>1.650000 texture{col_hls}}
cylinder{<10.600000,0.095000,11.140000><10.600000,-1.595000,11.140000>1.650000 texture{col_hls}}
cylinder{<13.600000,0.095000,15.930000><13.600000,-1.595000,15.930000>1.650000 texture{col_hls}}
cylinder{<22.750000,0.095000,21.590000><22.750000,-1.595000,21.590000>1.050000 texture{col_hls}}
cylinder{<22.750000,0.095000,37.640000><22.750000,-1.595000,37.640000>1.050000 texture{col_hls}}
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_B1) #declare global_pack_B1=yes; object {SWITCH_SKHH_V_4_3MM_YELL()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<36.100000,0.000000,7.160000>}#end		//Tactile switch B1 9902031 PUSHBUTTON
//#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0805(Darkwood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<16.220000,0.000000,19.480000>translate<0,0.035000,0>  }#end		//SMD Elko Case-Code BCComponents (rcl.lib) C1 10u/7565127 CHIPCAP
//#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_0805(Darkwood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<16.220000,0.000000,19.480000>translate<0,0.035000,0>  }#end		//SMD Elko Case-Code BCComponents (rcl.lib) C2 10u/7565127 CHIPCAP
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<21.6000,0.000000,3.600000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C3 100nF/9753591 C0805
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<12.47000,0.000000,2.070000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C3 100nF/9753591 C0805
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<16.220000,0.000000,19.480000>translate<0,0.035000,0> }#end		//SMD Capacitor 0805 C3 100nF/9753591 C0805
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<33.020000,-1.500000,48.260000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C4 100nF/9753591 C0805
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0805(DarkWood)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<22.860000,-1.500000,7.620000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0805 C5 100nF/9753591 C0805
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_SMD_SO28W("PIC18F2320","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<30.480000,0.000000,47.600000>translate<0,0.035000,0> }#end		//SMD IC SO28-Wide Package IC1 PIC18F2320/9762051 SO-28W
//#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {TR_TO92_L("1087165",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<13.970000,0.000000,7.620000>}#end		//TO92 straight vertical IC2 1087165 78XXS
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {TR_TO220_S_GRND("1087165",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<13.970000,0.000000,7.620000>}#end		//TO92 straight vertical IC2 1087165 78XXS
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {PH_1X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<27.970000,0.000000,7.590000>}#end		//Jumper 2,54mm Grid 3Pin 1Row (jumper.lib) JP1  JP2
#ifndef(pack_LTX) #declare global_pack_LTX=yes; object {DIODE_SMD_LED_CHIP_1206(Green,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<26.670000,0.000000,15.240000>translate<0,0.035000,0> }#end		//SMD-LED im 1206 LTX  CHIPLED_1206
#ifndef(pack_PIC) #declare global_pack_PIC=yes; object {DIODE_SMD_LED_CHIP_1206(Blue,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<30.480000,0.000000,15.240000>translate<0,0.035000,0> }#end		//SMD-LED im 1206 PIC  CHIPLED_1206
#ifndef(pack_PWR) #declare global_pack_PWR=yes; object {DIODE_SMD_LED_CHIP_1206(Yellow,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<22.860000,0.000000,15.240000>translate<0,0.035000,0> }#end		//SMD-LED im 1206 PWR  CHIPLED_1206
#ifndef(pack_Q1) #declare global_pack_Q1=yes; object {IC_SMD_SOT23("BC547","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<39.370000,0.000000,24.130000>translate<0,0.035000,0> }#end		//SOT23 Q1 1081235 SOT23
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0603("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<19.050000,-1.500000,10.160000>translate<0,-0.035000,0> }#end		//SMD Resistor 0603 R1  R0603
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0603("0R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<19.920000,0.000000,18.750000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R2  R0603
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_0603("0R0",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<34.290000,-1.500000,20.320000>translate<0,-0.035000,0> }#end		//SMD Resistor 0603 R3  R0603
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_0603("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<44.450000,0.000000,26.670000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R5 10k/9331700 R0603
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_SMD_CHIP_0603("471",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<44.450000,0.000000,22.860000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R6 470k/612807RL R0603
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_SMD_CHIP_0603("1R0",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<43.180000,0.000000,30.480000>translate<0,0.035000,0> }#end		//SMD Resistor 0603 R7 1k/9331697RL R0603
#ifndef(pack_X2) #declare global_pack_X2=yes; object {DCPOWERCONNECTOR()translate<-2,0,8> rotate<0,90.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<0.000000,0.000000,13.430000>}#end		//DC power connector X2 DC10R/224959 DC10R
#ifndef(pack_X3) #declare global_pack_X3=yes; object {ARK_5MM_4()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<44.450000,0.000000,46.000000>}#end		//Screw Terminal conn. 4Pin (con-ptr500.lib) X3 SCREW_TERMINAL/3041438 SCREW_TERMINAL_8PINS
#ifndef(pack_X4) #declare global_pack_X4=yes; object {CON_RJ45()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<16.510000,0.000000,68.580000>}#end		//RJ45 X4 RJ45H RJ45H
#ifndef(pack_X5) #declare global_pack_X5=yes; object {CON_RJ45()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<33.020000,0.000000,68.580000>}#end		//RJ45 X5 RJ45H RJ45H
#ifndef(pack_X6) #declare global_pack_X6=yes; object {CON_RJ45()translate<0,0,0> rotate<0,0.000000,0>rotate<0,90.000000,0> rotate<0,0,0> translate<11.020000,0.000000,29.580000> scale<1.57,1,1>}#end		//RJ45 X5 RJ45H RJ45H
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(2.750000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<34.070000,0.000000,3.430000>}
object{TOOLS_PCB_SMD(2.750000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<34.070000,0.000000,10.160000>}
object{TOOLS_PCB_SMD(2.750000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.100000,0.000000,3.430000>}
object{TOOLS_PCB_SMD(2.750000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<38.100000,0.000000,10.160000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.965000,0.000000,5.035000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.965000,0.000000,2.235000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<14.190000,0.000000,2.155000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<11.390000,0.000000,2.155000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<17.070000,0.000000,19.480000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<15.370000,0.000000,19.480000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<33.020000,-1.537000,47.410000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<33.020000,-1.537000,49.110000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<23.710000,-1.537000,7.620000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.010000,-1.537000,7.620000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.687000,0.000000,39.370000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.687000,0.000000,40.640000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.687000,0.000000,41.910000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.687000,0.000000,43.180000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.687000,0.000000,44.450000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.687000,0.000000,45.720000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.687000,0.000000,46.990000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.687000,0.000000,48.260000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.687000,0.000000,49.530000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.687000,0.000000,50.800000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.687000,0.000000,52.070000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.687000,0.000000,53.340000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.687000,0.000000,54.610000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.687000,0.000000,55.880000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.400000,0.000000,55.880000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.400000,0.000000,54.610000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.400000,0.000000,53.340000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.400000,0.000000,52.070000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.400000,0.000000,50.800000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.400000,0.000000,49.530000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.400000,0.000000,48.260000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.400000,0.000000,46.990000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.400000,0.000000,45.720000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.400000,0.000000,44.450000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.400000,0.000000,43.180000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.400000,0.000000,41.910000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.400000,0.000000,40.640000>}
object{TOOLS_PCB_SMD(0.762000,1.270000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<25.400000,0.000000,39.370000>}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<13.970000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<11.430000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_IC2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.508000,1.000000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<16.510000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<27.970000,0,5.050000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<27.970000,0,7.590000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<27.970000,0,10.130000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<26.670000,0.000000,13.490000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<26.670000,0.000000,16.990000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<30.480000,0.000000,13.490000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<30.480000,0.000000,16.990000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.860000,0.000000,13.490000>}
object{TOOLS_PCB_SMD(1.500000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<22.860000,0.000000,16.990000>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.470000,0.000000,23.180000>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.470000,0.000000,25.080000>}
object{TOOLS_PCB_SMD(1.000000,1.400000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<38.270000,0.000000,24.130000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.050000,-1.537000,11.010000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<19.050000,-1.537000,9.310000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.920000,0.000000,17.900000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<19.920000,0.000000,19.600000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<34.290000,-1.537000,21.170000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<34.290000,-1.537000,19.470000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<45.300000,0.000000,26.670000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<43.600000,0.000000,26.670000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<43.600000,0.000000,22.860000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<45.300000,0.000000,22.860000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<44.030000,0.000000,30.480000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<42.330000,0.000000,30.480000>}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<19.740000,0,25.170000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<17.200000,0,26.440000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<19.740000,0,27.710000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<17.200000,0,28.980000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<19.740000,0,30.250000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<17.200000,0,31.520000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<19.740000,0,32.790000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<17.200000,0,34.060000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.116000,2.100000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<22.750000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.116000,2.100000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<22.750000,0,37.640000> texture{col_thl}}
#ifndef(global_pack_X2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(4.316000,3.300000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<13.600000,0,15.930000> texture{col_thl}}
#ifndef(global_pack_X2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(4.316000,3.300000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<10.600000,0,11.140000> texture{col_thl}}
#ifndef(global_pack_X2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(4.316000,3.300000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<7.500000,0,15.930000> texture{col_thl}}
#ifndef(global_pack_X3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<44.450000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_X3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<44.450000,0,39.370000> texture{col_thl}}
#ifndef(global_pack_X3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<44.450000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_X3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<44.450000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_X3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<44.450000,0,46.990000> texture{col_thl}}
#ifndef(global_pack_X3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<44.450000,0,49.530000> texture{col_thl}}
#ifndef(global_pack_X3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<44.450000,0,52.070000> texture{col_thl}}
#ifndef(global_pack_X3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.650000,1.100000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<44.450000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<20.955000,0,62.230000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<19.685000,0,59.690000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<18.415000,0,62.230000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<17.145000,0,59.690000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<15.875000,0,62.230000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<14.605000,0,59.690000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<13.335000,0,62.230000> texture{col_thl}}
#ifndef(global_pack_X4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<12.065000,0,59.690000> texture{col_thl}}
#ifndef(global_pack_X5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<37.465000,0,62.230000> texture{col_thl}}
#ifndef(global_pack_X5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<36.195000,0,59.690000> texture{col_thl}}
#ifndef(global_pack_X5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<34.925000,0,62.230000> texture{col_thl}}
#ifndef(global_pack_X5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<33.655000,0,59.690000> texture{col_thl}}
#ifndef(global_pack_X5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<32.385000,0,62.230000> texture{col_thl}}
#ifndef(global_pack_X5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<31.115000,0,59.690000> texture{col_thl}}
#ifndef(global_pack_X5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<29.845000,0,62.230000> texture{col_thl}}
#ifndef(global_pack_X5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-180.000000,0>translate<28.575000,0,59.690000> texture{col_thl}}
#ifndef(global_pack_X6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,0+global_tmp,0) rotate<0,-90.000000,0>translate<15.470000,0,50.500000> texture{col_thl}}
#ifndef(global_pack_X6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<12.930000,0,49.230000> texture{col_thl}}
#ifndef(global_pack_X6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<15.470000,0,47.960000> texture{col_thl}}
#ifndef(global_pack_X6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<12.930000,0,46.690000> texture{col_thl}}
#ifndef(global_pack_X6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<15.470000,0,45.420000> texture{col_thl}}
#ifndef(global_pack_X6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.408000,0.900000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<12.930000,0,44.150000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<26.670000,0,19.050000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<20.320000,0,2.540000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<33.020000,0,50.800000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<44.000000,0,21.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<38.700000,0,7.900000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<33.330000,0,40.400000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<40.640000,0,30.480000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<19.050000,0,12.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<34.300000,0,17.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<27.940000,0,39.370000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<27.940000,0,43.180000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<29.210000,0,52.070000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<27.440000,0,53.340000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<29.210000,0,38.100000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<29.210000,0,41.910000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<38.100000,0,45.720000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<41.910000,0,33.020000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.106400,0.700000,1,16,1,0) translate<27.140000,0,49.530000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.500000,0.000000,15.930000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.500000,0.000000,22.740000>}
box{<0,0,-0.406400><6.810000,0.035000,0.406400> rotate<0,90.000000,0> translate<7.500000,0.000000,22.740000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.500000,-1.535000,6.470000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.500000,-1.535000,15.930000>}
box{<0,0,-0.406400><9.460000,0.035000,0.406400> rotate<0,90.000000,0> translate<7.500000,-1.535000,15.930000> }
}cylinder{<7.500000,1,15.930000><7.500000,-2.500000,15.930000>1.650000 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.600000,-1.535000,14.340000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.600000,-1.535000,15.930000>}
box{<0,0,-0.406400><1.590000,0.035000,0.406400> rotate<0,90.000000,0> translate<13.600000,-1.535000,15.930000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.600000,-1.535000,14.340000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.510000,-1.535000,11.430000>}
box{<0,0,-0.406400><4.115361,0.035000,0.406400> rotate<0,44.997030,0> translate<13.600000,-1.535000,14.340000> }
}cylinder{<13.600000,1,15.930000><13.600000,-2.500000,15.930000>1.650000 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.750000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,21.590000>}
box{<0,0,-0.127000><0.110000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.750000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,16.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,21.590000>}
box{<0,0,-0.127000><4.600000,0.035000,0.127000> rotate<0,90.000000,0> translate<22.860000,0.000000,21.590000> }
}cylinder{<22.750000,1,21.590000><22.750000,-2.500000,21.590000>1.050000 texture{col_thl}}}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.500000,0.000000,22.740000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.620000,0.000000,22.860000>}
box{<0,0,-0.406400><0.169706,0.035000,0.406400> rotate<0,-44.997030,0> translate<7.500000,0.000000,22.740000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<7.500000,-1.535000,6.470000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.890000,-1.535000,5.080000>}
box{<0,0,-0.406400><1.965757,0.035000,0.406400> rotate<0,44.997030,0> translate<7.500000,-1.535000,6.470000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,0.000000,58.420000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<8.890000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.890000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.190000,0.000000,47.960000>}
box{<0,0,-0.127000><0.424264,0.035000,0.127000> rotate<0,44.997030,0> translate<8.890000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,48.160000>}
box{<0,0,-0.304800><6.250000,0.035000,0.304800> rotate<0,90.000000,0> translate<10.160000,-1.535000,48.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,0.000000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,0.000000,59.690000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.890000,0.000000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,48.160000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.200000,-1.535000,49.200000>}
box{<0,0,-0.304800><1.470782,0.035000,0.304800> rotate<0,-44.997030,0> translate<10.160000,-1.535000,48.160000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<11.390000,0.000000,2.155000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<11.390000,0.000000,5.040000>}
box{<0,0,-0.508000><2.885000,0.035000,0.508000> rotate<0,90.000000,0> translate<11.390000,0.000000,5.040000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.430000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.430000,-1.535000,3.810000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,-90.000000,0> translate<11.430000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.890000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.430000,-1.535000,5.080000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<8.890000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<11.390000,0.000000,5.040000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<11.430000,0.000000,5.080000>}
box{<0,0,-0.508000><0.056569,0.035000,0.508000> rotate<0,-44.997030,0> translate<11.390000,0.000000,5.040000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.430000,0.000000,45.330000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.430000,0.000000,43.180000>}
box{<0,0,-0.127000><2.150000,0.035000,0.127000> rotate<0,-90.000000,0> translate<11.430000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.065000,0.000000,59.690000>}
box{<0,0,-0.304800><1.905000,0.035000,0.304800> rotate<0,0.000000,0> translate<10.160000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.430000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.700000,-1.535000,2.540000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<11.430000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.430000,0.000000,45.330000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.900000,0.000000,46.800000>}
box{<0,0,-0.127000><2.078894,0.035000,0.127000> rotate<0,-44.997030,0> translate<11.430000,0.000000,45.330000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.200000,-1.535000,49.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.900000,-1.535000,49.200000>}
box{<0,0,-0.304800><1.700000,0.035000,0.304800> rotate<0,0.000000,0> translate<11.200000,-1.535000,49.200000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.930000,0.000000,46.770000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.930000,0.000000,46.690000>}
box{<0,0,-0.127000><0.080000,0.035000,0.127000> rotate<0,-90.000000,0> translate<12.930000,0.000000,46.690000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.900000,0.000000,46.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.930000,0.000000,46.770000>}
box{<0,0,-0.127000><0.042426,0.035000,0.127000> rotate<0,44.997030,0> translate<12.900000,0.000000,46.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.930000,-1.535000,49.230000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.970000,-1.535000,49.230000>}
box{<0,0,-0.304800><0.040000,0.035000,0.304800> rotate<0,0.000000,0> translate<12.930000,-1.535000,49.230000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.970000,-1.535000,49.230000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.000000,-1.535000,49.200000>}
box{<0,0,-0.304800><0.042426,0.035000,0.304800> rotate<0,44.997030,0> translate<12.970000,-1.535000,49.230000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.000000,-1.535000,49.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.000000,-1.535000,49.200000>}
box{<0,0,-0.304800><0.100000,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.000000,-1.535000,49.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.900000,-1.535000,49.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.000000,-1.535000,49.300000>}
box{<0,0,-0.304800><0.141421,0.035000,0.304800> rotate<0,-44.997030,0> translate<12.900000,-1.535000,49.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.000000,-1.535000,49.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.000000,-1.535000,52.200000>}
box{<0,0,-0.304800><2.900000,0.035000,0.304800> rotate<0,90.000000,0> translate<13.000000,-1.535000,52.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.300000,-1.535000,62.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.330000,-1.535000,62.230000>}
box{<0,0,-0.304800><0.042426,0.035000,0.304800> rotate<0,-44.997030,0> translate<13.300000,-1.535000,62.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.330000,-1.535000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.330000,-1.535000,62.860000>}
box{<0,0,-0.304800><0.630000,0.035000,0.304800> rotate<0,90.000000,0> translate<13.330000,-1.535000,62.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.000000,-1.535000,52.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,-1.535000,52.535000>}
box{<0,0,-0.304800><0.473762,0.035000,0.304800> rotate<0,-44.997030,0> translate<13.000000,-1.535000,52.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.330000,-1.535000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,-1.535000,62.230000>}
box{<0,0,-0.304800><0.005000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.330000,-1.535000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,-1.535000,52.535000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,-1.535000,62.230000>}
box{<0,0,-0.304800><9.695000,0.035000,0.304800> rotate<0,90.000000,0> translate<13.335000,-1.535000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,38.100000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,44.997030,0> translate<10.160000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,38.100000>}
box{<0,0,-0.304800><13.970000,0.035000,0.304800> rotate<0,90.000000,0> translate<13.970000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.430000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,0.000000,40.640000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,44.997030,0> translate<11.430000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.970000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<14.190000,0.000000,4.860000>}
box{<0,0,-0.508000><0.311127,0.035000,0.508000> rotate<0,44.997030,0> translate<13.970000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<14.190000,0.000000,2.155000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<14.190000,0.000000,4.860000>}
box{<0,0,-0.508000><2.705000,0.035000,0.508000> rotate<0,90.000000,0> translate<14.190000,0.000000,4.860000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.190000,0.000000,4.860000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.190000,0.000000,9.110000>}
box{<0,0,-0.406400><4.250000,0.035000,0.406400> rotate<0,90.000000,0> translate<14.190000,0.000000,9.110000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.200000,-1.535000,41.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.200000,-1.535000,48.500000>}
box{<0,0,-0.127000><7.100000,0.035000,0.127000> rotate<0,90.000000,0> translate<14.200000,-1.535000,48.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.600000,0.000000,54.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.600000,0.000000,59.600000>}
box{<0,0,-0.127000><5.400000,0.035000,0.127000> rotate<0,90.000000,0> translate<14.600000,0.000000,59.600000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.600000,0.000000,59.600000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.605000,0.000000,59.605000>}
box{<0,0,-0.127000><0.007071,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.600000,0.000000,59.600000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.605000,0.000000,59.605000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.605000,0.000000,59.690000>}
box{<0,0,-0.127000><0.085000,0.035000,0.127000> rotate<0,90.000000,0> translate<14.605000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.200000,-1.535000,41.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.200000,-1.535000,40.400000>}
box{<0,0,-0.127000><1.414214,0.035000,0.127000> rotate<0,44.997030,0> translate<14.200000,-1.535000,41.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<14.190000,0.000000,9.110000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,0.000000,10.160000>}
box{<0,0,-0.406400><1.484924,0.035000,0.406400> rotate<0,-44.997030,0> translate<14.190000,0.000000,9.110000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.200000,0.000000,21.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,0.000000,21.500000>}
box{<0,0,-0.127000><0.040000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.200000,0.000000,21.500000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,0.000000,21.500000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,0.000000,21.590000>}
box{<0,0,-0.406400><0.090000,0.035000,0.406400> rotate<0,90.000000,0> translate<15.240000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,35.560000>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,90.000000,0> translate<15.240000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.330000,-1.535000,62.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,64.770000>}
box{<0,0,-0.304800><2.701148,0.035000,0.304800> rotate<0,-44.997030,0> translate<13.330000,-1.535000,62.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.200000,0.000000,21.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.370000,0.000000,21.330000>}
box{<0,0,-0.127000><0.240416,0.035000,0.127000> rotate<0,44.997030,0> translate<15.200000,0.000000,21.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.370000,0.000000,19.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.370000,0.000000,21.330000>}
box{<0,0,-0.127000><1.850000,0.035000,0.127000> rotate<0,90.000000,0> translate<15.370000,0.000000,21.330000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.470000,0.000000,42.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.470000,0.000000,45.420000>}
box{<0,0,-0.127000><2.470000,0.035000,0.127000> rotate<0,90.000000,0> translate<15.470000,0.000000,45.420000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.190000,0.000000,47.960000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.470000,0.000000,47.960000>}
box{<0,0,-0.127000><6.280000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.190000,0.000000,47.960000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.200000,-1.535000,48.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.470000,-1.535000,49.770000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.200000,-1.535000,48.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.470000,-1.535000,49.770000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.470000,-1.535000,50.500000>}
box{<0,0,-0.127000><0.730000,0.035000,0.127000> rotate<0,90.000000,0> translate<15.470000,-1.535000,50.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.875000,0.000000,62.225000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.875000,0.000000,62.230000>}
box{<0,0,-0.127000><0.005000,0.035000,0.127000> rotate<0,90.000000,0> translate<15.875000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.875000,0.000000,62.225000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.900000,0.000000,62.200000>}
box{<0,0,-0.127000><0.035355,0.035000,0.127000> rotate<0,44.997030,0> translate<15.875000,0.000000,62.225000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.900000,0.000000,54.300000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.900000,0.000000,62.200000>}
box{<0,0,-0.127000><7.900000,0.035000,0.127000> rotate<0,90.000000,0> translate<15.900000,0.000000,62.200000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.510000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.510000,-1.535000,8.890000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,90.000000,0> translate<16.510000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.510000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.510000,-1.535000,11.430000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<16.510000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,-1.535000,21.590000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,44.997030,0> translate<13.970000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,-1.535000,21.590000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<16.510000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,36.830000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.240000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.470000,0.000000,42.950000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,0.000000,41.910000>}
box{<0,0,-0.127000><1.470782,0.035000,0.127000> rotate<0,44.997030,0> translate<15.470000,0.000000,42.950000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,64.770000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,-1.535000,64.770000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.240000,-1.535000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.870000,-1.535000,64.770000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,-1.535000,64.770000>}
box{<0,0,-0.304800><0.640000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.870000,-1.535000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.510000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.555000,0.000000,5.035000>}
box{<0,0,-0.406400><0.063640,0.035000,0.406400> rotate<0,44.997030,0> translate<16.510000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.740000,-1.535000,28.980000>}
box{<0,0,-0.127000><2.121320,0.035000,0.127000> rotate<0,44.997030,0> translate<15.240000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.600000,0.000000,54.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.800000,0.000000,52.000000>}
box{<0,0,-0.127000><3.111270,0.035000,0.127000> rotate<0,44.997030,0> translate<14.600000,0.000000,54.200000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.800000,0.000000,44.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.800000,0.000000,52.000000>}
box{<0,0,-0.127000><7.800000,0.035000,0.127000> rotate<0,90.000000,0> translate<16.800000,0.000000,52.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.930000,-1.535000,9.310000>}
box{<0,0,-0.203200><0.593970,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.510000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.070000,0.000000,15.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.070000,0.000000,19.480000>}
box{<0,0,-0.127000><4.050000,0.035000,0.127000> rotate<0,90.000000,0> translate<17.070000,0.000000,19.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.100000,0.000000,54.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.100000,0.000000,59.600000>}
box{<0,0,-0.127000><4.800000,0.035000,0.127000> rotate<0,90.000000,0> translate<17.100000,0.000000,59.600000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.100000,0.000000,59.600000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.145000,0.000000,59.645000>}
box{<0,0,-0.127000><0.063640,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.100000,0.000000,59.600000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.145000,0.000000,59.645000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.145000,0.000000,59.690000>}
box{<0,0,-0.127000><0.045000,0.035000,0.127000> rotate<0,90.000000,0> translate<17.145000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.160000,0.000000,10.160000>}
box{<0,0,-0.127000><1.920000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.240000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.070000,0.000000,19.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.180000,0.000000,19.480000>}
box{<0,0,-0.127000><0.110000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.070000,0.000000,19.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.160000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.200000,0.000000,10.200000>}
box{<0,0,-0.127000><0.056569,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.160000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.100000,0.000000,15.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.200000,0.000000,15.200000>}
box{<0,0,-0.127000><0.100000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.100000,0.000000,15.200000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.200000,0.000000,10.200000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.200000,0.000000,15.200000>}
box{<0,0,-0.406400><5.000000,0.035000,0.406400> rotate<0,90.000000,0> translate<17.200000,0.000000,15.200000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.070000,0.000000,15.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.200000,0.000000,15.300000>}
box{<0,0,-0.127000><0.183848,0.035000,0.127000> rotate<0,44.997030,0> translate<17.070000,0.000000,15.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.100000,0.000000,15.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.200000,0.000000,15.300000>}
box{<0,0,-0.127000><0.141421,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.100000,0.000000,15.200000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.200000,0.000000,15.200000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.200000,0.000000,15.300000>}
box{<0,0,-0.406400><0.100000,0.035000,0.406400> rotate<0,90.000000,0> translate<17.200000,0.000000,15.300000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.180000,0.000000,19.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.200000,0.000000,19.500000>}
box{<0,0,-0.127000><0.028284,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.180000,0.000000,19.480000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.200000,0.000000,15.300000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.200000,0.000000,19.500000>}
box{<0,0,-0.406400><4.200000,0.035000,0.406400> rotate<0,90.000000,0> translate<17.200000,0.000000,19.500000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.200000,0.000000,19.500000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.200000,0.000000,26.440000>}
box{<0,0,-0.406400><6.940000,0.035000,0.406400> rotate<0,90.000000,0> translate<17.200000,0.000000,26.440000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.200000,0.000000,26.440000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<17.200000,0.000000,26.500000>}
box{<0,0,-0.406400><0.060000,0.035000,0.406400> rotate<0,90.000000,0> translate<17.200000,0.000000,26.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.740000,-1.535000,28.980000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.200000,-1.535000,28.980000>}
box{<0,0,-0.127000><0.460000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.740000,-1.535000,28.980000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.200000,-1.535000,31.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.200000,-1.535000,31.520000>}
box{<0,0,-0.127000><0.520000,0.035000,0.127000> rotate<0,90.000000,0> translate<17.200000,-1.535000,31.520000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.200000,0.000000,19.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.300000,0.000000,19.600000>}
box{<0,0,-0.127000><0.141421,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.200000,0.000000,19.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.900000,0.000000,54.300000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.700000,0.000000,52.500000>}
box{<0,0,-0.127000><2.545584,0.035000,0.127000> rotate<0,44.997030,0> translate<15.900000,0.000000,54.300000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.700000,0.000000,45.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.700000,0.000000,52.500000>}
box{<0,0,-0.127000><7.300000,0.035000,0.127000> rotate<0,90.000000,0> translate<17.700000,0.000000,52.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,-1.535000,15.240000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<16.510000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.800000,0.000000,44.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.820000,0.000000,43.180000>}
box{<0,0,-0.127000><1.442498,0.035000,0.127000> rotate<0,44.997030,0> translate<16.800000,0.000000,44.200000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.200000,-1.535000,31.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.400000,-1.535000,29.800000>}
box{<0,0,-0.127000><1.697056,0.035000,0.127000> rotate<0,44.997030,0> translate<17.200000,-1.535000,31.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.400000,-1.535000,29.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.400000,-1.535000,29.800000>}
box{<0,0,-0.127000><0.400000,0.035000,0.127000> rotate<0,90.000000,0> translate<18.400000,-1.535000,29.800000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.400000,0.000000,55.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.400000,0.000000,62.300000>}
box{<0,0,-0.127000><7.100000,0.035000,0.127000> rotate<0,90.000000,0> translate<18.400000,0.000000,62.300000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.415000,0.000000,62.285000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.415000,0.000000,62.230000>}
box{<0,0,-0.127000><0.055000,0.035000,0.127000> rotate<0,-90.000000,0> translate<18.415000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.400000,0.000000,62.300000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.415000,0.000000,62.285000>}
box{<0,0,-0.127000><0.021213,0.035000,0.127000> rotate<0,44.997030,0> translate<18.400000,0.000000,62.300000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.700000,0.000000,45.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.450000,0.000000,44.450000>}
box{<0,0,-0.127000><1.060660,0.035000,0.127000> rotate<0,44.997030,0> translate<17.700000,0.000000,45.200000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.100000,0.000000,54.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.600000,0.000000,53.300000>}
box{<0,0,-0.127000><2.121320,0.035000,0.127000> rotate<0,44.997030,0> translate<17.100000,0.000000,54.800000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.600000,0.000000,46.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.600000,0.000000,53.300000>}
box{<0,0,-0.127000><7.300000,0.035000,0.127000> rotate<0,90.000000,0> translate<18.600000,0.000000,53.300000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.400000,-1.535000,29.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.800000,-1.535000,29.000000>}
box{<0,0,-0.127000><0.565685,0.035000,0.127000> rotate<0,44.997030,0> translate<18.400000,-1.535000,29.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.600000,0.000000,46.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.880000,0.000000,45.720000>}
box{<0,0,-0.127000><0.395980,0.035000,0.127000> rotate<0,44.997030,0> translate<18.600000,0.000000,46.000000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.930000,-1.535000,9.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,9.310000>}
box{<0,0,-0.203200><2.120000,0.035000,0.203200> rotate<0,0.000000,0> translate<16.930000,-1.535000,9.310000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,-1.535000,11.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,-1.535000,12.700000>}
box{<0,0,-0.127000><1.690000,0.035000,0.127000> rotate<0,90.000000,0> translate<19.050000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,-1.535000,36.830000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.510000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.400000,0.000000,55.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.600000,0.000000,54.000000>}
box{<0,0,-0.127000><1.697056,0.035000,0.127000> rotate<0,44.997030,0> translate<18.400000,0.000000,55.200000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.600000,0.000000,47.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.600000,0.000000,54.000000>}
box{<0,0,-0.127000><6.600000,0.035000,0.127000> rotate<0,90.000000,0> translate<19.600000,0.000000,54.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.685000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.690000,0.000000,59.690000>}
box{<0,0,-0.127000><0.005000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.685000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.690000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.700000,0.000000,59.700000>}
box{<0,0,-0.127000><0.014142,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.690000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.700000,0.000000,55.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.700000,0.000000,59.700000>}
box{<0,0,-0.127000><4.200000,0.035000,0.127000> rotate<0,90.000000,0> translate<19.700000,0.000000,59.700000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.740000,0.000000,25.170000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.770000,0.000000,25.170000>}
box{<0,0,-0.635000><0.030000,0.035000,0.635000> rotate<0,0.000000,0> translate<19.740000,0.000000,25.170000> }
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.770000,0.000000,25.170000>}
cylinder{<0,0,0><0,0.035000,0>0.635000 translate<19.800000,0.000000,25.200000>}
box{<0,0,-0.635000><0.042426,0.035000,0.635000> rotate<0,-44.997030,0> translate<19.770000,0.000000,25.170000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.850000,0.000000,13.500000>}
box{<0,0,-0.127000><1.131371,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.050000,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.920000,0.000000,16.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.920000,0.000000,17.900000>}
box{<0,0,-0.127000><0.990000,0.035000,0.127000> rotate<0,90.000000,0> translate<19.920000,0.000000,17.900000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.300000,0.000000,19.600000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.920000,0.000000,19.600000>}
box{<0,0,-0.127000><2.620000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.300000,0.000000,19.600000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.600000,0.000000,47.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.010000,0.000000,46.990000>}
box{<0,0,-0.127000><0.579828,0.035000,0.127000> rotate<0,44.997030,0> translate<19.600000,0.000000,47.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.850000,0.000000,13.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.310000,0.000000,13.500000>}
box{<0,0,-0.127000><0.460000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.850000,0.000000,13.500000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.700000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,-1.535000,2.540000>}
box{<0,0,-0.406400><7.620000,0.035000,0.406400> rotate<0,0.000000,0> translate<12.700000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,-1.535000,6.350000>}
box{<0,0,-0.406400><3.810000,0.035000,0.406400> rotate<0,90.000000,0> translate<20.320000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.320000,-1.535000,15.240000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<17.780000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.700000,0.000000,55.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.700000,0.000000,54.500000>}
box{<0,0,-0.127000><1.414214,0.035000,0.127000> rotate<0,44.997030,0> translate<19.700000,0.000000,55.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.700000,0.000000,48.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.700000,0.000000,54.500000>}
box{<0,0,-0.127000><5.700000,0.035000,0.127000> rotate<0,90.000000,0> translate<20.700000,0.000000,54.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.900000,0.000000,56.300000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.900000,0.000000,62.300000>}
box{<0,0,-0.127000><6.000000,0.035000,0.127000> rotate<0,90.000000,0> translate<20.900000,0.000000,62.300000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.955000,0.000000,62.245000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.955000,0.000000,62.230000>}
box{<0,0,-0.127000><0.015000,0.035000,0.127000> rotate<0,-90.000000,0> translate<20.955000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.900000,0.000000,62.300000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.955000,0.000000,62.245000>}
box{<0,0,-0.127000><0.077782,0.035000,0.127000> rotate<0,44.997030,0> translate<20.900000,0.000000,62.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,-1.535000,52.535000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.125000,-1.535000,52.535000>}
box{<0,0,-0.304800><7.790000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.335000,-1.535000,52.535000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.700000,0.000000,48.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.240000,0.000000,48.260000>}
box{<0,0,-0.127000><0.763675,0.035000,0.127000> rotate<0,44.997030,0> translate<20.700000,0.000000,48.800000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.590000,0.000000,2.540000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,0.000000,0> translate<20.320000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.320000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.590000,-1.535000,7.620000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<20.320000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.320000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,13.970000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<20.320000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,13.970000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,90.000000,0> translate<21.590000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.920000,0.000000,16.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,0.000000,15.240000>}
box{<0,0,-0.127000><2.361737,0.035000,0.127000> rotate<0,44.997030,0> translate<19.920000,0.000000,16.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,-1.535000,34.290000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,44.997030,0> translate<19.050000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.900000,0.000000,56.300000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.700000,0.000000,55.500000>}
box{<0,0,-0.127000><1.131371,0.035000,0.127000> rotate<0,44.997030,0> translate<20.900000,0.000000,56.300000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.700000,0.000000,49.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.700000,0.000000,55.500000>}
box{<0,0,-0.127000><5.600000,0.035000,0.127000> rotate<0,90.000000,0> translate<21.700000,0.000000,55.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.895000,0.000000,2.235000>}
box{<0,0,-0.127000><0.431335,0.035000,0.127000> rotate<0,44.997030,0> translate<21.590000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.900000,0.000000,5.000000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.935000,0.000000,5.035000>}
box{<0,0,-0.406400><0.049497,0.035000,0.406400> rotate<0,-44.997030,0> translate<21.900000,0.000000,5.000000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.935000,0.000000,5.035000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.950000,0.000000,5.050000>}
box{<0,0,-0.406400><0.021213,0.035000,0.406400> rotate<0,-44.997030,0> translate<21.935000,0.000000,5.035000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.895000,0.000000,2.235000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.965000,0.000000,2.235000>}
box{<0,0,-0.127000><0.070000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.895000,0.000000,2.235000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.555000,0.000000,5.035000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.965000,0.000000,5.035000>}
box{<0,0,-0.406400><5.410000,0.035000,0.406400> rotate<0,0.000000,0> translate<16.555000,0.000000,5.035000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.935000,0.000000,5.035000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.965000,0.000000,5.035000>}
box{<0,0,-0.406400><0.030000,0.035000,0.406400> rotate<0,0.000000,0> translate<21.935000,0.000000,5.035000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.590000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.010000,-1.535000,7.620000>}
box{<0,0,-0.406400><0.420000,0.035000,0.406400> rotate<0,0.000000,0> translate<21.590000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.700000,0.000000,49.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.070000,0.000000,49.530000>}
box{<0,0,-0.127000><0.523259,0.035000,0.127000> rotate<0,44.997030,0> translate<21.700000,0.000000,49.900000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.740000,-1.535000,30.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.630000,-1.535000,30.250000>}
box{<0,0,-0.127000><2.890000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.740000,-1.535000,30.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.310000,0.000000,13.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,13.490000>}
box{<0,0,-0.127000><2.550020,0.035000,0.127000> rotate<0,0.224673,0> translate<20.310000,0.000000,13.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,40.640000>}
box{<0,0,-0.127000><8.890000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.970000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,41.910000>}
box{<0,0,-0.127000><6.350000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.510000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.820000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,43.180000>}
box{<0,0,-0.127000><5.040000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.820000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.450000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,44.450000>}
box{<0,0,-0.127000><4.410000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.450000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.880000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,45.720000>}
box{<0,0,-0.127000><3.980000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.880000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.010000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,46.990000>}
box{<0,0,-0.127000><2.850000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.010000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.240000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,48.260000>}
box{<0,0,-0.127000><1.620000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.240000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.070000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,49.530000>}
box{<0,0,-0.127000><0.790000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.070000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,15.240000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.590000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,34.290000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.590000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,39.370000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<22.860000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,40.640000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<22.860000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,41.910000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<22.860000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,43.180000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<22.860000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,44.450000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<22.860000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,45.720000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<22.860000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,46.990000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<22.860000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,48.260000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<22.860000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.125000,-1.535000,52.535000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,49.530000>}
box{<0,0,-0.304800><4.249712,0.035000,0.304800> rotate<0,44.997030,0> translate<21.125000,-1.535000,52.535000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.710000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.400000,-1.535000,7.620000>}
box{<0,0,-0.406400><1.690000,0.035000,0.406400> rotate<0,0.000000,0> translate<23.710000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,8.890000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,44.997030,0> translate<21.590000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,8.890000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,90.000000,0> translate<25.400000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,13.970000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<24.130000,0.000000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,39.370000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.130000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,40.640000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.130000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,41.910000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.130000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,43.180000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.130000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,44.450000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.130000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,45.720000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.130000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,46.990000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.130000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,48.260000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.130000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,60.960000>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,90.000000,0> translate<25.400000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<18.800000,-1.535000,29.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.610000,-1.535000,29.000000>}
box{<0,0,-0.127000><6.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<18.800000,-1.535000,29.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.890000,0.000000,54.610000>}
box{<0,0,-0.127000><0.490000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.400000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.890000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.900000,0.000000,54.600000>}
box{<0,0,-0.127000><0.014142,0.035000,0.127000> rotate<0,44.997030,0> translate<25.890000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.130000,0.000000,13.970000>}
box{<0,0,-0.127000><0.730000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.400000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.900000,0.000000,54.600000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.600000,0.000000,54.600000>}
box{<0,0,-0.127000><0.700000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.900000,0.000000,54.600000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.130000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.610000,0.000000,13.490000>}
box{<0,0,-0.127000><0.678823,0.035000,0.127000> rotate<0,44.997030,0> translate<26.130000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.610000,0.000000,13.490000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,0.000000,13.490000>}
box{<0,0,-0.127000><0.060000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.610000,0.000000,13.490000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.600000,0.000000,16.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,0.000000,16.970000>}
box{<0,0,-0.127000><0.098995,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.600000,0.000000,16.900000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,0.000000,16.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,0.000000,16.970000>}
box{<0,0,-0.127000><0.020000,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.670000,0.000000,16.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,0.000000,16.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,0.000000,19.050000>}
box{<0,0,-0.127000><2.080000,0.035000,0.127000> rotate<0,90.000000,0> translate<26.670000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.610000,-1.535000,29.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,-1.535000,27.940000>}
box{<0,0,-0.127000><1.499066,0.035000,0.127000> rotate<0,44.997030,0> translate<25.610000,-1.535000,29.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,-1.535000,27.940000>}
box{<0,0,-0.127000><8.890000,0.035000,0.127000> rotate<0,90.000000,0> translate<26.670000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.600000,0.000000,54.600000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.100000,0.000000,55.100000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.600000,0.000000,54.600000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.100000,0.000000,55.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.100000,0.000000,60.400000>}
box{<0,0,-0.127000><5.300000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.100000,0.000000,60.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.140000,-1.535000,49.530000>}
box{<0,0,-0.304800><3.010000,0.035000,0.304800> rotate<0,0.000000,0> translate<24.130000,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.140000,0.000000,49.530000>}
box{<0,0,-0.304800><1.740000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.400000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.440000,0.000000,53.340000>}
box{<0,0,-0.127000><2.040000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.400000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.305000,-1.535000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.440000,-1.535000,53.340000>}
box{<0,0,-0.127000><0.135000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.305000,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.100000,0.000000,60.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.800000,0.000000,61.100000>}
box{<0,0,-0.127000><0.989949,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.100000,0.000000,60.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.400000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,7.620000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<25.400000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<15.240000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,0.000000,10.160000>}
box{<0,0,-0.406400><12.700000,0.035000,0.406400> rotate<0,0.000000,0> translate<15.240000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,38.100000>}
box{<0,0,-0.127000><5.388154,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.130000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,39.370000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.940000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,43.180000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.940000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,48.260000>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.940000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,63.500000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.400000,0.000000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.510000,-1.535000,64.770000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,64.770000>}
box{<0,0,-0.304800><11.430000,0.035000,0.304800> rotate<0,0.000000,0> translate<16.510000,-1.535000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.950000,0.000000,5.050000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.970000,0.000000,5.050000>}
box{<0,0,-0.406400><6.020000,0.035000,0.406400> rotate<0,0.000000,0> translate<21.950000,0.000000,5.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.970000,0.000000,7.590000>}
box{<0,0,-0.127000><0.042426,0.035000,0.127000> rotate<0,44.997030,0> translate<27.940000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.970000,-1.535000,7.590000>}
box{<0,0,-0.406400><0.042426,0.035000,0.406400> rotate<0,44.997030,0> translate<27.940000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.970000,0.000000,10.130000>}
box{<0,0,-0.406400><0.042426,0.035000,0.406400> rotate<0,44.997030,0> translate<27.940000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.575000,0.000000,59.055000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.575000,0.000000,59.690000>}
box{<0,0,-0.304800><0.635000,0.035000,0.304800> rotate<0,90.000000,0> translate<28.575000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,7.620000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.940000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.630000,-1.535000,30.250000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,36.830000>}
box{<0,0,-0.127000><9.305525,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.630000,-1.535000,30.250000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,38.100000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,90.000000,0> translate<29.210000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,41.910000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,90.000000,0> translate<29.210000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,46.990000>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,90.000000,0> translate<29.210000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,49.530000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.940000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,52.070000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.400000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,52.070000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<29.210000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.800000,0.000000,61.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.700000,0.000000,61.100000>}
box{<0,0,-0.127000><1.900000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.800000,0.000000,61.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.845000,-1.535000,62.865000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.845000,-1.535000,62.230000>}
box{<0,0,-0.304800><0.635000,0.035000,0.304800> rotate<0,-90.000000,0> translate<29.845000,-1.535000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,64.770000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.845000,-1.535000,62.865000>}
box{<0,0,-0.304800><2.694077,0.035000,0.304800> rotate<0,44.997030,0> translate<27.940000,-1.535000,64.770000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.940000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.480000,-1.535000,7.620000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<27.940000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,0.000000,8.890000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.210000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,0.000000,13.490000>}
box{<0,0,-0.127000><4.600000,0.035000,0.127000> rotate<0,90.000000,0> translate<30.480000,0.000000,13.490000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.440000,-1.535000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,-1.535000,53.340000>}
box{<0,0,-0.127000><3.040000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.440000,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.575000,0.000000,59.055000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,0.000000,57.150000>}
box{<0,0,-0.304800><2.694077,0.035000,0.304800> rotate<0,44.997030,0> translate<28.575000,0.000000,59.055000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.100000,0.000000,63.500000>}
box{<0,0,-0.127000><3.160000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.940000,0.000000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.700000,0.000000,61.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.110000,0.000000,59.690000>}
box{<0,0,-0.127000><1.994041,0.035000,0.127000> rotate<0,44.997030,0> translate<29.700000,0.000000,61.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.115000,-1.535000,48.895000>}
box{<0,0,-0.127000><2.694077,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.210000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,-1.535000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.115000,-1.535000,52.705000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,44.997030,0> translate<30.480000,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.115000,-1.535000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.115000,-1.535000,52.705000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,90.000000,0> translate<31.115000,-1.535000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.110000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.115000,0.000000,59.690000>}
box{<0,0,-0.127000><0.005000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.110000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<30.480000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.750000,-1.535000,8.890000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<30.480000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.750000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.750000,-1.535000,34.290000>}
box{<0,0,-0.406400><25.400000,0.035000,0.406400> rotate<0,90.000000,0> translate<31.750000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.750000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.750000,0.000000,46.990000>}
box{<0,0,-0.406400><8.890000,0.035000,0.406400> rotate<0,90.000000,0> translate<31.750000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,0.000000,57.150000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<30.480000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.100000,0.000000,63.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,62.215000>}
box{<0,0,-0.127000><1.817264,0.035000,0.127000> rotate<0,44.997030,0> translate<31.100000,0.000000,63.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,62.215000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,62.230000>}
box{<0,0,-0.127000><0.015000,0.035000,0.127000> rotate<0,90.000000,0> translate<32.385000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.385000,0.000000,62.215000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.400000,0.000000,62.200000>}
box{<0,0,-0.127000><0.021213,0.035000,0.127000> rotate<0,44.997030,0> translate<32.385000,0.000000,62.215000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.000000,-1.535000,47.400000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.010000,-1.535000,47.410000>}
box{<0,0,-0.406400><0.014142,0.035000,0.406400> rotate<0,-44.997030,0> translate<33.000000,-1.535000,47.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.010000,-1.535000,47.410000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,-1.535000,47.410000>}
box{<0,0,-0.406400><0.010000,0.035000,0.406400> rotate<0,0.000000,0> translate<33.010000,-1.535000,47.410000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.750000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,0.000000,48.260000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<31.750000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,-1.535000,49.110000>}
box{<0,0,-0.304800><1.690000,0.035000,0.304800> rotate<0,-90.000000,0> translate<33.020000,-1.535000,49.110000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,0.000000,50.800000>}
box{<0,0,-0.304800><7.620000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.400000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,0.000000,50.800000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<33.020000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,0.000000,55.880000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<31.750000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.020000,0.000000,55.880000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<33.020000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.200000,-1.535000,40.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.330000,-1.535000,40.400000>}
box{<0,0,-0.127000><18.130000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.200000,-1.535000,40.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.260000,0.000000,40.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.330000,0.000000,40.400000>}
box{<0,0,-0.127000><0.070000,0.035000,0.127000> rotate<0,0.000000,0> translate<33.260000,0.000000,40.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.600000,0.000000,56.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.600000,0.000000,59.700000>}
box{<0,0,-0.127000><3.200000,0.035000,0.127000> rotate<0,90.000000,0> translate<33.600000,0.000000,59.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.600000,0.000000,59.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.610000,0.000000,59.690000>}
box{<0,0,-0.127000><0.014142,0.035000,0.127000> rotate<0,44.997030,0> translate<33.600000,0.000000,59.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.965000,0.000000,2.235000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.635000,0.000000,2.235000>}
box{<0,0,-0.127000><11.670000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.965000,0.000000,2.235000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.610000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.655000,0.000000,59.690000>}
box{<0,0,-0.127000><0.045000,0.035000,0.127000> rotate<0,0.000000,0> translate<33.610000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.635000,0.000000,2.235000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.100000,0.000000,2.700000>}
box{<0,0,-0.127000><0.657609,0.035000,0.127000> rotate<0,-44.997030,0> translate<33.635000,0.000000,2.235000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.100000,0.000000,2.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.100000,0.000000,3.300000>}
box{<0,0,-0.127000><0.600000,0.035000,0.127000> rotate<0,90.000000,0> translate<34.100000,0.000000,3.300000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.070000,0.000000,3.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.170000,0.000000,3.430000>}
box{<0,0,-0.127000><0.100000,0.035000,0.127000> rotate<0,0.000000,0> translate<34.070000,0.000000,3.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.100000,0.000000,3.300000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.200000,0.000000,3.400000>}
box{<0,0,-0.127000><0.141421,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.100000,0.000000,3.300000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.170000,0.000000,3.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.200000,0.000000,3.400000>}
box{<0,0,-0.127000><0.042426,0.035000,0.127000> rotate<0,44.997030,0> translate<34.170000,0.000000,3.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.600000,0.000000,56.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.220000,0.000000,55.880000>}
box{<0,0,-0.127000><0.876812,0.035000,0.127000> rotate<0,44.997030,0> translate<33.600000,0.000000,56.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.480000,0.000000,16.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.290000,0.000000,16.990000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<30.480000,0.000000,16.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.290000,-1.535000,19.490000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.290000,-1.535000,19.470000>}
box{<0,0,-0.127000><0.020000,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.290000,-1.535000,19.470000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.290000,-1.535000,21.170000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.290000,-1.535000,34.290000>}
box{<0,0,-0.127000><13.120000,0.035000,0.127000> rotate<0,90.000000,0> translate<34.290000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<33.260000,0.000000,40.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.290000,0.000000,39.370000>}
box{<0,0,-0.127000><1.456640,0.035000,0.127000> rotate<0,44.997030,0> translate<33.260000,0.000000,40.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.290000,0.000000,16.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.300000,0.000000,17.000000>}
box{<0,0,-0.127000><0.014142,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.290000,0.000000,16.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.290000,-1.535000,19.490000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.300000,-1.535000,19.500000>}
box{<0,0,-0.127000><0.014142,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.290000,-1.535000,19.490000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.300000,-1.535000,17.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.300000,-1.535000,19.500000>}
box{<0,0,-0.127000><2.500000,0.035000,0.127000> rotate<0,90.000000,0> translate<34.300000,-1.535000,19.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.900000,0.000000,62.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.900000,0.000000,58.200000>}
box{<0,0,-0.127000><3.900000,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.900000,0.000000,58.200000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.900000,0.000000,62.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.925000,0.000000,62.125000>}
box{<0,0,-0.127000><0.035355,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.900000,0.000000,62.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.925000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.925000,0.000000,62.125000>}
box{<0,0,-0.127000><0.105000,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.925000,0.000000,62.125000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.925000,0.000000,62.275000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.925000,0.000000,62.230000>}
box{<0,0,-0.127000><0.045000,0.035000,0.127000> rotate<0,-90.000000,0> translate<34.925000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.900000,0.000000,62.300000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.925000,0.000000,62.275000>}
box{<0,0,-0.127000><0.035355,0.035000,0.127000> rotate<0,44.997030,0> translate<34.900000,0.000000,62.300000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.900000,0.000000,58.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.400000,0.000000,57.700000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,44.997030,0> translate<34.900000,0.000000,58.200000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.000000,-1.535000,47.400000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.560000,-1.535000,47.400000>}
box{<0,0,-0.406400><2.560000,0.035000,0.406400> rotate<0,0.000000,0> translate<33.000000,-1.535000,47.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.560000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.560000,-1.535000,47.400000>}
box{<0,0,-0.406400><4.220000,0.035000,0.406400> rotate<0,90.000000,0> translate<35.560000,-1.535000,47.400000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.560000,-1.535000,47.400000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.560000,-1.535000,48.260000>}
box{<0,0,-0.406400><0.860000,0.035000,0.406400> rotate<0,90.000000,0> translate<35.560000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,47.400000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.600000,-1.535000,47.400000>}
box{<0,0,-0.203200><0.040000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.560000,-1.535000,47.400000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.590000,-1.535000,47.410000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.600000,-1.535000,47.400000>}
box{<0,0,-0.203200><0.014142,0.035000,0.203200> rotate<0,44.997030,0> translate<35.590000,-1.535000,47.410000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.290000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.687000,0.000000,39.370000>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,0.000000,0> translate<34.290000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.100000,0.000000,39.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.687000,0.000000,39.370000>}
box{<0,0,-0.127000><0.601223,0.035000,0.127000> rotate<0,12.486637,0> translate<35.100000,0.000000,39.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.560000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.687000,0.000000,45.720000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.560000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<33.020000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.687000,0.000000,48.260000>}
box{<0,0,-0.406400><2.667000,0.035000,0.406400> rotate<0,0.000000,0> translate<33.020000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.220000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.687000,0.000000,55.880000>}
box{<0,0,-0.127000><1.467000,0.035000,0.127000> rotate<0,0.000000,0> translate<34.220000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.400000,0.000000,57.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.900000,0.000000,57.700000>}
box{<0,0,-0.127000><0.500000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.400000,0.000000,57.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.195000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.210000,0.000000,59.690000>}
box{<0,0,-0.127000><0.015000,0.035000,0.127000> rotate<0,0.000000,0> translate<36.195000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.687000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.300000,0.000000,44.500000>}
box{<0,0,-0.127000><0.615036,0.035000,0.127000> rotate<0,-4.662761,0> translate<35.687000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.687000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.300000,0.000000,47.000000>}
box{<0,0,-0.127000><0.613082,0.035000,0.127000> rotate<0,-0.934534,0> translate<35.687000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.900000,0.000000,62.300000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.400000,0.000000,63.800000>}
box{<0,0,-0.127000><2.121320,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.900000,0.000000,62.300000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<31.750000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.830000,-1.535000,39.370000>}
box{<0,0,-0.406400><7.184205,0.035000,0.406400> rotate<0,-44.997030,0> translate<31.750000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.560000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.830000,-1.535000,41.910000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,44.997030,0> translate<35.560000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.830000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<36.830000,-1.535000,41.910000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<36.830000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.687000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.830000,0.000000,54.610000>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.687000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.830000,0.000000,56.770000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.830000,0.000000,54.610000>}
box{<0,0,-0.127000><2.160000,0.035000,0.127000> rotate<0,-90.000000,0> translate<36.830000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.900000,0.000000,57.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.830000,0.000000,56.770000>}
box{<0,0,-0.127000><1.315219,0.035000,0.127000> rotate<0,44.997030,0> translate<35.900000,0.000000,57.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.687000,0.000000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.040000,0.000000,53.340000>}
box{<0,0,-0.127000><1.353000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.687000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.687000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.170000,0.000000,52.070000>}
box{<0,0,-0.127000><1.483000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.687000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.465000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.470000,0.000000,62.230000>}
box{<0,0,-0.127000><0.005000,0.035000,0.127000> rotate<0,0.000000,0> translate<37.465000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.040000,0.000000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.800000,0.000000,54.100000>}
box{<0,0,-0.127000><1.074802,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.040000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.210000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.800000,0.000000,58.100000>}
box{<0,0,-0.127000><2.248600,0.035000,0.127000> rotate<0,44.997030,0> translate<36.210000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.800000,0.000000,54.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.800000,0.000000,58.100000>}
box{<0,0,-0.127000><4.000000,0.035000,0.127000> rotate<0,90.000000,0> translate<37.800000,0.000000,58.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<34.290000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,38.100000>}
box{<0,0,-0.127000><5.388154,0.035000,0.127000> rotate<0,-44.997030,0> translate<34.290000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.687000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,0.000000,45.720000>}
box{<0,0,-0.127000><2.413000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.687000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,-1.535000,45.720000>}
box{<0,0,-0.127000><7.620000,0.035000,0.127000> rotate<0,90.000000,0> translate<38.100000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.687000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.100000,0.000000,48.260000>}
box{<0,0,-0.406400><2.413000,0.035000,0.406400> rotate<0,0.000000,0> translate<35.687000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.100000,0.000000,3.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.700000,0.000000,4.800000>}
box{<0,0,-0.127000><1.495627,0.035000,0.127000> rotate<0,-66.344308,0> translate<38.100000,0.000000,3.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.700000,0.000000,4.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.700000,0.000000,7.900000>}
box{<0,0,-0.127000><3.100000,0.035000,0.127000> rotate<0,90.000000,0> translate<38.700000,0.000000,7.900000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.700000,-1.535000,7.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.700000,-1.535000,20.920000>}
box{<0,0,-0.127000><13.020000,0.035000,0.127000> rotate<0,90.000000,0> translate<38.700000,-1.535000,20.920000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.170000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.200000,0.000000,54.100000>}
box{<0,0,-0.127000><2.870854,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.170000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.470000,0.000000,62.230000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.200000,0.000000,60.500000>}
box{<0,0,-0.127000><2.446589,0.035000,0.127000> rotate<0,44.997030,0> translate<37.470000,0.000000,62.230000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.200000,0.000000,54.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.200000,0.000000,60.500000>}
box{<0,0,-0.127000><6.400000,0.035000,0.127000> rotate<0,90.000000,0> translate<39.200000,0.000000,60.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.687000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,0.000000,39.370000>}
box{<0,0,-0.127000><3.683000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.687000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.687000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,0.000000,40.640000>}
box{<0,0,-0.127000><3.683000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.687000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.687000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,0.000000,41.910000>}
box{<0,0,-0.127000><3.683000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.687000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<35.687000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,0.000000,43.180000>}
box{<0,0,-0.127000><3.683000,0.035000,0.127000> rotate<0,0.000000,0> translate<35.687000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.560000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.370000,-1.535000,52.070000>}
box{<0,0,-0.406400><5.388154,0.035000,0.406400> rotate<0,-44.997030,0> translate<35.560000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.400000,0.000000,63.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.400000,0.000000,63.800000>}
box{<0,0,-0.127000><3.000000,0.035000,0.127000> rotate<0,0.000000,0> translate<36.400000,0.000000,63.800000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.312800,0.000000,25.126800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.500000,0.000000,25.100000>}
box{<0,0,-0.127000><0.189109,0.035000,0.127000> rotate<0,8.146704,0> translate<39.312800,0.000000,25.126800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.500000,0.000000,25.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.800000,0.000000,25.100000>}
box{<0,0,-0.127000><0.300000,0.035000,0.127000> rotate<0,0.000000,0> translate<39.500000,0.000000,25.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.800000,0.000000,25.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.470000,0.000000,25.080000>}
box{<0,0,-0.127000><0.670298,0.035000,0.127000> rotate<0,1.709701,0> translate<39.800000,0.000000,25.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.700000,-1.535000,20.920000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.640000,-1.535000,22.860000>}
box{<0,0,-0.127000><2.743574,0.035000,0.127000> rotate<0,-44.997030,0> translate<38.700000,-1.535000,20.920000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.640000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.640000,-1.535000,30.480000>}
box{<0,0,-0.127000><7.620000,0.035000,0.127000> rotate<0,90.000000,0> translate<40.640000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.640000,0.000000,38.100000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<39.370000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.640000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.640000,0.000000,38.100000>}
box{<0,0,-0.127000><7.620000,0.035000,0.127000> rotate<0,90.000000,0> translate<40.640000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.640000,0.000000,41.910000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<39.370000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.470000,0.000000,23.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.100000,0.000000,22.900000>}
box{<0,0,-0.127000><0.689420,0.035000,0.127000> rotate<0,23.960908,0> translate<40.470000,0.000000,23.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.910000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.910000,-1.535000,33.020000>}
box{<0,0,-0.127000><19.050000,0.035000,0.127000> rotate<0,-90.000000,0> translate<41.910000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.910000,0.000000,39.370000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,44.997030,0> translate<39.370000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.370000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.910000,-1.535000,52.070000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<39.370000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.640000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.280000,0.000000,30.480000>}
box{<0,0,-0.127000><1.640000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.640000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.280000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.300000,0.000000,30.500000>}
box{<0,0,-0.127000><0.028284,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.280000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.300000,0.000000,30.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.320000,0.000000,30.480000>}
box{<0,0,-0.127000><0.028284,0.035000,0.127000> rotate<0,44.997030,0> translate<42.300000,0.000000,30.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.320000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.330000,0.000000,30.480000>}
box{<0,0,-0.127000><0.010000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.320000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.370000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,36.830000>}
box{<0,0,-0.127000><5.388154,0.035000,0.127000> rotate<0,44.997030,0> translate<39.370000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.100000,0.000000,22.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.200000,0.000000,22.900000>}
box{<0,0,-0.127000><2.100000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.100000,0.000000,22.900000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.200000,-1.535000,35.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.200000,-1.535000,48.280000>}
box{<0,0,-0.127000><12.480000,0.035000,0.127000> rotate<0,90.000000,0> translate<43.200000,-1.535000,48.280000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.200000,0.000000,22.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.600000,0.000000,22.860000>}
box{<0,0,-0.127000><0.401995,0.035000,0.127000> rotate<0,5.710216,0> translate<43.200000,0.000000,22.900000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.600000,0.000000,28.300000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.600000,0.000000,26.670000>}
box{<0,0,-0.127000><1.630000,0.035000,0.127000> rotate<0,-90.000000,0> translate<43.600000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.300000,0.000000,47.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.700000,0.000000,47.000000>}
box{<0,0,-0.127000><7.400000,0.035000,0.127000> rotate<0,0.000000,0> translate<36.300000,0.000000,47.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.600000,0.000000,28.300000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.000000,0.000000,28.700000>}
box{<0,0,-0.127000><0.565685,0.035000,0.127000> rotate<0,-44.997030,0> translate<43.600000,0.000000,28.300000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.000000,0.000000,30.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.000000,0.000000,28.700000>}
box{<0,0,-0.127000><1.700000,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.000000,0.000000,28.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.200000,-1.535000,35.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.000000,-1.535000,35.000000>}
box{<0,0,-0.127000><1.131371,0.035000,0.127000> rotate<0,44.997030,0> translate<43.200000,-1.535000,35.800000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.000000,-1.535000,21.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.000000,-1.535000,35.000000>}
box{<0,0,-0.127000><13.500000,0.035000,0.127000> rotate<0,90.000000,0> translate<44.000000,-1.535000,35.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.000000,0.000000,30.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.030000,0.000000,30.430000>}
box{<0,0,-0.127000><0.042426,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.000000,0.000000,30.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.030000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.030000,0.000000,30.430000>}
box{<0,0,-0.127000><0.050000,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.030000,0.000000,30.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.030000,0.000000,30.900000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.030000,0.000000,30.480000>}
box{<0,0,-0.127000><0.420000,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.030000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.910000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.030000,0.000000,30.900000>}
box{<0,0,-0.127000><2.998133,0.035000,0.127000> rotate<0,44.997030,0> translate<41.910000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.300000,0.000000,44.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400000,0.000000,44.500000>}
box{<0,0,-0.127000><8.100000,0.035000,0.127000> rotate<0,0.000000,0> translate<36.300000,0.000000,44.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<38.270000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,24.130000>}
box{<0,0,-0.127000><6.180000,0.035000,0.127000> rotate<0,0.000000,0> translate<38.270000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,36.830000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.180000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.910000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,39.370000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.910000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.640000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,41.910000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<40.640000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.400000,0.000000,44.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,44.450000>}
box{<0,0,-0.127000><0.070711,0.035000,0.127000> rotate<0,44.997030,0> translate<44.400000,0.000000,44.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.700000,0.000000,47.000000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,46.990000>}
box{<0,0,-0.127000><0.750067,0.035000,0.127000> rotate<0,0.763848,0> translate<43.700000,0.000000,47.000000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.200000,-1.535000,48.280000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,-1.535000,49.530000>}
box{<0,0,-0.127000><1.767767,0.035000,0.127000> rotate<0,-44.997030,0> translate<43.200000,-1.535000,48.280000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<41.910000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.450000,-1.535000,52.070000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<41.910000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.100000,0.000000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<44.450000,0.000000,54.610000>}
box{<0,0,-0.406400><8.980256,0.035000,0.406400> rotate<0,-44.997030,0> translate<38.100000,0.000000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.000000,0.000000,21.500000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.900000,0.000000,22.400000>}
box{<0,0,-0.127000><1.272792,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.000000,0.000000,21.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.200000,0.000000,26.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.230000,0.000000,26.670000>}
box{<0,0,-0.127000><0.042426,0.035000,0.127000> rotate<0,44.997030,0> translate<45.200000,0.000000,26.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.900000,0.000000,22.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.300000,0.000000,22.860000>}
box{<0,0,-0.127000><0.609590,0.035000,0.127000> rotate<0,-48.987680,0> translate<44.900000,0.000000,22.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.230000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.300000,0.000000,26.670000>}
box{<0,0,-0.127000><0.070000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.230000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.200000,0.000000,26.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.700000,0.000000,27.200000>}
box{<0,0,-0.127000><0.707107,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.200000,0.000000,26.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.400000,0.000000,63.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.700000,0.000000,57.500000>}
box{<0,0,-0.127000><8.909545,0.035000,0.127000> rotate<0,44.997030,0> translate<39.400000,0.000000,63.800000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.700000,0.000000,27.200000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.700000,0.000000,57.500000>}
box{<0,0,-0.127000><30.300000,0.035000,0.127000> rotate<0,90.000000,0> translate<45.700000,0.000000,57.500000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.720000,0.000000,25.400000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.450000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.300000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.720000,0.000000,26.670000>}
box{<0,0,-0.127000><0.420000,0.035000,0.127000> rotate<0,0.000000,0> translate<45.300000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.720000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.720000,0.000000,26.670000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,90.000000,0> translate<45.720000,0.000000,26.670000> }
//Text
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.616200,0.000000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.616200,0.000000,91.873100>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,90.000000,0> translate<2.616200,0.000000,91.873100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.616200,0.000000,91.873100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.158500,0.000000,91.330800>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,44.997030,0> translate<2.616200,0.000000,91.873100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.158500,0.000000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.700800,0.000000,91.873100>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<3.158500,0.000000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.700800,0.000000,91.873100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.700800,0.000000,90.246200>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,-90.000000,0> translate<3.700800,0.000000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.253300,0.000000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.524400,0.000000,91.330800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<4.253300,0.000000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.524400,0.000000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.524400,0.000000,90.246200>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,-90.000000,0> translate<4.524400,0.000000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.253300,0.000000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.795600,0.000000,90.246200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<4.253300,0.000000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.524400,0.000000,92.144300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.524400,0.000000,91.873100>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,-90.000000,0> translate<4.524400,0.000000,91.873100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.344700,0.000000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.344700,0.000000,91.330800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<5.344700,0.000000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.344700,0.000000,90.788500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.887000,0.000000,91.330800>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<5.344700,0.000000,90.788500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.887000,0.000000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.158100,0.000000,91.330800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<5.887000,0.000000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.708900,0.000000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.708900,0.000000,91.330800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<6.708900,0.000000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.708900,0.000000,90.788500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.251200,0.000000,91.330800>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<6.708900,0.000000,90.788500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.251200,0.000000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.522300,0.000000,91.330800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<7.251200,0.000000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.344200,0.000000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.886500,0.000000,90.246200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<8.344200,0.000000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.886500,0.000000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.157700,0.000000,90.517300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<8.886500,0.000000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.157700,0.000000,90.517300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.157700,0.000000,91.059600>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<9.157700,0.000000,91.059600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.157700,0.000000,91.059600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.886500,0.000000,91.330800>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<8.886500,0.000000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.886500,0.000000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.344200,0.000000,91.330800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<8.344200,0.000000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.344200,0.000000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.073100,0.000000,91.059600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<8.073100,0.000000,91.059600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.073100,0.000000,91.059600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.073100,0.000000,90.517300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<8.073100,0.000000,90.517300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.073100,0.000000,90.517300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.344200,0.000000,90.246200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<8.073100,0.000000,90.517300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.710200,0.000000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.710200,0.000000,91.330800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<9.710200,0.000000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.710200,0.000000,90.788500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.252500,0.000000,91.330800>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<9.710200,0.000000,90.788500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.252500,0.000000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.523600,0.000000,91.330800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<10.252500,0.000000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.796100,0.000000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.982600,0.000000,91.330800>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<12.982600,0.000000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.982600,0.000000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.711500,0.000000,91.059600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<12.711500,0.000000,91.059600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.711500,0.000000,91.059600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.711500,0.000000,90.517300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<12.711500,0.000000,90.517300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.711500,0.000000,90.517300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.982600,0.000000,90.246200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<12.711500,0.000000,90.517300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.982600,0.000000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.796100,0.000000,90.246200>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<12.982600,0.000000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.348600,0.000000,91.873100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.348600,0.000000,90.246200>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.348600,0.000000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.348600,0.000000,91.059600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.619700,0.000000,91.330800>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<14.348600,0.000000,91.059600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.619700,0.000000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.162000,0.000000,91.330800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<14.619700,0.000000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.162000,0.000000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.433200,0.000000,91.059600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<15.162000,0.000000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.433200,0.000000,91.059600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.433200,0.000000,90.246200>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.433200,0.000000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.799100,0.000000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.256800,0.000000,90.246200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<16.256800,0.000000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.256800,0.000000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.985700,0.000000,90.517300>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<15.985700,0.000000,90.517300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.985700,0.000000,90.517300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.985700,0.000000,91.059600>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<15.985700,0.000000,91.059600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.985700,0.000000,91.059600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.256800,0.000000,91.330800>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<15.985700,0.000000,91.059600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.256800,0.000000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.799100,0.000000,91.330800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<16.256800,0.000000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.799100,0.000000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.070300,0.000000,91.059600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<16.799100,0.000000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.070300,0.000000,91.059600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.070300,0.000000,90.788500>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.070300,0.000000,90.788500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.070300,0.000000,90.788500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.985700,0.000000,90.788500>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<15.985700,0.000000,90.788500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.707400,0.000000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.893900,0.000000,91.330800>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<17.893900,0.000000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.893900,0.000000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.622800,0.000000,91.059600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<17.622800,0.000000,91.059600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.622800,0.000000,91.059600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.622800,0.000000,90.517300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<17.622800,0.000000,90.517300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.622800,0.000000,90.517300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.893900,0.000000,90.246200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<17.622800,0.000000,90.517300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<17.893900,0.000000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<18.707400,0.000000,90.246200>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<17.893900,0.000000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.259900,0.000000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.259900,0.000000,91.873100>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,90.000000,0> translate<19.259900,0.000000,91.873100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.073300,0.000000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.259900,0.000000,90.788500>}
box{<0,0,-0.076200><0.977604,0.035000,0.076200> rotate<0,33.689470,0> translate<19.259900,0.000000,90.788500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<19.259900,0.000000,90.788500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.073300,0.000000,91.330800>}
box{<0,0,-0.076200><0.977604,0.035000,0.076200> rotate<0,-33.689470,0> translate<19.259900,0.000000,90.788500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.023800,-1.535000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.023800,-1.535000,91.873100>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,90.000000,0> translate<38.023800,-1.535000,91.873100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<38.023800,-1.535000,91.873100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.481500,-1.535000,91.330800>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<37.481500,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<37.481500,-1.535000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.939200,-1.535000,91.873100>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,44.997030,0> translate<36.939200,-1.535000,91.873100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.939200,-1.535000,91.873100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.939200,-1.535000,90.246200>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,-90.000000,0> translate<36.939200,-1.535000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.386700,-1.535000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.115600,-1.535000,91.330800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<36.115600,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.115600,-1.535000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.115600,-1.535000,90.246200>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,-90.000000,0> translate<36.115600,-1.535000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.386700,-1.535000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.844400,-1.535000,90.246200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<35.844400,-1.535000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.115600,-1.535000,92.144300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<36.115600,-1.535000,91.873100>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,-90.000000,0> translate<36.115600,-1.535000,91.873100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.295300,-1.535000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.295300,-1.535000,91.330800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<35.295300,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<35.295300,-1.535000,90.788500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<34.753000,-1.535000,91.330800>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,44.997030,0> translate<34.753000,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<34.753000,-1.535000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<34.481900,-1.535000,91.330800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<34.481900,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.931100,-1.535000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.931100,-1.535000,91.330800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<33.931100,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.931100,-1.535000,90.788500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.388800,-1.535000,91.330800>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,44.997030,0> translate<33.388800,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.388800,-1.535000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<33.117700,-1.535000,91.330800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<33.117700,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.295800,-1.535000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.753500,-1.535000,90.246200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<31.753500,-1.535000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.753500,-1.535000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.482300,-1.535000,90.517300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<31.482300,-1.535000,90.517300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.482300,-1.535000,90.517300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.482300,-1.535000,91.059600>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<31.482300,-1.535000,91.059600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.482300,-1.535000,91.059600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.753500,-1.535000,91.330800>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,-44.997030,0> translate<31.482300,-1.535000,91.059600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<31.753500,-1.535000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.295800,-1.535000,91.330800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<31.753500,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.295800,-1.535000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.566900,-1.535000,91.059600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<32.295800,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.566900,-1.535000,91.059600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.566900,-1.535000,90.517300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<32.566900,-1.535000,90.517300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.566900,-1.535000,90.517300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<32.295800,-1.535000,90.246200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<32.295800,-1.535000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.929800,-1.535000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.929800,-1.535000,91.330800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<30.929800,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.929800,-1.535000,90.788500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.387500,-1.535000,91.330800>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,44.997030,0> translate<30.387500,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.387500,-1.535000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<30.116400,-1.535000,91.330800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<30.116400,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.843900,-1.535000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.657400,-1.535000,91.330800>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<26.843900,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.657400,-1.535000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.928500,-1.535000,91.059600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<27.657400,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.928500,-1.535000,91.059600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.928500,-1.535000,90.517300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<27.928500,-1.535000,90.517300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.928500,-1.535000,90.517300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.657400,-1.535000,90.246200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<27.657400,-1.535000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<27.657400,-1.535000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.843900,-1.535000,90.246200>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<26.843900,-1.535000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.291400,-1.535000,91.873100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.291400,-1.535000,90.246200>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,-90.000000,0> translate<26.291400,-1.535000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.291400,-1.535000,91.059600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.020300,-1.535000,91.330800>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<26.020300,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<26.020300,-1.535000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.478000,-1.535000,91.330800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<25.478000,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.478000,-1.535000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.206800,-1.535000,91.059600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,-44.997030,0> translate<25.206800,-1.535000,91.059600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.206800,-1.535000,91.059600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<25.206800,-1.535000,90.246200>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,-90.000000,0> translate<25.206800,-1.535000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.840900,-1.535000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.383200,-1.535000,90.246200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<23.840900,-1.535000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.383200,-1.535000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.654300,-1.535000,90.517300>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<24.383200,-1.535000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.654300,-1.535000,90.517300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.654300,-1.535000,91.059600>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<24.654300,-1.535000,91.059600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.654300,-1.535000,91.059600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.383200,-1.535000,91.330800>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<24.383200,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.383200,-1.535000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.840900,-1.535000,91.330800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<23.840900,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.840900,-1.535000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.569700,-1.535000,91.059600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,-44.997030,0> translate<23.569700,-1.535000,91.059600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.569700,-1.535000,91.059600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.569700,-1.535000,90.788500>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<23.569700,-1.535000,90.788500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.569700,-1.535000,90.788500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<24.654300,-1.535000,90.788500>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<23.569700,-1.535000,90.788500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.932600,-1.535000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.746100,-1.535000,91.330800>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<21.932600,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.746100,-1.535000,91.330800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.017200,-1.535000,91.059600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<22.746100,-1.535000,91.330800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.017200,-1.535000,91.059600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.017200,-1.535000,90.517300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<23.017200,-1.535000,90.517300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<23.017200,-1.535000,90.517300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.746100,-1.535000,90.246200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<22.746100,-1.535000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<22.746100,-1.535000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.932600,-1.535000,90.246200>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<21.932600,-1.535000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.380100,-1.535000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.380100,-1.535000,91.873100>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,90.000000,0> translate<21.380100,-1.535000,91.873100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.566700,-1.535000,90.246200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.380100,-1.535000,90.788500>}
box{<0,0,-0.076200><0.977604,0.035000,0.076200> rotate<0,-33.689470,0> translate<20.566700,-1.535000,90.246200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<21.380100,-1.535000,90.788500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.566700,-1.535000,91.330800>}
box{<0,0,-0.076200><0.977604,0.035000,0.076200> rotate<0,33.689470,0> translate<20.566700,-1.535000,91.330800> }
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.000000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,0.000000,21.590000>}
box{<0,0,-0.203200><39.370000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.000000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.000000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.000000,0.000000,21.590000>}
box{<0,0,-0.203200><33.020000,0.035000,0.203200> rotate<0,-90.000000,0> translate<0.000000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<0.000000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,0.000000,54.610000>}
box{<0,0,-0.203200><10.160000,0.035000,0.203200> rotate<0,0.000000,0> translate<0.000000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,0.000000,54.610000>}
box{<0,0,-0.203200><11.430000,0.035000,0.203200> rotate<0,90.000000,0> translate<10.160000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,0.000000,38.100000>}
box{<0,0,-0.203200><7.184205,0.035000,0.203200> rotate<0,44.997030,0> translate<10.160000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.240000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,0.000000,38.100000>}
box{<0,0,-0.203200><24.130000,0.035000,0.203200> rotate<0,0.000000,0> translate<15.240000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.370000,0.000000,38.100000>}
box{<0,0,-0.203200><16.510000,0.035000,0.203200> rotate<0,90.000000,0> translate<39.370000,0.000000,38.100000> }
texture{col_pol}
}
#end
union{
cylinder{<13.970000,0.038000,5.080000><13.970000,-1.538000,5.080000>0.500000}
cylinder{<11.430000,0.038000,5.080000><11.430000,-1.538000,5.080000>0.500000}
cylinder{<16.510000,0.038000,5.080000><16.510000,-1.538000,5.080000>0.500000}
cylinder{<27.970000,0.038000,5.050000><27.970000,-1.538000,5.050000>0.450000}
cylinder{<27.970000,0.038000,7.590000><27.970000,-1.538000,7.590000>0.450000}
cylinder{<27.970000,0.038000,10.130000><27.970000,-1.538000,10.130000>0.450000}
cylinder{<19.740000,0.038000,25.170000><19.740000,-1.538000,25.170000>0.450000}
cylinder{<17.200000,0.038000,26.440000><17.200000,-1.538000,26.440000>0.450000}
cylinder{<19.740000,0.038000,27.710000><19.740000,-1.538000,27.710000>0.450000}
cylinder{<17.200000,0.038000,28.980000><17.200000,-1.538000,28.980000>0.450000}
cylinder{<19.740000,0.038000,30.250000><19.740000,-1.538000,30.250000>0.450000}
cylinder{<17.200000,0.038000,31.520000><17.200000,-1.538000,31.520000>0.450000}
cylinder{<19.740000,0.038000,32.790000><19.740000,-1.538000,32.790000>0.450000}
cylinder{<17.200000,0.038000,34.060000><17.200000,-1.538000,34.060000>0.450000}
cylinder{<44.450000,0.038000,36.830000><44.450000,-1.538000,36.830000>0.550000}
cylinder{<44.450000,0.038000,39.370000><44.450000,-1.538000,39.370000>0.550000}
cylinder{<44.450000,0.038000,41.910000><44.450000,-1.538000,41.910000>0.550000}
cylinder{<44.450000,0.038000,44.450000><44.450000,-1.538000,44.450000>0.550000}
cylinder{<44.450000,0.038000,46.990000><44.450000,-1.538000,46.990000>0.550000}
cylinder{<44.450000,0.038000,49.530000><44.450000,-1.538000,49.530000>0.550000}
cylinder{<44.450000,0.038000,52.070000><44.450000,-1.538000,52.070000>0.550000}
cylinder{<44.450000,0.038000,54.610000><44.450000,-1.538000,54.610000>0.550000}
cylinder{<20.955000,0.038000,62.230000><20.955000,-1.538000,62.230000>0.450000}
cylinder{<19.685000,0.038000,59.690000><19.685000,-1.538000,59.690000>0.450000}
cylinder{<18.415000,0.038000,62.230000><18.415000,-1.538000,62.230000>0.450000}
cylinder{<17.145000,0.038000,59.690000><17.145000,-1.538000,59.690000>0.450000}
cylinder{<15.875000,0.038000,62.230000><15.875000,-1.538000,62.230000>0.450000}
cylinder{<14.605000,0.038000,59.690000><14.605000,-1.538000,59.690000>0.450000}
cylinder{<13.335000,0.038000,62.230000><13.335000,-1.538000,62.230000>0.450000}
cylinder{<12.065000,0.038000,59.690000><12.065000,-1.538000,59.690000>0.450000}
cylinder{<37.465000,0.038000,62.230000><37.465000,-1.538000,62.230000>0.450000}
cylinder{<36.195000,0.038000,59.690000><36.195000,-1.538000,59.690000>0.450000}
cylinder{<34.925000,0.038000,62.230000><34.925000,-1.538000,62.230000>0.450000}
cylinder{<33.655000,0.038000,59.690000><33.655000,-1.538000,59.690000>0.450000}
cylinder{<32.385000,0.038000,62.230000><32.385000,-1.538000,62.230000>0.450000}
cylinder{<31.115000,0.038000,59.690000><31.115000,-1.538000,59.690000>0.450000}
cylinder{<29.845000,0.038000,62.230000><29.845000,-1.538000,62.230000>0.450000}
cylinder{<28.575000,0.038000,59.690000><28.575000,-1.538000,59.690000>0.450000}
cylinder{<15.470000,0.038000,50.500000><15.470000,-1.538000,50.500000>0.450000}
cylinder{<12.930000,0.038000,49.230000><12.930000,-1.538000,49.230000>0.450000}
cylinder{<15.470000,0.038000,47.960000><15.470000,-1.538000,47.960000>0.450000}
cylinder{<12.930000,0.038000,46.690000><12.930000,-1.538000,46.690000>0.450000}
cylinder{<15.470000,0.038000,45.420000><15.470000,-1.538000,45.420000>0.450000}
cylinder{<12.930000,0.038000,44.150000><12.930000,-1.538000,44.150000>0.450000}
//Holes(fast)/Vias
cylinder{<26.670000,0.038000,19.050000><26.670000,-1.538000,19.050000>0.350000 }
cylinder{<20.320000,0.038000,2.540000><20.320000,-1.538000,2.540000>0.350000 }
cylinder{<33.020000,0.038000,50.800000><33.020000,-1.538000,50.800000>0.350000 }
cylinder{<44.000000,0.038000,21.500000><44.000000,-1.538000,21.500000>0.350000 }
cylinder{<38.700000,0.038000,7.900000><38.700000,-1.538000,7.900000>0.350000 }
cylinder{<33.330000,0.038000,40.400000><33.330000,-1.538000,40.400000>0.350000 }
cylinder{<40.640000,0.038000,30.480000><40.640000,-1.538000,30.480000>0.350000 }
cylinder{<19.050000,0.038000,12.700000><19.050000,-1.538000,12.700000>0.350000 }
cylinder{<34.300000,0.038000,17.000000><34.300000,-1.538000,17.000000>0.350000 }
cylinder{<27.940000,0.038000,39.370000><27.940000,-1.538000,39.370000>0.350000 }
cylinder{<27.940000,0.038000,43.180000><27.940000,-1.538000,43.180000>0.350000 }
cylinder{<29.210000,0.038000,52.070000><29.210000,-1.538000,52.070000>0.350000 }
cylinder{<27.440000,0.038000,53.340000><27.440000,-1.538000,53.340000>0.350000 }
cylinder{<29.210000,0.038000,38.100000><29.210000,-1.538000,38.100000>0.350000 }
cylinder{<29.210000,0.038000,41.910000><29.210000,-1.538000,41.910000>0.350000 }
cylinder{<38.100000,0.038000,45.720000><38.100000,-1.538000,45.720000>0.350000 }
cylinder{<41.910000,0.038000,33.020000><41.910000,-1.538000,33.020000>0.350000 }
cylinder{<27.140000,0.038000,49.530000><27.140000,-1.538000,49.530000>0.350000 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.585600,0.000000,12.292100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.585600,0.000000,13.232700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<33.585600,0.000000,13.232700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.585600,0.000000,13.232700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.055900,0.000000,13.232700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<33.585600,0.000000,13.232700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.055900,0.000000,13.232700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.212600,0.000000,13.075900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<34.055900,0.000000,13.232700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.212600,0.000000,13.075900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.212600,0.000000,12.762400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.212600,0.000000,12.762400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.212600,0.000000,12.762400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.055900,0.000000,12.605600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<34.055900,0.000000,12.605600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.055900,0.000000,12.605600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.585600,0.000000,12.605600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<33.585600,0.000000,12.605600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.899100,0.000000,12.605600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.212600,0.000000,12.292100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<33.899100,0.000000,12.605600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.148100,0.000000,13.232700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.521100,0.000000,13.232700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<34.521100,0.000000,13.232700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.521100,0.000000,13.232700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.521100,0.000000,12.292100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.521100,0.000000,12.292100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.521100,0.000000,12.292100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.148100,0.000000,12.292100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<34.521100,0.000000,12.292100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.521100,0.000000,12.762400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.834600,0.000000,12.762400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<34.521100,0.000000,12.762400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.083600,0.000000,13.075900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.926900,0.000000,13.232700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<35.926900,0.000000,13.232700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.926900,0.000000,13.232700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.613300,0.000000,13.232700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<35.613300,0.000000,13.232700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.613300,0.000000,13.232700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.456600,0.000000,13.075900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<35.456600,0.000000,13.075900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.456600,0.000000,13.075900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.456600,0.000000,12.919100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<35.456600,0.000000,12.919100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.456600,0.000000,12.919100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.613300,0.000000,12.762400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.456600,0.000000,12.919100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.613300,0.000000,12.762400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.926900,0.000000,12.762400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<35.613300,0.000000,12.762400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.926900,0.000000,12.762400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.083600,0.000000,12.605600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<35.926900,0.000000,12.762400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.083600,0.000000,12.605600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.083600,0.000000,12.448800>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.083600,0.000000,12.448800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.083600,0.000000,12.448800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.926900,0.000000,12.292100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<35.926900,0.000000,12.292100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.926900,0.000000,12.292100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.613300,0.000000,12.292100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<35.613300,0.000000,12.292100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.613300,0.000000,12.292100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<35.456600,0.000000,12.448800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<35.456600,0.000000,12.448800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.019100,0.000000,13.232700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.392100,0.000000,13.232700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<36.392100,0.000000,13.232700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.392100,0.000000,13.232700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.392100,0.000000,12.292100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,-90.000000,0> translate<36.392100,0.000000,12.292100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.392100,0.000000,12.292100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.019100,0.000000,12.292100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<36.392100,0.000000,12.292100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.392100,0.000000,12.762400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<36.705600,0.000000,12.762400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<36.392100,0.000000,12.762400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.641100,0.000000,12.292100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.641100,0.000000,13.232700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<37.641100,0.000000,13.232700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.327600,0.000000,13.232700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.954600,0.000000,13.232700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<37.327600,0.000000,13.232700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.629500,0.000000,10.385300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.138100,0.000000,10.385300>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<0.138100,0.000000,10.385300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.138100,0.000000,10.385300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.138100,0.000000,10.016700>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<0.138100,0.000000,10.016700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.138100,0.000000,10.016700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.383800,0.000000,10.139500>}
box{<0,0,-0.038100><0.274679,0.036000,0.038100> rotate<0,-26.553970,0> translate<0.138100,0.000000,10.016700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.383800,0.000000,10.139500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.506700,0.000000,10.139500>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,0.000000,0> translate<0.383800,0.000000,10.139500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.506700,0.000000,10.139500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.629500,0.000000,10.016700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<0.506700,0.000000,10.139500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.629500,0.000000,10.016700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.629500,0.000000,9.770900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<0.629500,0.000000,9.770900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.629500,0.000000,9.770900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.506700,0.000000,9.648100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<0.506700,0.000000,9.648100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.506700,0.000000,9.648100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.260900,0.000000,9.648100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<0.260900,0.000000,9.648100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.260900,0.000000,9.648100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.138100,0.000000,9.770900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<0.138100,0.000000,9.770900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.886500,0.000000,10.385300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.886500,0.000000,9.893800>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,-90.000000,0> translate<0.886500,0.000000,9.893800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<0.886500,0.000000,9.893800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.132200,0.000000,9.648100>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,44.997030,0> translate<0.886500,0.000000,9.893800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.132200,0.000000,9.648100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.377900,0.000000,9.893800>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,-44.997030,0> translate<1.132200,0.000000,9.648100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.377900,0.000000,9.893800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.377900,0.000000,10.385300>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,90.000000,0> translate<1.377900,0.000000,10.385300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.383300,0.000000,10.385300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.383300,0.000000,9.648100>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.383300,0.000000,9.648100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.383300,0.000000,9.648100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.751900,0.000000,9.648100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<2.383300,0.000000,9.648100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.751900,0.000000,9.648100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.874700,0.000000,9.770900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<2.751900,0.000000,9.648100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.874700,0.000000,9.770900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.874700,0.000000,10.262400>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,90.000000,0> translate<2.874700,0.000000,10.262400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.874700,0.000000,10.262400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.751900,0.000000,10.385300>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<2.751900,0.000000,10.385300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.751900,0.000000,10.385300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.383300,0.000000,10.385300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<2.383300,0.000000,10.385300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.623100,0.000000,10.262400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.500300,0.000000,10.385300>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<3.500300,0.000000,10.385300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.500300,0.000000,10.385300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.254500,0.000000,10.385300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<3.254500,0.000000,10.385300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.254500,0.000000,10.385300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.131700,0.000000,10.262400>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<3.131700,0.000000,10.262400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.131700,0.000000,10.262400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.131700,0.000000,9.770900>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.131700,0.000000,9.770900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.131700,0.000000,9.770900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.254500,0.000000,9.648100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<3.131700,0.000000,9.770900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.254500,0.000000,9.648100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.500300,0.000000,9.648100>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<3.254500,0.000000,9.648100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.500300,0.000000,9.648100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.623100,0.000000,9.770900>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<3.500300,0.000000,9.648100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.628500,0.000000,10.139500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.751300,0.000000,10.139500>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<4.628500,0.000000,10.139500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.751300,0.000000,10.139500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.751300,0.000000,9.648100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.751300,0.000000,9.648100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.628500,0.000000,9.648100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.874200,0.000000,9.648100>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<4.628500,0.000000,9.648100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.751300,0.000000,10.508200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.751300,0.000000,10.385300>}
box{<0,0,-0.038100><0.122900,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.751300,0.000000,10.385300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.127400,0.000000,9.648100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.127400,0.000000,10.139500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<5.127400,0.000000,10.139500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.127400,0.000000,10.139500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.496000,0.000000,10.139500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<5.127400,0.000000,10.139500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.496000,0.000000,10.139500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.618800,0.000000,10.016700>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<5.496000,0.000000,10.139500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.618800,0.000000,10.016700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<5.618800,0.000000,9.648100>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,-90.000000,0> translate<5.618800,0.000000,9.648100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.840500,0.000000,40.678100>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<38.840500,0.000000,40.678100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.840500,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.594700,0.000000,40.923800>}
box{<0,0,-0.038100><0.347543,0.036000,0.038100> rotate<0,44.985374,0> translate<38.594700,0.000000,40.923800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.594700,0.000000,40.923800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.840500,0.000000,41.169500>}
box{<0,0,-0.038100><0.347543,0.036000,0.038100> rotate<0,-44.985374,0> translate<38.594700,0.000000,40.923800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.840500,0.000000,41.169500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,41.169500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<38.840500,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.963300,0.000000,40.678100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.963300,0.000000,41.169500>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<38.963300,0.000000,41.169500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,41.426500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.594700,0.000000,41.426500>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<38.594700,0.000000,41.426500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.594700,0.000000,41.426500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,41.917900>}
box{<0,0,-0.038100><0.885967,0.036000,0.038100> rotate<0,-33.684257,0> translate<38.594700,0.000000,41.426500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,41.917900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.594700,0.000000,41.917900>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<38.594700,0.000000,41.917900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,42.420600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,42.174900>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.331900,0.000000,42.174900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,42.174900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.594700,0.000000,42.174900>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<38.594700,0.000000,42.174900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.594700,0.000000,42.174900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.594700,0.000000,42.420600>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<38.594700,0.000000,42.420600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209100,0.000000,42.673800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.717600,0.000000,42.673800>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,0.000000,0> translate<38.717600,0.000000,42.673800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.717600,0.000000,42.673800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.594700,0.000000,42.796600>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,44.973712,0> translate<38.594700,0.000000,42.796600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.594700,0.000000,42.796600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.594700,0.000000,43.042400>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<38.594700,0.000000,43.042400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.594700,0.000000,43.042400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.717600,0.000000,43.165200>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-44.973712,0> translate<38.594700,0.000000,43.042400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.717600,0.000000,43.165200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209100,0.000000,43.165200>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,0.000000,0> translate<38.717600,0.000000,43.165200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209100,0.000000,43.165200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,43.042400>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<39.209100,0.000000,43.165200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,43.042400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,42.796600>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.331900,0.000000,42.796600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,42.796600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209100,0.000000,42.673800>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.209100,0.000000,42.673800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209100,0.000000,42.673800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.717600,0.000000,43.165200>}
box{<0,0,-0.038100><0.695015,0.036000,0.038100> rotate<0,44.991201,0> translate<38.717600,0.000000,43.165200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,43.422200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209100,0.000000,43.422200>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<39.209100,0.000000,43.422200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209100,0.000000,43.422200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209100,0.000000,43.545000>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<39.209100,0.000000,43.545000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209100,0.000000,43.545000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,43.545000>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<39.209100,0.000000,43.545000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,43.545000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,43.422200>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.331900,0.000000,43.422200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,43.796400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209100,0.000000,43.796400>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<39.209100,0.000000,43.796400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209100,0.000000,43.796400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209100,0.000000,43.919200>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,90.000000,0> translate<39.209100,0.000000,43.919200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.209100,0.000000,43.919200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,43.919200>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,0.000000,0> translate<39.209100,0.000000,43.919200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,43.919200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,43.796400>}
box{<0,0,-0.038100><0.122800,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.331900,0.000000,43.796400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,44.539200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.594700,0.000000,44.539200>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<38.594700,0.000000,44.539200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.594700,0.000000,44.539200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.963300,0.000000,44.170600>}
box{<0,0,-0.038100><0.521279,0.036000,0.038100> rotate<0,44.997030,0> translate<38.594700,0.000000,44.539200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.963300,0.000000,44.170600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.963300,0.000000,44.662000>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,90.000000,0> translate<38.963300,0.000000,44.662000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,44.919000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,45.164700>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,90.000000,0> translate<39.331900,0.000000,45.164700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.331900,0.000000,45.164700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.594700,0.000000,45.164700>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,0.000000,0> translate<38.594700,0.000000,45.164700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.594700,0.000000,45.164700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.594700,0.000000,44.919000>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.594700,0.000000,44.919000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.792900,0.000000,50.062500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.792900,0.000000,49.325300>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.792900,0.000000,49.325300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.792900,0.000000,49.325300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.284300,0.000000,49.325300>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<37.792900,0.000000,49.325300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.541300,0.000000,50.062500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.541300,0.000000,49.571000>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.541300,0.000000,49.571000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.541300,0.000000,49.571000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.787000,0.000000,49.325300>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,44.997030,0> translate<38.541300,0.000000,49.571000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.787000,0.000000,49.325300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.032700,0.000000,49.571000>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.787000,0.000000,49.325300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.032700,0.000000,49.571000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.032700,0.000000,50.062500>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,90.000000,0> translate<39.032700,0.000000,50.062500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.289700,0.000000,50.062500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.289700,0.000000,49.325300>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.289700,0.000000,49.325300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.289700,0.000000,49.325300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.781100,0.000000,49.325300>}
box{<0,0,-0.038100><0.491400,0.036000,0.038100> rotate<0,0.000000,0> translate<39.289700,0.000000,49.325300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.762900,0.000000,52.562500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.762900,0.000000,52.071000>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.762900,0.000000,52.071000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.762900,0.000000,52.071000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.008600,0.000000,51.825300>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,44.997030,0> translate<37.762900,0.000000,52.071000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.008600,0.000000,51.825300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.254300,0.000000,52.071000>}
box{<0,0,-0.038100><0.347472,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.008600,0.000000,51.825300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.254300,0.000000,52.071000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.254300,0.000000,52.562500>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,90.000000,0> translate<38.254300,0.000000,52.562500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.002700,0.000000,52.439600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.879900,0.000000,52.562500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<38.879900,0.000000,52.562500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.879900,0.000000,52.562500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.634100,0.000000,52.562500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<38.634100,0.000000,52.562500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.634100,0.000000,52.562500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.511300,0.000000,52.439600>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<38.511300,0.000000,52.439600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.511300,0.000000,52.439600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.511300,0.000000,51.948100>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.511300,0.000000,51.948100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.511300,0.000000,51.948100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.634100,0.000000,51.825300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<38.511300,0.000000,51.948100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.634100,0.000000,51.825300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.879900,0.000000,51.825300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<38.634100,0.000000,51.825300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.879900,0.000000,51.825300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.002700,0.000000,51.948100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.879900,0.000000,51.825300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.751100,0.000000,52.439600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.628300,0.000000,52.562500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<39.628300,0.000000,52.562500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.628300,0.000000,52.562500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.382500,0.000000,52.562500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<39.382500,0.000000,52.562500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.382500,0.000000,52.562500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.259700,0.000000,52.439600>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<39.259700,0.000000,52.439600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.259700,0.000000,52.439600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.259700,0.000000,51.948100>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.259700,0.000000,51.948100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.259700,0.000000,51.948100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.382500,0.000000,51.825300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<39.259700,0.000000,51.948100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.382500,0.000000,51.825300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.628300,0.000000,51.825300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<39.382500,0.000000,51.825300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.628300,0.000000,51.825300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.751100,0.000000,51.948100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.628300,0.000000,51.825300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.254300,0.000000,54.979600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.131500,0.000000,55.102500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<38.131500,0.000000,55.102500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.131500,0.000000,55.102500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.885700,0.000000,55.102500>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<37.885700,0.000000,55.102500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.885700,0.000000,55.102500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.762900,0.000000,54.979600>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,-45.020348,0> translate<37.762900,0.000000,54.979600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.762900,0.000000,54.979600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.762900,0.000000,54.488100>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.762900,0.000000,54.488100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.762900,0.000000,54.488100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.885700,0.000000,54.365300>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,44.997030,0> translate<37.762900,0.000000,54.488100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.885700,0.000000,54.365300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.131500,0.000000,54.365300>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,0.000000,0> translate<37.885700,0.000000,54.365300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.131500,0.000000,54.365300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.254300,0.000000,54.488100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.131500,0.000000,54.365300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.254300,0.000000,54.488100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.254300,0.000000,54.733900>}
box{<0,0,-0.038100><0.245800,0.036000,0.038100> rotate<0,90.000000,0> translate<38.254300,0.000000,54.733900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.254300,0.000000,54.733900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.008600,0.000000,54.733900>}
box{<0,0,-0.038100><0.245700,0.036000,0.038100> rotate<0,0.000000,0> translate<38.008600,0.000000,54.733900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.511300,0.000000,54.365300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.511300,0.000000,55.102500>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,90.000000,0> translate<38.511300,0.000000,55.102500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.511300,0.000000,55.102500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.002700,0.000000,54.365300>}
box{<0,0,-0.038100><0.885967,0.036000,0.038100> rotate<0,56.309803,0> translate<38.511300,0.000000,55.102500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.002700,0.000000,54.365300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.002700,0.000000,55.102500>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,90.000000,0> translate<39.002700,0.000000,55.102500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.259700,0.000000,55.102500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.259700,0.000000,54.365300>}
box{<0,0,-0.038100><0.737200,0.036000,0.038100> rotate<0,-90.000000,0> translate<39.259700,0.000000,54.365300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.259700,0.000000,54.365300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.628300,0.000000,54.365300>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<39.259700,0.000000,54.365300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.628300,0.000000,54.365300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.751100,0.000000,54.488100>}
box{<0,0,-0.038100><0.173665,0.036000,0.038100> rotate<0,-44.997030,0> translate<39.628300,0.000000,54.365300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.751100,0.000000,54.488100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.751100,0.000000,54.979600>}
box{<0,0,-0.038100><0.491500,0.036000,0.038100> rotate<0,90.000000,0> translate<39.751100,0.000000,54.979600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.751100,0.000000,54.979600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.628300,0.000000,55.102500>}
box{<0,0,-0.038100><0.173736,0.036000,0.038100> rotate<0,45.020348,0> translate<39.628300,0.000000,55.102500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.628300,0.000000,55.102500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<39.259700,0.000000,55.102500>}
box{<0,0,-0.038100><0.368600,0.036000,0.038100> rotate<0,0.000000,0> translate<39.259700,0.000000,55.102500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,59.740800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.049900,0.000000,59.740800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<0.049900,0.000000,59.740800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.049900,0.000000,59.740800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,60.520300>}
box{<0,0,-0.050800><1.405305,0.036000,0.050800> rotate<0,-33.686713,0> translate<0.049900,0.000000,59.740800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,60.520300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.049900,0.000000,60.520300>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<0.049900,0.000000,60.520300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,61.494700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,61.104900>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.219200,0.000000,61.104900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,61.104900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,60.910100>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.024400,0.000000,60.910100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,60.910100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.634600,0.000000,60.910100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<0.634600,0.000000,60.910100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.634600,0.000000,60.910100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,61.104900>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<0.439700,0.000000,61.104900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,61.104900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,61.494700>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<0.439700,0.000000,61.494700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,61.494700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.634600,0.000000,61.689600>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<0.439700,0.000000,61.494700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.634600,0.000000,61.689600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.829500,0.000000,61.689600>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<0.634600,0.000000,61.689600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.829500,0.000000,61.689600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.829500,0.000000,60.910100>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.829500,0.000000,60.910100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.244800,0.000000,62.274200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,62.274200>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<0.244800,0.000000,62.274200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,62.274200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,62.469100>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-45.011732,0> translate<1.024400,0.000000,62.274200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,62.079400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,62.469100>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,90.000000,0> translate<0.439700,0.000000,62.469100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,62.858900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.049900,0.000000,62.858900>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<0.049900,0.000000,62.858900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.049900,0.000000,62.858900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,63.638400>}
box{<0,0,-0.050800><1.405305,0.036000,0.050800> rotate<0,-33.686713,0> translate<0.049900,0.000000,62.858900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,63.638400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.049900,0.000000,63.638400>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<0.049900,0.000000,63.638400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,64.223000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,64.612800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<1.219200,0.000000,64.612800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,64.612800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,64.807700>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<1.024400,0.000000,64.807700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,64.807700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.634600,0.000000,64.807700>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<0.634600,0.000000,64.807700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.634600,0.000000,64.807700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,64.612800>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<0.439700,0.000000,64.612800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,64.612800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,64.223000>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.439700,0.000000,64.223000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,64.223000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.634600,0.000000,64.028200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<0.439700,0.000000,64.223000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.634600,0.000000,64.028200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,64.028200>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<0.634600,0.000000,64.028200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,64.028200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,64.223000>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.024400,0.000000,64.028200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.049900,0.000000,65.977000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,65.977000>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<0.049900,0.000000,65.977000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,65.977000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,65.392300>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.219200,0.000000,65.392300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,65.392300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,65.197500>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.024400,0.000000,65.197500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,65.197500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.634600,0.000000,65.197500>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<0.634600,0.000000,65.197500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.634600,0.000000,65.197500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,65.392300>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<0.439700,0.000000,65.392300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,65.392300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,65.977000>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,90.000000,0> translate<0.439700,0.000000,65.977000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,66.951400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,66.561600>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.219200,0.000000,66.561600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,66.561600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,66.366800>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.024400,0.000000,66.366800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,66.366800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.634600,0.000000,66.366800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<0.634600,0.000000,66.366800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.634600,0.000000,66.366800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,66.561600>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<0.439700,0.000000,66.561600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,66.561600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,66.951400>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<0.439700,0.000000,66.951400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,66.951400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.634600,0.000000,67.146300>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<0.439700,0.000000,66.951400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.634600,0.000000,67.146300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.829500,0.000000,67.146300>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<0.634600,0.000000,67.146300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.829500,0.000000,67.146300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.829500,0.000000,66.366800>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.829500,0.000000,66.366800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,68.705400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,69.095100>}
box{<0,0,-0.050800><0.871485,0.036000,0.050800> rotate<0,-26.560358,0> translate<0.439700,0.000000,68.705400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,69.095100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,69.484900>}
box{<0,0,-0.050800><0.871530,0.036000,0.050800> rotate<0,26.566238,0> translate<0.439700,0.000000,69.484900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.439700,0.000000,69.874700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.049900,0.000000,70.264400>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<0.049900,0.000000,70.264400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.049900,0.000000,70.264400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,70.264400>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<0.049900,0.000000,70.264400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,69.874700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,70.654200>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<1.219200,0.000000,70.654200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,71.044000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,71.044000>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,0.000000,0> translate<1.024400,0.000000,71.044000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,71.044000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,71.238800>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,90.000000,0> translate<1.024400,0.000000,71.238800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,71.238800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,71.238800>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,0.000000,0> translate<1.024400,0.000000,71.238800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,71.238800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,71.044000>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.219200,0.000000,71.044000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,71.628600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.244800,0.000000,71.628600>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<0.244800,0.000000,71.628600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.244800,0.000000,71.628600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.049900,0.000000,71.823400>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<0.049900,0.000000,71.823400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.049900,0.000000,71.823400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.049900,0.000000,72.213200>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<0.049900,0.000000,72.213200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.049900,0.000000,72.213200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.244800,0.000000,72.408100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<0.049900,0.000000,72.213200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.244800,0.000000,72.408100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,72.408100>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<0.244800,0.000000,72.408100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,72.408100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,72.213200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<1.024400,0.000000,72.408100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,72.213200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,71.823400>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.219200,0.000000,71.823400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219200,0.000000,71.823400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,71.628600>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.024400,0.000000,71.628600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.024400,0.000000,71.628600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.244800,0.000000,72.408100>}
box{<0,0,-0.050800><1.102450,0.036000,0.050800> rotate<0,44.993355,0> translate<0.244800,0.000000,72.408100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.404900,0.000000,59.527200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,59.527200>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<46.404900,0.000000,59.527200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,59.527200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,60.306700>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<47.574200,0.000000,60.306700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,60.696500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,60.696500>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,0.000000,0> translate<47.379400,0.000000,60.696500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,60.696500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,60.891300>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,90.000000,0> translate<47.379400,0.000000,60.891300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,60.891300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,60.891300>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,0.000000,0> translate<47.379400,0.000000,60.891300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,60.891300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,60.696500>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,-90.000000,0> translate<47.574200,0.000000,60.696500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,62.450400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.404900,0.000000,62.450400>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<46.404900,0.000000,62.450400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,62.450400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,63.229900>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<46.989600,0.000000,63.229900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.404900,0.000000,63.229900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,63.229900>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<46.404900,0.000000,63.229900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,63.814500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,64.204300>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<47.574200,0.000000,64.204300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,64.204300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,64.399200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<47.379400,0.000000,64.399200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,64.399200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,64.399200>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<46.989600,0.000000,64.399200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,64.399200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,64.204300>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<46.794700,0.000000,64.204300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,64.204300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,63.814500>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<46.794700,0.000000,63.814500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,63.814500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,63.619700>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<46.794700,0.000000,63.814500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,63.619700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,63.619700>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<46.989600,0.000000,63.619700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,63.619700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,63.814500>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<47.379400,0.000000,63.619700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.404900,0.000000,64.789000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.404900,0.000000,64.983800>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,90.000000,0> translate<46.404900,0.000000,64.983800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.404900,0.000000,64.983800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,64.983800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<46.404900,0.000000,64.983800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,64.789000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,65.178700>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,90.000000,0> translate<47.574200,0.000000,65.178700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.404900,0.000000,65.568500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.404900,0.000000,65.763300>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,90.000000,0> translate<46.404900,0.000000,65.763300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.404900,0.000000,65.763300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,65.763300>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<46.404900,0.000000,65.763300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,65.568500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,65.958200>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,90.000000,0> translate<47.574200,0.000000,65.958200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,66.932600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,66.542800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<47.574200,0.000000,66.542800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,66.542800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,66.348000>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<47.379400,0.000000,66.348000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,66.348000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,66.348000>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<46.989600,0.000000,66.348000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,66.348000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,66.542800>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<46.794700,0.000000,66.542800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,66.542800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,66.932600>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<46.794700,0.000000,66.932600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,66.932600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,67.127500>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<46.794700,0.000000,66.932600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,67.127500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.184500,0.000000,67.127500>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<46.989600,0.000000,67.127500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.184500,0.000000,67.127500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.184500,0.000000,66.348000>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,-90.000000,0> translate<47.184500,0.000000,66.348000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,67.517300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,67.907000>}
box{<0,0,-0.050800><0.871485,0.036000,0.050800> rotate<0,-26.560358,0> translate<46.794700,0.000000,67.517300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,67.907000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,68.296800>}
box{<0,0,-0.050800><0.871530,0.036000,0.050800> rotate<0,26.566238,0> translate<46.794700,0.000000,68.296800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,68.881400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,69.271200>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<47.574200,0.000000,69.271200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,69.271200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,69.466100>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<47.379400,0.000000,69.466100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,69.466100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,69.466100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<46.989600,0.000000,69.466100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,69.466100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,69.271200>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<46.794700,0.000000,69.271200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,69.271200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,68.881400>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<46.794700,0.000000,68.881400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,68.881400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,68.686600>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<46.794700,0.000000,68.881400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,68.686600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,68.686600>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<46.989600,0.000000,68.686600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,68.686600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,68.881400>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<47.379400,0.000000,68.686600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,70.440500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,70.050700>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<47.574200,0.000000,70.050700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,70.050700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,69.855900>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<47.379400,0.000000,69.855900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,69.855900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,69.855900>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<46.989600,0.000000,69.855900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,69.855900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,70.050700>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<46.794700,0.000000,70.050700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,70.050700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,70.440500>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<46.794700,0.000000,70.440500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,70.440500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,70.635400>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<46.794700,0.000000,70.440500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.989600,0.000000,70.635400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.184500,0.000000,70.635400>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<46.989600,0.000000,70.635400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.184500,0.000000,70.635400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.184500,0.000000,69.855900>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,-90.000000,0> translate<47.184500,0.000000,69.855900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.599800,0.000000,71.220000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,71.220000>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<46.599800,0.000000,71.220000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.379400,0.000000,71.220000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.574200,0.000000,71.414900>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-45.011732,0> translate<47.379400,0.000000,71.220000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,71.025200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.794700,0.000000,71.414900>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,90.000000,0> translate<46.794700,0.000000,71.414900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.029200,0.000000,61.010800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.029200,0.000000,61.400500>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,90.000000,0> translate<5.029200,0.000000,61.400500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.029200,0.000000,61.205600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.859900,0.000000,61.205600>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<3.859900,0.000000,61.205600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.859900,0.000000,61.010800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.859900,0.000000,61.400500>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,90.000000,0> translate<3.859900,0.000000,61.400500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.859900,0.000000,61.790300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.029200,0.000000,61.790300>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<3.859900,0.000000,61.790300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.029200,0.000000,61.790300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.029200,0.000000,62.374900>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,90.000000,0> translate<5.029200,0.000000,62.374900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.029200,0.000000,62.374900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.834400,0.000000,62.569800>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<4.834400,0.000000,62.569800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.834400,0.000000,62.569800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.054800,0.000000,62.569800>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<4.054800,0.000000,62.569800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.054800,0.000000,62.569800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.859900,0.000000,62.374900>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<3.859900,0.000000,62.374900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.859900,0.000000,62.374900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.859900,0.000000,61.790300>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,-90.000000,0> translate<3.859900,0.000000,61.790300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.249700,0.000000,62.959600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.249700,0.000000,63.154400>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,90.000000,0> translate<4.249700,0.000000,63.154400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.249700,0.000000,63.154400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.444600,0.000000,63.154400>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<4.249700,0.000000,63.154400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.444600,0.000000,63.154400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.444600,0.000000,62.959600>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,-90.000000,0> translate<4.444600,0.000000,62.959600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.444600,0.000000,62.959600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.249700,0.000000,62.959600>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<4.249700,0.000000,62.959600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.834400,0.000000,62.959600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.834400,0.000000,63.154400>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,90.000000,0> translate<4.834400,0.000000,63.154400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.834400,0.000000,63.154400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.029200,0.000000,63.154400>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,0.000000,0> translate<4.834400,0.000000,63.154400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.029200,0.000000,63.154400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.029200,0.000000,62.959600>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,-90.000000,0> translate<5.029200,0.000000,62.959600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.029200,0.000000,62.959600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.834400,0.000000,62.959600>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,0.000000,0> translate<4.834400,0.000000,62.959600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.218100,0.000000,33.058100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.218100,0.000000,33.998700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<43.218100,0.000000,33.998700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.218100,0.000000,33.998700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.688400,0.000000,33.998700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<43.218100,0.000000,33.998700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.688400,0.000000,33.998700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.845100,0.000000,33.841900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<43.688400,0.000000,33.998700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.845100,0.000000,33.841900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.845100,0.000000,33.528400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<43.845100,0.000000,33.528400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.845100,0.000000,33.528400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.688400,0.000000,33.371600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<43.688400,0.000000,33.371600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.688400,0.000000,33.371600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<43.218100,0.000000,33.371600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<43.218100,0.000000,33.371600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.623900,0.000000,33.998700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.310300,0.000000,33.998700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<44.310300,0.000000,33.998700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.310300,0.000000,33.998700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.153600,0.000000,33.841900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<44.153600,0.000000,33.841900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.153600,0.000000,33.841900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.153600,0.000000,33.214800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<44.153600,0.000000,33.214800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.153600,0.000000,33.214800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.310300,0.000000,33.058100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<44.153600,0.000000,33.214800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.310300,0.000000,33.058100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.623900,0.000000,33.058100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<44.310300,0.000000,33.058100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.623900,0.000000,33.058100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.780600,0.000000,33.214800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<44.623900,0.000000,33.058100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.780600,0.000000,33.214800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.780600,0.000000,33.841900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<44.780600,0.000000,33.841900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.780600,0.000000,33.841900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<44.623900,0.000000,33.998700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<44.623900,0.000000,33.998700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.089100,0.000000,33.058100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.089100,0.000000,33.998700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<45.089100,0.000000,33.998700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.089100,0.000000,33.998700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.559400,0.000000,33.998700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<45.089100,0.000000,33.998700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.559400,0.000000,33.998700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.716100,0.000000,33.841900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<45.559400,0.000000,33.998700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.716100,0.000000,33.841900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.716100,0.000000,33.528400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<45.716100,0.000000,33.528400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.716100,0.000000,33.528400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.559400,0.000000,33.371600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<45.559400,0.000000,33.371600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.559400,0.000000,33.371600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.089100,0.000000,33.371600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<45.089100,0.000000,33.371600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.402600,0.000000,33.371600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<45.716100,0.000000,33.058100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<45.402600,0.000000,33.371600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.338100,0.000000,33.058100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.338100,0.000000,33.998700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<46.338100,0.000000,33.998700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.024600,0.000000,33.998700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.651600,0.000000,33.998700>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<46.024600,0.000000,33.998700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.960100,0.000000,33.058100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.960100,0.000000,33.685100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<46.960100,0.000000,33.685100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.960100,0.000000,33.685100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.273600,0.000000,33.998700>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-45.006166,0> translate<46.960100,0.000000,33.685100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.273600,0.000000,33.998700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.587100,0.000000,33.685100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,45.006166,0> translate<47.273600,0.000000,33.998700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.587100,0.000000,33.685100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.587100,0.000000,33.058100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<47.587100,0.000000,33.058100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<46.960100,0.000000,33.528400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<47.587100,0.000000,33.528400>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<46.960100,0.000000,33.528400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.527900,0.000000,67.530600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,67.530600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<7.587300,0.000000,67.530600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,67.530600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,68.000900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<7.587300,0.000000,68.000900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,68.000900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.744100,0.000000,68.157600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<7.587300,0.000000,68.000900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.744100,0.000000,68.157600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.057600,0.000000,68.157600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<7.744100,0.000000,68.157600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.057600,0.000000,68.157600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.214400,0.000000,68.000900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<8.057600,0.000000,68.157600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.214400,0.000000,68.000900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.214400,0.000000,67.530600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.214400,0.000000,67.530600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,68.936400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,68.622800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<7.587300,0.000000,68.622800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,68.622800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.744100,0.000000,68.466100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<7.587300,0.000000,68.622800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.744100,0.000000,68.466100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.371200,0.000000,68.466100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<7.744100,0.000000,68.466100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.371200,0.000000,68.466100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.527900,0.000000,68.622800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<8.371200,0.000000,68.466100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.527900,0.000000,68.622800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.527900,0.000000,68.936400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<8.527900,0.000000,68.936400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.527900,0.000000,68.936400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.371200,0.000000,69.093100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<8.371200,0.000000,69.093100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.371200,0.000000,69.093100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.744100,0.000000,69.093100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<7.744100,0.000000,69.093100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.744100,0.000000,69.093100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,68.936400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<7.587300,0.000000,68.936400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.527900,0.000000,69.401600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,69.401600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<7.587300,0.000000,69.401600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,69.401600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,69.871900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<7.587300,0.000000,69.871900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,69.871900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.744100,0.000000,70.028600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<7.587300,0.000000,69.871900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.744100,0.000000,70.028600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.057600,0.000000,70.028600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<7.744100,0.000000,70.028600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.057600,0.000000,70.028600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.214400,0.000000,69.871900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<8.057600,0.000000,70.028600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.214400,0.000000,69.871900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.214400,0.000000,69.401600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.214400,0.000000,69.401600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.214400,0.000000,69.715100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.527900,0.000000,70.028600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<8.214400,0.000000,69.715100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.527900,0.000000,70.650600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,70.650600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<7.587300,0.000000,70.650600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,70.337100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,70.964100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<7.587300,0.000000,70.964100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.527900,0.000000,71.272600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,71.272600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<7.587300,0.000000,71.272600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,71.272600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,71.742900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<7.587300,0.000000,71.742900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.587300,0.000000,71.742900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.744100,0.000000,71.899600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<7.587300,0.000000,71.742900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.744100,0.000000,71.899600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.900900,0.000000,71.899600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<7.744100,0.000000,71.899600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<7.900900,0.000000,71.899600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.057600,0.000000,71.742900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<7.900900,0.000000,71.899600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.057600,0.000000,71.742900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.214400,0.000000,71.899600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<8.057600,0.000000,71.742900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.214400,0.000000,71.899600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.371200,0.000000,71.899600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<8.214400,0.000000,71.899600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.371200,0.000000,71.899600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.527900,0.000000,71.742900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<8.371200,0.000000,71.899600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.527900,0.000000,71.742900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.527900,0.000000,71.272600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.527900,0.000000,71.272600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.057600,0.000000,71.272600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.057600,0.000000,71.742900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<8.057600,0.000000,71.742900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.527900,0.000000,68.035600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,68.035600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<41.587300,0.000000,68.035600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,68.035600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,68.505900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<41.587300,0.000000,68.505900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,68.505900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.744100,0.000000,68.662600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<41.587300,0.000000,68.505900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.744100,0.000000,68.662600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.057600,0.000000,68.662600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<41.744100,0.000000,68.662600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.057600,0.000000,68.662600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.214400,0.000000,68.505900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<42.057600,0.000000,68.662600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.214400,0.000000,68.505900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.214400,0.000000,68.035600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.214400,0.000000,68.035600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,69.441400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,69.127800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.587300,0.000000,69.127800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,69.127800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.744100,0.000000,68.971100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<41.587300,0.000000,69.127800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.744100,0.000000,68.971100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.371200,0.000000,68.971100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<41.744100,0.000000,68.971100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.371200,0.000000,68.971100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.527900,0.000000,69.127800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.371200,0.000000,68.971100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.527900,0.000000,69.127800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.527900,0.000000,69.441400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<42.527900,0.000000,69.441400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.527900,0.000000,69.441400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.371200,0.000000,69.598100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<42.371200,0.000000,69.598100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.371200,0.000000,69.598100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.744100,0.000000,69.598100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<41.744100,0.000000,69.598100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.744100,0.000000,69.598100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,69.441400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<41.587300,0.000000,69.441400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.527900,0.000000,69.906600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,69.906600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<41.587300,0.000000,69.906600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,69.906600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,70.376900>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<41.587300,0.000000,70.376900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,70.376900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.744100,0.000000,70.533600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<41.587300,0.000000,70.376900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.744100,0.000000,70.533600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.057600,0.000000,70.533600>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<41.744100,0.000000,70.533600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.057600,0.000000,70.533600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.214400,0.000000,70.376900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<42.057600,0.000000,70.533600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.214400,0.000000,70.376900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.214400,0.000000,69.906600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<42.214400,0.000000,69.906600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.214400,0.000000,70.220100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.527900,0.000000,70.533600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.214400,0.000000,70.220100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.527900,0.000000,71.155600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,71.155600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<41.587300,0.000000,71.155600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,70.842100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,71.469100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<41.587300,0.000000,71.469100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.744100,0.000000,72.404600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,72.247900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<41.587300,0.000000,72.247900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,72.247900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,71.934300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<41.587300,0.000000,71.934300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.587300,0.000000,71.934300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.744100,0.000000,71.777600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<41.587300,0.000000,71.934300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<41.744100,0.000000,71.777600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.371200,0.000000,71.777600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<41.744100,0.000000,71.777600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.371200,0.000000,71.777600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.527900,0.000000,71.934300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<42.371200,0.000000,71.777600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.527900,0.000000,71.934300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.527900,0.000000,72.247900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<42.527900,0.000000,72.247900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.527900,0.000000,72.247900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<42.371200,0.000000,72.404600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<42.371200,0.000000,72.404600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.376100,0.000000,54.902100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.376100,0.000000,55.842700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<1.376100,0.000000,55.842700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.376100,0.000000,55.842700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.846400,0.000000,55.842700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<1.376100,0.000000,55.842700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.846400,0.000000,55.842700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.003100,0.000000,55.685900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<1.846400,0.000000,55.842700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.003100,0.000000,55.685900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.003100,0.000000,55.372400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.003100,0.000000,55.372400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.003100,0.000000,55.372400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.846400,0.000000,55.215600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<1.846400,0.000000,55.215600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.846400,0.000000,55.215600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<1.376100,0.000000,55.215600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<1.376100,0.000000,55.215600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.311600,0.000000,54.902100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.311600,0.000000,55.842700>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,90.000000,0> translate<2.311600,0.000000,55.842700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.311600,0.000000,55.842700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.781900,0.000000,55.842700>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<2.311600,0.000000,55.842700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.781900,0.000000,55.842700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.938600,0.000000,55.685900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<2.781900,0.000000,55.842700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.938600,0.000000,55.685900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.938600,0.000000,55.372400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<2.938600,0.000000,55.372400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.938600,0.000000,55.372400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.781900,0.000000,55.215600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<2.781900,0.000000,55.215600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.781900,0.000000,55.215600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.311600,0.000000,55.215600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<2.311600,0.000000,55.215600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.625100,0.000000,55.215600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<2.938600,0.000000,54.902100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<2.625100,0.000000,55.215600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.717400,0.000000,55.842700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.403800,0.000000,55.842700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<3.403800,0.000000,55.842700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.403800,0.000000,55.842700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.247100,0.000000,55.685900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<3.247100,0.000000,55.685900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.247100,0.000000,55.685900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.247100,0.000000,55.058800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<3.247100,0.000000,55.058800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.247100,0.000000,55.058800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.403800,0.000000,54.902100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<3.247100,0.000000,55.058800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.403800,0.000000,54.902100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.717400,0.000000,54.902100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<3.403800,0.000000,54.902100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.717400,0.000000,54.902100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.874100,0.000000,55.058800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<3.717400,0.000000,54.902100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.874100,0.000000,55.058800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.874100,0.000000,55.685900>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,90.000000,0> translate<3.874100,0.000000,55.685900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.874100,0.000000,55.685900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<3.717400,0.000000,55.842700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<3.717400,0.000000,55.842700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.809600,0.000000,55.685900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.652900,0.000000,55.842700>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,45.015305,0> translate<4.652900,0.000000,55.842700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.652900,0.000000,55.842700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.339300,0.000000,55.842700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<4.339300,0.000000,55.842700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.339300,0.000000,55.842700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.182600,0.000000,55.685900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-45.015305,0> translate<4.182600,0.000000,55.685900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.182600,0.000000,55.685900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.182600,0.000000,55.058800>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,-90.000000,0> translate<4.182600,0.000000,55.058800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.182600,0.000000,55.058800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.339300,0.000000,54.902100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<4.182600,0.000000,55.058800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.339300,0.000000,54.902100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.652900,0.000000,54.902100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<4.339300,0.000000,54.902100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.652900,0.000000,54.902100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.809600,0.000000,55.058800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<4.652900,0.000000,54.902100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.809600,0.000000,55.058800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.809600,0.000000,55.372400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<4.809600,0.000000,55.372400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.809600,0.000000,55.372400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<4.496100,0.000000,55.372400>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<4.496100,0.000000,55.372400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.010300,-1.536000,48.175900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.179800,-1.536000,48.006400>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,44.997030,0> translate<35.010300,-1.536000,48.175900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.179800,-1.536000,48.006400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.179800,-1.536000,47.667400>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,-90.000000,0> translate<35.179800,-1.536000,47.667400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.179800,-1.536000,47.667400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.010300,-1.536000,47.498000>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-44.980125,0> translate<35.010300,-1.536000,47.498000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.010300,-1.536000,47.498000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.332400,-1.536000,47.498000>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,0.000000,0> translate<34.332400,-1.536000,47.498000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.332400,-1.536000,47.498000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.163000,-1.536000,47.667400>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,44.997030,0> translate<34.163000,-1.536000,47.667400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.163000,-1.536000,47.667400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.163000,-1.536000,48.006400>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,90.000000,0> translate<34.163000,-1.536000,48.006400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.163000,-1.536000,48.006400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.332400,-1.536000,48.175900>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-45.013935,0> translate<34.163000,-1.536000,48.006400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.163000,-1.536000,49.175700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.179800,-1.536000,49.175700>}
box{<0,0,-0.127000><1.016800,0.036000,0.127000> rotate<0,0.000000,0> translate<34.163000,-1.536000,49.175700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.179800,-1.536000,49.175700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.671400,-1.536000,48.667300>}
box{<0,0,-0.127000><0.718986,0.036000,0.127000> rotate<0,-44.997030,0> translate<34.671400,-1.536000,48.667300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.671400,-1.536000,48.667300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.671400,-1.536000,49.345200>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,90.000000,0> translate<34.671400,-1.536000,49.345200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,47.498000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,47.836900>}
box{<0,0,-0.127000><0.479277,0.036000,0.127000> rotate<0,-44.997030,0> translate<31.538900,-1.536000,47.498000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,47.836900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,47.836900>}
box{<0,0,-0.127000><1.016800,0.036000,0.127000> rotate<0,0.000000,0> translate<30.861000,-1.536000,47.836900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,47.498000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,48.175900>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,90.000000,0> translate<30.861000,-1.536000,48.175900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,48.667300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,48.667300>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,0.000000,0> translate<31.030400,-1.536000,48.667300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,48.667300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,48.836700>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-44.980125,0> translate<31.708300,-1.536000,48.667300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,48.836700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,49.175700>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,90.000000,0> translate<31.877800,-1.536000,49.175700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,49.175700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,49.345200>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,44.997030,0> translate<31.708300,-1.536000,49.345200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,49.345200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,49.345200>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,0.000000,0> translate<31.030400,-1.536000,49.345200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,49.345200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,49.175700>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-45.013935,0> translate<30.861000,-1.536000,49.175700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,49.175700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,48.836700>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,-90.000000,0> translate<30.861000,-1.536000,48.836700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,48.836700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,48.667300>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,44.997030,0> translate<30.861000,-1.536000,48.836700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,48.667300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,49.345200>}
box{<0,0,-0.127000><0.958695,0.036000,0.127000> rotate<0,-44.997030,0> translate<31.030400,-1.536000,48.667300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,49.836600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,49.836600>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,0.000000,0> translate<31.030400,-1.536000,49.836600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,49.836600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,50.006000>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-44.980125,0> translate<31.708300,-1.536000,49.836600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,50.006000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,50.345000>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,90.000000,0> translate<31.877800,-1.536000,50.345000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,50.345000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,50.514500>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,44.997030,0> translate<31.708300,-1.536000,50.514500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,50.514500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,50.514500>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,0.000000,0> translate<31.030400,-1.536000,50.514500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,50.514500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,50.345000>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-45.013935,0> translate<30.861000,-1.536000,50.345000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,50.345000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,50.006000>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,-90.000000,0> translate<30.861000,-1.536000,50.006000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,50.006000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,49.836600>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,44.997030,0> translate<30.861000,-1.536000,50.006000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,49.836600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,50.514500>}
box{<0,0,-0.127000><0.958695,0.036000,0.127000> rotate<0,-44.997030,0> translate<31.030400,-1.536000,49.836600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,51.005900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,51.005900>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,0.000000,0> translate<30.861000,-1.536000,51.005900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,51.005900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,51.514300>}
box{<0,0,-0.127000><0.508400,0.036000,0.127000> rotate<0,90.000000,0> translate<31.538900,-1.536000,51.514300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,51.514300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,51.683800>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,44.997030,0> translate<31.369400,-1.536000,51.683800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,51.683800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,51.683800>}
box{<0,0,-0.127000><0.508400,0.036000,0.127000> rotate<0,0.000000,0> translate<30.861000,-1.536000,51.683800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,52.175200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,52.175200>}
box{<0,0,-0.127000><1.016800,0.036000,0.127000> rotate<0,0.000000,0> translate<30.861000,-1.536000,52.175200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,52.175200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,52.853100>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,90.000000,0> translate<31.877800,-1.536000,52.853100> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,52.175200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,52.514100>}
box{<0,0,-0.127000><0.338900,0.036000,0.127000> rotate<0,90.000000,0> translate<31.369400,-1.536000,52.514100> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,53.344500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,54.022400>}
box{<0,0,-0.127000><1.222060,0.036000,0.127000> rotate<0,-33.689144,0> translate<30.861000,-1.536000,53.344500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,54.513800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,54.683200>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,44.997030,0> translate<30.861000,-1.536000,54.683200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,54.683200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,55.022200>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,90.000000,0> translate<30.861000,-1.536000,55.022200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,55.022200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,55.191700>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-45.013935,0> translate<30.861000,-1.536000,55.022200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,55.191700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,55.191700>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,0.000000,0> translate<31.030400,-1.536000,55.191700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,55.191700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,55.022200>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,44.997030,0> translate<31.708300,-1.536000,55.191700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,55.022200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,54.683200>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,-90.000000,0> translate<31.877800,-1.536000,54.683200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,54.683200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,54.513800>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-44.980125,0> translate<31.708300,-1.536000,54.513800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,54.513800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,54.513800>}
box{<0,0,-0.127000><0.169400,0.036000,0.127000> rotate<0,0.000000,0> translate<31.538900,-1.536000,54.513800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,54.513800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,54.683200>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,44.980125,0> translate<31.369400,-1.536000,54.683200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,54.683200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,55.191700>}
box{<0,0,-0.127000><0.508500,0.036000,0.127000> rotate<0,90.000000,0> translate<31.369400,-1.536000,55.191700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,55.683100>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,56.361000>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,90.000000,0> translate<31.877800,-1.536000,56.361000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,56.361000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,56.361000>}
box{<0,0,-0.127000><0.169500,0.036000,0.127000> rotate<0,0.000000,0> translate<31.708300,-1.536000,56.361000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,56.361000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,55.683100>}
box{<0,0,-0.127000><0.958695,0.036000,0.127000> rotate<0,-44.997030,0> translate<31.030400,-1.536000,55.683100> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,55.683100>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,55.683100>}
box{<0,0,-0.127000><0.169400,0.036000,0.127000> rotate<0,0.000000,0> translate<30.861000,-1.536000,55.683100> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,57.530300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,56.852400>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,-90.000000,0> translate<31.877800,-1.536000,56.852400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,56.852400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,56.852400>}
box{<0,0,-0.127000><0.508400,0.036000,0.127000> rotate<0,0.000000,0> translate<31.369400,-1.536000,56.852400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,56.852400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,57.191300>}
box{<0,0,-0.127000><0.378924,0.036000,0.127000> rotate<0,-63.424001,0> translate<31.369400,-1.536000,56.852400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,57.191300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,57.360800>}
box{<0,0,-0.127000><0.169500,0.036000,0.127000> rotate<0,90.000000,0> translate<31.538900,-1.536000,57.360800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,57.360800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,57.530300>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,44.997030,0> translate<31.369400,-1.536000,57.530300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,57.530300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,57.530300>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,0.000000,0> translate<31.030400,-1.536000,57.530300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,57.530300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,57.360800>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-45.013935,0> translate<30.861000,-1.536000,57.360800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,57.360800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,57.021800>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,-90.000000,0> translate<30.861000,-1.536000,57.021800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,57.021800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,56.852400>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,44.997030,0> translate<30.861000,-1.536000,57.021800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,58.021700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,58.191100>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-44.980125,0> translate<31.708300,-1.536000,58.021700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,58.191100>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,58.530100>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,90.000000,0> translate<31.877800,-1.536000,58.530100> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,58.530100>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,58.699600>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,44.997030,0> translate<31.708300,-1.536000,58.699600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,58.699600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,58.699600>}
box{<0,0,-0.127000><0.169400,0.036000,0.127000> rotate<0,0.000000,0> translate<31.538900,-1.536000,58.699600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,58.699600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,58.530100>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,-44.997030,0> translate<31.369400,-1.536000,58.530100> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,58.530100>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,58.360600>}
box{<0,0,-0.127000><0.169500,0.036000,0.127000> rotate<0,-90.000000,0> translate<31.369400,-1.536000,58.360600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,58.530100>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.199900,-1.536000,58.699600>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,44.997030,0> translate<31.199900,-1.536000,58.699600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.199900,-1.536000,58.699600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,58.699600>}
box{<0,0,-0.127000><0.169500,0.036000,0.127000> rotate<0,0.000000,0> translate<31.030400,-1.536000,58.699600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,58.699600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,58.530100>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-45.013935,0> translate<30.861000,-1.536000,58.530100> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,58.530100>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,58.191100>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,-90.000000,0> translate<30.861000,-1.536000,58.191100> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,58.191100>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,58.021700>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,44.997030,0> translate<30.861000,-1.536000,58.191100> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,59.868900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,59.191000>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,-90.000000,0> translate<31.877800,-1.536000,59.191000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,59.191000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,59.191000>}
box{<0,0,-0.127000><0.508400,0.036000,0.127000> rotate<0,0.000000,0> translate<31.369400,-1.536000,59.191000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,59.191000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,59.529900>}
box{<0,0,-0.127000><0.378924,0.036000,0.127000> rotate<0,-63.424001,0> translate<31.369400,-1.536000,59.191000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,59.529900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,59.699400>}
box{<0,0,-0.127000><0.169500,0.036000,0.127000> rotate<0,90.000000,0> translate<31.538900,-1.536000,59.699400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,59.699400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,59.868900>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,44.997030,0> translate<31.369400,-1.536000,59.868900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,59.868900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,59.868900>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,0.000000,0> translate<31.030400,-1.536000,59.868900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,59.868900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,59.699400>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-45.013935,0> translate<30.861000,-1.536000,59.699400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,59.699400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,59.360400>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,-90.000000,0> translate<30.861000,-1.536000,59.360400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,59.360400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,59.191000>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,44.997030,0> translate<30.861000,-1.536000,59.360400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,60.360300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,60.529700>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,44.997030,0> translate<30.861000,-1.536000,60.529700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,60.529700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,60.868700>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,90.000000,0> translate<30.861000,-1.536000,60.868700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,60.868700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,61.038200>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-45.013935,0> translate<30.861000,-1.536000,60.868700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.030400,-1.536000,61.038200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,61.038200>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,0.000000,0> translate<31.030400,-1.536000,61.038200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,61.038200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,60.868700>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,44.997030,0> translate<31.708300,-1.536000,61.038200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,60.868700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,60.529700>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,-90.000000,0> translate<31.877800,-1.536000,60.529700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,60.529700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,60.360300>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-44.980125,0> translate<31.708300,-1.536000,60.360300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.708300,-1.536000,60.360300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,60.360300>}
box{<0,0,-0.127000><0.169400,0.036000,0.127000> rotate<0,0.000000,0> translate<31.538900,-1.536000,60.360300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,60.360300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,60.529700>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,44.980125,0> translate<31.369400,-1.536000,60.529700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,60.529700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.369400,-1.536000,61.038200>}
box{<0,0,-0.127000><0.508500,0.036000,0.127000> rotate<0,90.000000,0> translate<31.369400,-1.536000,61.038200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.538900,-1.536000,61.529600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,61.868500>}
box{<0,0,-0.127000><0.479277,0.036000,0.127000> rotate<0,-44.997030,0> translate<31.538900,-1.536000,61.529600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<31.877800,-1.536000,61.868500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,61.868500>}
box{<0,0,-0.127000><1.016800,0.036000,0.127000> rotate<0,0.000000,0> translate<30.861000,-1.536000,61.868500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,61.529600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<30.861000,-1.536000,62.207500>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,90.000000,0> translate<30.861000,-1.536000,62.207500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.944100,-1.536000,9.610300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.113600,-1.536000,9.779800>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,-44.997030,0> translate<22.944100,-1.536000,9.610300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.113600,-1.536000,9.779800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.452600,-1.536000,9.779800>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,0.000000,0> translate<23.113600,-1.536000,9.779800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.452600,-1.536000,9.779800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.622000,-1.536000,9.610300>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,45.013935,0> translate<23.452600,-1.536000,9.779800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.622000,-1.536000,9.610300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.622000,-1.536000,8.932400>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,-90.000000,0> translate<23.622000,-1.536000,8.932400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.622000,-1.536000,8.932400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.452600,-1.536000,8.763000>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,-44.997030,0> translate<23.452600,-1.536000,8.763000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.452600,-1.536000,8.763000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.113600,-1.536000,8.763000>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,0.000000,0> translate<23.113600,-1.536000,8.763000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.113600,-1.536000,8.763000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.944100,-1.536000,8.932400>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,44.980125,0> translate<22.944100,-1.536000,8.932400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.774800,-1.536000,9.779800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.452700,-1.536000,9.779800>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,0.000000,0> translate<21.774800,-1.536000,9.779800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.452700,-1.536000,9.779800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.452700,-1.536000,9.271400>}
box{<0,0,-0.127000><0.508400,0.036000,0.127000> rotate<0,-90.000000,0> translate<22.452700,-1.536000,9.271400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.452700,-1.536000,9.271400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.113800,-1.536000,9.440900>}
box{<0,0,-0.127000><0.378924,0.036000,0.127000> rotate<0,26.570060,0> translate<22.113800,-1.536000,9.440900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.113800,-1.536000,9.440900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.944300,-1.536000,9.440900>}
box{<0,0,-0.127000><0.169500,0.036000,0.127000> rotate<0,0.000000,0> translate<21.944300,-1.536000,9.440900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.944300,-1.536000,9.440900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.774800,-1.536000,9.271400>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,-44.997030,0> translate<21.774800,-1.536000,9.271400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.774800,-1.536000,9.271400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.774800,-1.536000,8.932400>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,-90.000000,0> translate<21.774800,-1.536000,8.932400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.774800,-1.536000,8.932400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.944300,-1.536000,8.763000>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,44.980125,0> translate<21.774800,-1.536000,8.932400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.944300,-1.536000,8.763000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.283300,-1.536000,8.763000>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,0.000000,0> translate<21.944300,-1.536000,8.763000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.283300,-1.536000,8.763000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.452700,-1.536000,8.932400>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,-44.997030,0> translate<22.283300,-1.536000,8.763000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.622000,-1.536000,6.138900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.283100,-1.536000,6.477800>}
box{<0,0,-0.127000><0.479277,0.036000,0.127000> rotate<0,44.997030,0> translate<23.283100,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.283100,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.283100,-1.536000,5.461000>}
box{<0,0,-0.127000><1.016800,0.036000,0.127000> rotate<0,-90.000000,0> translate<23.283100,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<23.622000,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.944100,-1.536000,5.461000>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,0.000000,0> translate<22.944100,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.452700,-1.536000,5.630400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.452700,-1.536000,6.308300>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,90.000000,0> translate<22.452700,-1.536000,6.308300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.452700,-1.536000,6.308300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.283300,-1.536000,6.477800>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,45.013935,0> translate<22.283300,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.283300,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.944300,-1.536000,6.477800>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,0.000000,0> translate<21.944300,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.944300,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.774800,-1.536000,6.308300>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,-44.997030,0> translate<21.774800,-1.536000,6.308300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.774800,-1.536000,6.308300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.774800,-1.536000,5.630400>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,-90.000000,0> translate<21.774800,-1.536000,5.630400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.774800,-1.536000,5.630400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.944300,-1.536000,5.461000>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,44.980125,0> translate<21.774800,-1.536000,5.630400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.944300,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.283300,-1.536000,5.461000>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,0.000000,0> translate<21.944300,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.283300,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.452700,-1.536000,5.630400>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,-44.997030,0> translate<22.283300,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<22.452700,-1.536000,5.630400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.774800,-1.536000,6.308300>}
box{<0,0,-0.127000><0.958695,0.036000,0.127000> rotate<0,44.997030,0> translate<21.774800,-1.536000,6.308300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.283400,-1.536000,5.630400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.283400,-1.536000,6.308300>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,90.000000,0> translate<21.283400,-1.536000,6.308300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.283400,-1.536000,6.308300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.114000,-1.536000,6.477800>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,45.013935,0> translate<21.114000,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.114000,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.775000,-1.536000,6.477800>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,0.000000,0> translate<20.775000,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.775000,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.605500,-1.536000,6.308300>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,-44.997030,0> translate<20.605500,-1.536000,6.308300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.605500,-1.536000,6.308300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.605500,-1.536000,5.630400>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,-90.000000,0> translate<20.605500,-1.536000,5.630400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.605500,-1.536000,5.630400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.775000,-1.536000,5.461000>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,44.980125,0> translate<20.605500,-1.536000,5.630400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.775000,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.114000,-1.536000,5.461000>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,0.000000,0> translate<20.775000,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.114000,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.283400,-1.536000,5.630400>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,-44.997030,0> translate<21.114000,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<21.283400,-1.536000,5.630400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.605500,-1.536000,6.308300>}
box{<0,0,-0.127000><0.958695,0.036000,0.127000> rotate<0,44.997030,0> translate<20.605500,-1.536000,6.308300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.114100,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.114100,-1.536000,6.138900>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,90.000000,0> translate<20.114100,-1.536000,6.138900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<20.114100,-1.536000,6.138900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.605700,-1.536000,6.138900>}
box{<0,0,-0.127000><0.508400,0.036000,0.127000> rotate<0,0.000000,0> translate<19.605700,-1.536000,6.138900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.605700,-1.536000,6.138900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.436200,-1.536000,5.969400>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,-44.997030,0> translate<19.436200,-1.536000,5.969400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.436200,-1.536000,5.969400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<19.436200,-1.536000,5.461000>}
box{<0,0,-0.127000><0.508400,0.036000,0.127000> rotate<0,-90.000000,0> translate<19.436200,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.944800,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.944800,-1.536000,6.477800>}
box{<0,0,-0.127000><1.016800,0.036000,0.127000> rotate<0,90.000000,0> translate<18.944800,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.944800,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.266900,-1.536000,6.477800>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,0.000000,0> translate<18.266900,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.944800,-1.536000,5.969400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.605900,-1.536000,5.969400>}
box{<0,0,-0.127000><0.338900,0.036000,0.127000> rotate<0,0.000000,0> translate<18.605900,-1.536000,5.969400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.775500,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.097600,-1.536000,6.477800>}
box{<0,0,-0.127000><1.222060,0.036000,0.127000> rotate<0,56.304916,0> translate<17.097600,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.606200,-1.536000,5.630400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.436800,-1.536000,5.461000>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,-44.997030,0> translate<16.436800,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.436800,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.097800,-1.536000,5.461000>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,0.000000,0> translate<16.097800,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.097800,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.928300,-1.536000,5.630400>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,44.980125,0> translate<15.928300,-1.536000,5.630400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.928300,-1.536000,5.630400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.928300,-1.536000,6.308300>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,90.000000,0> translate<15.928300,-1.536000,6.308300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.928300,-1.536000,6.308300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.097800,-1.536000,6.477800>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,-44.997030,0> translate<15.928300,-1.536000,6.308300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.097800,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.436800,-1.536000,6.477800>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,0.000000,0> translate<16.097800,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.436800,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.606200,-1.536000,6.308300>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,45.013935,0> translate<16.436800,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.606200,-1.536000,6.308300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.606200,-1.536000,6.138900>}
box{<0,0,-0.127000><0.169400,0.036000,0.127000> rotate<0,-90.000000,0> translate<16.606200,-1.536000,6.138900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.606200,-1.536000,6.138900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.436800,-1.536000,5.969400>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-45.013935,0> translate<16.436800,-1.536000,5.969400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.436800,-1.536000,5.969400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.928300,-1.536000,5.969400>}
box{<0,0,-0.127000><0.508500,0.036000,0.127000> rotate<0,0.000000,0> translate<15.928300,-1.536000,5.969400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.436900,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.759000,-1.536000,6.477800>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,0.000000,0> translate<14.759000,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.759000,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.759000,-1.536000,6.308300>}
box{<0,0,-0.127000><0.169500,0.036000,0.127000> rotate<0,-90.000000,0> translate<14.759000,-1.536000,6.308300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.759000,-1.536000,6.308300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.436900,-1.536000,5.630400>}
box{<0,0,-0.127000><0.958695,0.036000,0.127000> rotate<0,44.997030,0> translate<14.759000,-1.536000,6.308300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.436900,-1.536000,5.630400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.436900,-1.536000,5.461000>}
box{<0,0,-0.127000><0.169400,0.036000,0.127000> rotate<0,-90.000000,0> translate<15.436900,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.589700,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.267600,-1.536000,6.477800>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,0.000000,0> translate<13.589700,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.267600,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.267600,-1.536000,5.969400>}
box{<0,0,-0.127000><0.508400,0.036000,0.127000> rotate<0,-90.000000,0> translate<14.267600,-1.536000,5.969400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.267600,-1.536000,5.969400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.928700,-1.536000,6.138900>}
box{<0,0,-0.127000><0.378924,0.036000,0.127000> rotate<0,26.570060,0> translate<13.928700,-1.536000,6.138900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.928700,-1.536000,6.138900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.759200,-1.536000,6.138900>}
box{<0,0,-0.127000><0.169500,0.036000,0.127000> rotate<0,0.000000,0> translate<13.759200,-1.536000,6.138900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.759200,-1.536000,6.138900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.589700,-1.536000,5.969400>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,-44.997030,0> translate<13.589700,-1.536000,5.969400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.589700,-1.536000,5.969400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.589700,-1.536000,5.630400>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,-90.000000,0> translate<13.589700,-1.536000,5.630400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.589700,-1.536000,5.630400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.759200,-1.536000,5.461000>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,44.980125,0> translate<13.589700,-1.536000,5.630400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.759200,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.098200,-1.536000,5.461000>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,0.000000,0> translate<13.759200,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.098200,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<14.267600,-1.536000,5.630400>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,-44.997030,0> translate<14.098200,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.098300,-1.536000,6.308300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.928900,-1.536000,6.477800>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,45.013935,0> translate<12.928900,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.928900,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.589900,-1.536000,6.477800>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,0.000000,0> translate<12.589900,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.589900,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.420400,-1.536000,6.308300>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,-44.997030,0> translate<12.420400,-1.536000,6.308300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.420400,-1.536000,6.308300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.420400,-1.536000,6.138900>}
box{<0,0,-0.127000><0.169400,0.036000,0.127000> rotate<0,-90.000000,0> translate<12.420400,-1.536000,6.138900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.420400,-1.536000,6.138900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.589900,-1.536000,5.969400>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,44.997030,0> translate<12.420400,-1.536000,6.138900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.589900,-1.536000,5.969400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.759400,-1.536000,5.969400>}
box{<0,0,-0.127000><0.169500,0.036000,0.127000> rotate<0,0.000000,0> translate<12.589900,-1.536000,5.969400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.589900,-1.536000,5.969400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.420400,-1.536000,5.799900>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,-44.997030,0> translate<12.420400,-1.536000,5.799900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.420400,-1.536000,5.799900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.420400,-1.536000,5.630400>}
box{<0,0,-0.127000><0.169500,0.036000,0.127000> rotate<0,-90.000000,0> translate<12.420400,-1.536000,5.630400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.420400,-1.536000,5.630400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.589900,-1.536000,5.461000>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,44.980125,0> translate<12.420400,-1.536000,5.630400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.589900,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.928900,-1.536000,5.461000>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,0.000000,0> translate<12.589900,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.928900,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.098300,-1.536000,5.630400>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,-44.997030,0> translate<12.928900,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.251100,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.929000,-1.536000,6.477800>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,0.000000,0> translate<11.251100,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.929000,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.929000,-1.536000,5.969400>}
box{<0,0,-0.127000><0.508400,0.036000,0.127000> rotate<0,-90.000000,0> translate<11.929000,-1.536000,5.969400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.929000,-1.536000,5.969400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.590100,-1.536000,6.138900>}
box{<0,0,-0.127000><0.378924,0.036000,0.127000> rotate<0,26.570060,0> translate<11.590100,-1.536000,6.138900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.590100,-1.536000,6.138900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.420600,-1.536000,6.138900>}
box{<0,0,-0.127000><0.169500,0.036000,0.127000> rotate<0,0.000000,0> translate<11.420600,-1.536000,6.138900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.420600,-1.536000,6.138900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.251100,-1.536000,5.969400>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,-44.997030,0> translate<11.251100,-1.536000,5.969400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.251100,-1.536000,5.969400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.251100,-1.536000,5.630400>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,-90.000000,0> translate<11.251100,-1.536000,5.630400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.251100,-1.536000,5.630400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.420600,-1.536000,5.461000>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,44.980125,0> translate<11.251100,-1.536000,5.630400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.420600,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.759600,-1.536000,5.461000>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,0.000000,0> translate<11.420600,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.759600,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.929000,-1.536000,5.630400>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,-44.997030,0> translate<11.759600,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.759700,-1.536000,5.630400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.590300,-1.536000,5.461000>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,-44.997030,0> translate<10.590300,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.590300,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.251300,-1.536000,5.461000>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,0.000000,0> translate<10.251300,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.251300,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.081800,-1.536000,5.630400>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,44.980125,0> translate<10.081800,-1.536000,5.630400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.081800,-1.536000,5.630400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.081800,-1.536000,6.308300>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,90.000000,0> translate<10.081800,-1.536000,6.308300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.081800,-1.536000,6.308300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.251300,-1.536000,6.477800>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,-44.997030,0> translate<10.081800,-1.536000,6.308300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.251300,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.590300,-1.536000,6.477800>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,0.000000,0> translate<10.251300,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.590300,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.759700,-1.536000,6.308300>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,45.013935,0> translate<10.590300,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.759700,-1.536000,6.308300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.759700,-1.536000,6.138900>}
box{<0,0,-0.127000><0.169400,0.036000,0.127000> rotate<0,-90.000000,0> translate<10.759700,-1.536000,6.138900> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.759700,-1.536000,6.138900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.590300,-1.536000,5.969400>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-45.013935,0> translate<10.590300,-1.536000,5.969400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.590300,-1.536000,5.969400>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.081800,-1.536000,5.969400>}
box{<0,0,-0.127000><0.508500,0.036000,0.127000> rotate<0,0.000000,0> translate<10.081800,-1.536000,5.969400> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<9.590400,-1.536000,6.138900>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<9.251500,-1.536000,6.477800>}
box{<0,0,-0.127000><0.479277,0.036000,0.127000> rotate<0,44.997030,0> translate<9.251500,-1.536000,6.477800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<9.251500,-1.536000,6.477800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<9.251500,-1.536000,5.461000>}
box{<0,0,-0.127000><1.016800,0.036000,0.127000> rotate<0,-90.000000,0> translate<9.251500,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<9.590400,-1.536000,5.461000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.912500,-1.536000,5.461000>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,0.000000,0> translate<8.912500,-1.536000,5.461000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.010100,0.000000,5.151600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.747400,0.000000,5.414200>}
box{<0,0,-0.101600><0.371443,0.036000,0.101600> rotate<0,44.986124,0> translate<29.747400,0.000000,5.414200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.747400,0.000000,5.414200>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.535400,0.000000,5.414200>}
box{<0,0,-0.101600><0.788000,0.036000,0.101600> rotate<0,0.000000,0> translate<29.747400,0.000000,5.414200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.535400,0.000000,5.151600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.535400,0.000000,5.676900>}
box{<0,0,-0.101600><0.525300,0.036000,0.101600> rotate<0,90.000000,0> translate<30.535400,0.000000,5.676900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.535400,0.000000,8.216900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.535400,0.000000,7.691600>}
box{<0,0,-0.101600><0.525300,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.535400,0.000000,7.691600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.535400,0.000000,7.691600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.010100,0.000000,8.216900>}
box{<0,0,-0.101600><0.742886,0.036000,0.101600> rotate<0,44.997030,0> translate<30.010100,0.000000,8.216900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.010100,0.000000,8.216900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.878700,0.000000,8.216900>}
box{<0,0,-0.101600><0.131400,0.036000,0.101600> rotate<0,0.000000,0> translate<29.878700,0.000000,8.216900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.878700,0.000000,8.216900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.747400,0.000000,8.085600>}
box{<0,0,-0.101600><0.185686,0.036000,0.101600> rotate<0,-44.997030,0> translate<29.747400,0.000000,8.085600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.747400,0.000000,8.085600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.747400,0.000000,7.822900>}
box{<0,0,-0.101600><0.262700,0.036000,0.101600> rotate<0,-90.000000,0> translate<29.747400,0.000000,7.822900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.747400,0.000000,7.822900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.878700,0.000000,7.691600>}
box{<0,0,-0.101600><0.185686,0.036000,0.101600> rotate<0,44.997030,0> translate<29.747400,0.000000,7.822900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.878700,0.000000,10.231600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.747400,0.000000,10.362900>}
box{<0,0,-0.101600><0.185686,0.036000,0.101600> rotate<0,44.997030,0> translate<29.747400,0.000000,10.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.747400,0.000000,10.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.747400,0.000000,10.625600>}
box{<0,0,-0.101600><0.262700,0.036000,0.101600> rotate<0,90.000000,0> translate<29.747400,0.000000,10.625600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.747400,0.000000,10.625600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.878700,0.000000,10.756900>}
box{<0,0,-0.101600><0.185686,0.036000,0.101600> rotate<0,-44.997030,0> translate<29.747400,0.000000,10.625600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<29.878700,0.000000,10.756900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.010100,0.000000,10.756900>}
box{<0,0,-0.101600><0.131400,0.036000,0.101600> rotate<0,0.000000,0> translate<29.878700,0.000000,10.756900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.010100,0.000000,10.756900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.141400,0.000000,10.625600>}
box{<0,0,-0.101600><0.185686,0.036000,0.101600> rotate<0,44.997030,0> translate<30.010100,0.000000,10.756900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.141400,0.000000,10.625600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.141400,0.000000,10.494200>}
box{<0,0,-0.101600><0.131400,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.141400,0.000000,10.494200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.141400,0.000000,10.625600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.272800,0.000000,10.756900>}
box{<0,0,-0.101600><0.185757,0.036000,0.101600> rotate<0,-44.975221,0> translate<30.141400,0.000000,10.625600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.272800,0.000000,10.756900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.404100,0.000000,10.756900>}
box{<0,0,-0.101600><0.131300,0.036000,0.101600> rotate<0,0.000000,0> translate<30.272800,0.000000,10.756900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.404100,0.000000,10.756900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.535400,0.000000,10.625600>}
box{<0,0,-0.101600><0.185686,0.036000,0.101600> rotate<0,44.997030,0> translate<30.404100,0.000000,10.756900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.535400,0.000000,10.625600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.535400,0.000000,10.362900>}
box{<0,0,-0.101600><0.262700,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.535400,0.000000,10.362900> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.535400,0.000000,10.362900>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.404100,0.000000,10.231600>}
box{<0,0,-0.101600><0.185686,0.036000,0.101600> rotate<0,-44.997030,0> translate<30.404100,0.000000,10.231600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.018000,-1.536000,8.837300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.034800,-1.536000,8.837300>}
box{<0,0,-0.127000><1.016800,0.036000,0.127000> rotate<0,0.000000,0> translate<17.018000,-1.536000,8.837300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.034800,-1.536000,8.837300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.034800,-1.536000,9.345700>}
box{<0,0,-0.127000><0.508400,0.036000,0.127000> rotate<0,90.000000,0> translate<18.034800,-1.536000,9.345700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.034800,-1.536000,9.345700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.865300,-1.536000,9.515200>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,44.997030,0> translate<17.865300,-1.536000,9.515200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.865300,-1.536000,9.515200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.526400,-1.536000,9.515200>}
box{<0,0,-0.127000><0.338900,0.036000,0.127000> rotate<0,0.000000,0> translate<17.526400,-1.536000,9.515200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.526400,-1.536000,9.515200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.356900,-1.536000,9.345700>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,-44.997030,0> translate<17.356900,-1.536000,9.345700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.356900,-1.536000,9.345700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.356900,-1.536000,8.837300>}
box{<0,0,-0.127000><0.508400,0.036000,0.127000> rotate<0,-90.000000,0> translate<17.356900,-1.536000,8.837300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.356900,-1.536000,9.176200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.018000,-1.536000,9.515200>}
box{<0,0,-0.127000><0.479348,0.036000,0.127000> rotate<0,45.005482,0> translate<17.018000,-1.536000,9.515200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.695900,-1.536000,10.006600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.034800,-1.536000,10.345500>}
box{<0,0,-0.127000><0.479277,0.036000,0.127000> rotate<0,-44.997030,0> translate<17.695900,-1.536000,10.006600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<18.034800,-1.536000,10.345500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.018000,-1.536000,10.345500>}
box{<0,0,-0.127000><1.016800,0.036000,0.127000> rotate<0,0.000000,0> translate<17.018000,-1.536000,10.345500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.018000,-1.536000,10.006600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<17.018000,-1.536000,10.684500>}
box{<0,0,-0.127000><0.677900,0.036000,0.127000> rotate<0,90.000000,0> translate<17.018000,-1.536000,10.684500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.258000,-1.536000,18.997300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.274800,-1.536000,18.997300>}
box{<0,0,-0.127000><1.016800,0.036000,0.127000> rotate<0,0.000000,0> translate<32.258000,-1.536000,18.997300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.274800,-1.536000,18.997300>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.274800,-1.536000,19.505700>}
box{<0,0,-0.127000><0.508400,0.036000,0.127000> rotate<0,90.000000,0> translate<33.274800,-1.536000,19.505700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.274800,-1.536000,19.505700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.105300,-1.536000,19.675200>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,44.997030,0> translate<33.105300,-1.536000,19.675200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.105300,-1.536000,19.675200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.766400,-1.536000,19.675200>}
box{<0,0,-0.127000><0.338900,0.036000,0.127000> rotate<0,0.000000,0> translate<32.766400,-1.536000,19.675200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.766400,-1.536000,19.675200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.596900,-1.536000,19.505700>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,-44.997030,0> translate<32.596900,-1.536000,19.505700> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.596900,-1.536000,19.505700>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.596900,-1.536000,18.997300>}
box{<0,0,-0.127000><0.508400,0.036000,0.127000> rotate<0,-90.000000,0> translate<32.596900,-1.536000,18.997300> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.596900,-1.536000,19.336200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.258000,-1.536000,19.675200>}
box{<0,0,-0.127000><0.479348,0.036000,0.127000> rotate<0,45.005482,0> translate<32.258000,-1.536000,19.675200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.105300,-1.536000,20.166600>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.274800,-1.536000,20.336000>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-44.980125,0> translate<33.105300,-1.536000,20.166600> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.274800,-1.536000,20.336000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.274800,-1.536000,20.675000>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,90.000000,0> translate<33.274800,-1.536000,20.675000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.274800,-1.536000,20.675000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.105300,-1.536000,20.844500>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,44.997030,0> translate<33.105300,-1.536000,20.844500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.105300,-1.536000,20.844500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.935900,-1.536000,20.844500>}
box{<0,0,-0.127000><0.169400,0.036000,0.127000> rotate<0,0.000000,0> translate<32.935900,-1.536000,20.844500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.935900,-1.536000,20.844500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.766400,-1.536000,20.675000>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,-44.997030,0> translate<32.766400,-1.536000,20.675000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.766400,-1.536000,20.675000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.766400,-1.536000,20.505500>}
box{<0,0,-0.127000><0.169500,0.036000,0.127000> rotate<0,-90.000000,0> translate<32.766400,-1.536000,20.505500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.766400,-1.536000,20.675000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.596900,-1.536000,20.844500>}
box{<0,0,-0.127000><0.239709,0.036000,0.127000> rotate<0,44.997030,0> translate<32.596900,-1.536000,20.844500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.596900,-1.536000,20.844500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.427400,-1.536000,20.844500>}
box{<0,0,-0.127000><0.169500,0.036000,0.127000> rotate<0,0.000000,0> translate<32.427400,-1.536000,20.844500> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.427400,-1.536000,20.844500>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.258000,-1.536000,20.675000>}
box{<0,0,-0.127000><0.239638,0.036000,0.127000> rotate<0,-45.013935,0> translate<32.258000,-1.536000,20.675000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.258000,-1.536000,20.675000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.258000,-1.536000,20.336000>}
box{<0,0,-0.127000><0.339000,0.036000,0.127000> rotate<0,-90.000000,0> translate<32.258000,-1.536000,20.336000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.258000,-1.536000,20.336000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<32.427400,-1.536000,20.166600>}
box{<0,0,-0.127000><0.239568,0.036000,0.127000> rotate<0,44.997030,0> translate<32.258000,-1.536000,20.336000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<6.350000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<2.540000,0.000000,59.690000>}
box{<0,0,-0.203200><3.810000,0.036000,0.203200> rotate<0,0.000000,0> translate<2.540000,0.000000,59.690000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<2.540000,0.000000,59.690000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<2.540000,0.000000,71.120000>}
box{<0,0,-0.203200><11.430000,0.036000,0.203200> rotate<0,90.000000,0> translate<2.540000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<2.540000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<6.350000,0.000000,71.120000>}
box{<0,0,-0.203200><3.810000,0.036000,0.203200> rotate<0,0.000000,0> translate<2.540000,0.000000,71.120000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<6.350000,0.000000,71.120000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<6.350000,0.000000,59.690000>}
box{<0,0,-0.203200><11.430000,0.036000,0.203200> rotate<0,-90.000000,0> translate<6.350000,0.000000,59.690000> }
box{<-1.905000,0,-3.810000><1.905000,0.036000,3.810000> rotate<0,-0.000000,0> translate<4.445000,0.000000,67.310000>}
//B1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.100000,0.000000,11.760000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.100000,0.000000,1.760000>}
box{<0,0,-0.063500><10.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<39.100000,0.000000,1.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.100000,0.000000,1.760000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.100000,0.000000,1.760000>}
box{<0,0,-0.063500><6.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<33.100000,0.000000,1.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.100000,0.000000,1.760000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.100000,0.000000,11.760000>}
box{<0,0,-0.063500><10.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<33.100000,0.000000,11.760000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.100000,0.000000,11.760000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<39.100000,0.000000,11.760000>}
box{<0,0,-0.063500><6.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<33.100000,0.000000,11.760000> }
difference{
cylinder{<36.195000,0,6.985000><36.195000,0.036000,6.985000>2.071500 translate<0,0.000000,0>}
cylinder{<36.195000,-0.1,6.985000><36.195000,0.135000,6.985000>1.944500 translate<0,0.000000,0>}}
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.165000,0.000000,5.235000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.765000,0.000000,5.235000>}
box{<0,0,-0.063500><1.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<21.165000,0.000000,5.235000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.765000,0.000000,5.235000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.765000,0.000000,4.235000>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<22.765000,0.000000,4.235000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.765000,0.000000,4.235000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.765000,0.000000,2.035000>}
box{<0,0,-0.063500><2.200000,0.036000,0.063500> rotate<0,-90.000000,0> translate<22.765000,0.000000,2.035000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.765000,0.000000,2.035000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.165000,0.000000,2.035000>}
box{<0,0,-0.063500><1.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<21.165000,0.000000,2.035000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.165000,0.000000,2.035000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.165000,0.000000,4.235000>}
box{<0,0,-0.063500><2.200000,0.036000,0.063500> rotate<0,90.000000,0> translate<21.165000,0.000000,4.235000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.165000,0.000000,4.235000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.165000,0.000000,5.235000>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<21.165000,0.000000,5.235000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.765000,0.000000,4.235000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.165000,0.000000,4.235000>}
box{<0,0,-0.063500><1.600000,0.036000,0.063500> rotate<0,0.000000,0> translate<21.165000,0.000000,4.235000> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.390000,0.000000,2.955000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.390000,0.000000,1.355000>}
box{<0,0,-0.063500><1.600000,0.036000,0.063500> rotate<0,-90.000000,0> translate<14.390000,0.000000,1.355000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.390000,0.000000,1.355000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.390000,0.000000,1.355000>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.390000,0.000000,1.355000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.390000,0.000000,1.355000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.190000,0.000000,1.355000>}
box{<0,0,-0.063500><2.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<11.190000,0.000000,1.355000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.190000,0.000000,1.355000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.190000,0.000000,2.955000>}
box{<0,0,-0.063500><1.600000,0.036000,0.063500> rotate<0,90.000000,0> translate<11.190000,0.000000,2.955000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.190000,0.000000,2.955000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.390000,0.000000,2.955000>}
box{<0,0,-0.063500><2.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<11.190000,0.000000,2.955000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.390000,0.000000,2.955000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.390000,0.000000,2.955000>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<13.390000,0.000000,2.955000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.390000,0.000000,1.355000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.390000,0.000000,2.955000>}
box{<0,0,-0.063500><1.600000,0.036000,0.063500> rotate<0,90.000000,0> translate<13.390000,0.000000,2.955000> }
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.601000,0.000000,18.820000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.839000,0.000000,18.820000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<15.839000,0.000000,18.820000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.576000,0.000000,20.140000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.839000,0.000000,20.140000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<15.839000,0.000000,20.140000> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-180.000000,0> translate<16.937100,0.000000,19.478900>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-180.000000,0> translate<15.489400,0.000000,19.478900>}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.680000,-1.536000,47.879000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.680000,-1.536000,48.641000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,90.000000,0> translate<33.680000,-1.536000,48.641000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.360000,-1.536000,47.904000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.360000,-1.536000,48.641000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,90.000000,0> translate<32.360000,-1.536000,48.641000> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-90.000000,0> translate<33.021100,-1.536000,47.542900>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-90.000000,0> translate<33.021100,-1.536000,48.990600>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.241000,-1.536000,8.280000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.479000,-1.536000,8.280000>}
box{<0,0,-0.050800><0.762000,0.036000,0.050800> rotate<0,0.000000,0> translate<22.479000,-1.536000,8.280000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.216000,-1.536000,6.960000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.479000,-1.536000,6.960000>}
box{<0,0,-0.050800><0.737000,0.036000,0.050800> rotate<0,0.000000,0> translate<22.479000,-1.536000,6.960000> }
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-180.000000,0> translate<23.577100,-1.536000,7.621100>}
box{<-0.375000,0,-0.725000><0.375000,0.036000,0.725000> rotate<0,-180.000000,0> translate<22.129400,-1.536000,7.621100>}
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.620200,0.000000,38.811200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.620200,0.000000,56.464200>}
box{<0,0,-0.076200><17.653000,0.036000,0.076200> rotate<0,90.000000,0> translate<34.620200,0.000000,56.464200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.620200,0.000000,56.464200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.466800,0.000000,56.464200>}
box{<0,0,-0.076200><8.153400,0.036000,0.076200> rotate<0,0.000000,0> translate<26.466800,0.000000,56.464200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.466800,0.000000,56.464200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.466800,0.000000,38.811200>}
box{<0,0,-0.076200><17.653000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.466800,0.000000,38.811200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.466800,0.000000,38.811200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.620200,0.000000,38.811200>}
box{<0,0,-0.076200><8.153400,0.036000,0.076200> rotate<0,0.000000,0> translate<26.466800,0.000000,38.811200> }
difference{
cylinder{<33.629600,0,39.751000><33.629600,0.036000,39.751000>0.609600 translate<0,0.000000,0>}
cylinder{<33.629600,-0.1,39.751000><33.629600,0.135000,39.751000>0.457200 translate<0,0.000000,0>}}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<35.407600,0.000000,39.370000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<35.407600,0.000000,40.640000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<35.407600,0.000000,41.910000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<35.407600,0.000000,43.180000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<35.407600,0.000000,44.450000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<35.407600,0.000000,45.720000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<35.407600,0.000000,46.990000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<35.407600,0.000000,48.260000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<35.407600,0.000000,49.530000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<35.407600,0.000000,50.800000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<35.407600,0.000000,52.070000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<35.407600,0.000000,53.340000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<35.407600,0.000000,54.610000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<35.407600,0.000000,55.880000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<25.679400,0.000000,55.880000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<25.679400,0.000000,54.610000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<25.679400,0.000000,53.340000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<25.679400,0.000000,52.070000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<25.679400,0.000000,50.800000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<25.679400,0.000000,49.530000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<25.679400,0.000000,48.260000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<25.679400,0.000000,46.990000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<25.679400,0.000000,45.720000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<25.679400,0.000000,44.450000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<25.679400,0.000000,43.180000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<25.679400,0.000000,41.910000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<25.679400,0.000000,40.640000>}
box{<-0.254000,0,-0.762000><0.254000,0.036000,0.762000> rotate<0,-90.000000,0> translate<25.679400,0.000000,39.370000>}
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,3.556000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.796000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.796000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,3.302000>}
box{<0,0,-0.076200><9.652000,0.036000,0.076200> rotate<0,0.000000,0> translate<9.144000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.144000,0.000000,3.302000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<8.890000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,6.477000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,3.556000>}
box{<0,0,-0.076200><2.921000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.050000,0.000000,3.556000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,3.556000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,6.477000>}
box{<0,0,-0.076200><2.921000,0.036000,0.076200> rotate<0,90.000000,0> translate<8.890000,0.000000,6.477000> }
difference{
cylinder{<9.347200,0,3.911600><9.347200,0.036000,3.911600>0.254000 translate<0,0.000000,0>}
cylinder{<9.347200,-0.1,3.911600><9.347200,0.135000,3.911600>0.254000 translate<0,0.000000,0>}}
box{<-0.952500,0,-0.635000><0.952500,0.036000,0.635000> rotate<0,-0.000000,0> translate<9.588500,0.000000,6.985000>}
box{<-0.889000,0,-0.381000><0.889000,0.036000,0.381000> rotate<0,-0.000000,0> translate<11.430000,0.000000,7.239000>}
box{<-0.381000,0,-0.635000><0.381000,0.036000,0.635000> rotate<0,-0.000000,0> translate<12.700000,0.000000,6.985000>}
box{<-0.889000,0,-0.381000><0.889000,0.036000,0.381000> rotate<0,-0.000000,0> translate<13.970000,0.000000,7.239000>}
box{<-0.381000,0,-0.635000><0.381000,0.036000,0.635000> rotate<0,-0.000000,0> translate<15.240000,0.000000,6.985000>}
box{<-0.889000,0,-0.381000><0.889000,0.036000,0.381000> rotate<0,-0.000000,0> translate<16.510000,0.000000,7.239000>}
box{<-0.952500,0,-0.635000><0.952500,0.036000,0.635000> rotate<0,-0.000000,0> translate<18.351500,0.000000,6.985000>}
box{<-0.889000,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-0.000000,0> translate<11.430000,0.000000,6.604000>}
box{<-0.889000,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-0.000000,0> translate<13.970000,0.000000,6.604000>}
box{<-0.889000,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-0.000000,0> translate<16.510000,0.000000,6.604000>}
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.986000,0.000000,3.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.954000,0.000000,3.780000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.954000,0.000000,3.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.700000,0.000000,11.146000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.700000,0.000000,9.114000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.700000,0.000000,9.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.954000,0.000000,8.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.700000,0.000000,9.114000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<26.700000,0.000000,9.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.240000,0.000000,11.146000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.240000,0.000000,9.114000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.240000,0.000000,9.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.986000,0.000000,8.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.240000,0.000000,9.114000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.986000,0.000000,8.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.240000,0.000000,11.146000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.986000,0.000000,11.400000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<28.986000,0.000000,11.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.700000,0.000000,11.146000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.954000,0.000000,11.400000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.700000,0.000000,11.146000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.954000,0.000000,11.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.986000,0.000000,11.400000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<26.954000,0.000000,11.400000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.700000,0.000000,8.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.954000,0.000000,8.860000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.700000,0.000000,8.606000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.700000,0.000000,8.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.700000,0.000000,6.574000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.700000,0.000000,6.574000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.954000,0.000000,6.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.700000,0.000000,6.574000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<26.700000,0.000000,6.574000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.700000,0.000000,6.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.954000,0.000000,6.320000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.700000,0.000000,6.066000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.954000,0.000000,3.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.700000,0.000000,4.034000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<26.700000,0.000000,4.034000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.700000,0.000000,6.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.700000,0.000000,4.034000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.700000,0.000000,4.034000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.240000,0.000000,8.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.986000,0.000000,8.860000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<28.986000,0.000000,8.860000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.986000,0.000000,6.320000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.240000,0.000000,6.574000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.986000,0.000000,6.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.240000,0.000000,6.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.986000,0.000000,6.320000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,44.997030,0> translate<28.986000,0.000000,6.320000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.986000,0.000000,3.780000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.240000,0.000000,4.034000>}
box{<0,0,-0.076200><0.359210,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.986000,0.000000,3.780000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.240000,0.000000,8.606000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.240000,0.000000,6.574000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.240000,0.000000,6.574000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.240000,0.000000,6.066000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.240000,0.000000,4.034000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.240000,0.000000,4.034000> }
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-90.000000,0> translate<27.970000,0.000000,5.050000>}
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-90.000000,0> translate<27.970000,0.000000,7.590000>}
box{<-0.304800,0,-0.304800><0.304800,0.036000,0.304800> rotate<0,-90.000000,0> translate<27.970000,0.000000,10.130000>}
//LTX silk screen
object{ARC(0.400000,0.101600,180.000000,360.000000,0.036000) translate<26.670000,0.000000,16.865000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.870000,0.000000,14.290000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.870000,0.000000,16.190000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,90.000000,0> translate<25.870000,0.000000,16.190000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.470000,0.000000,16.190000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.470000,0.000000,14.290000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,-90.000000,0> translate<27.470000,0.000000,14.290000> }
difference{
cylinder{<26.120000,0,16.665000><26.120000,0.036000,16.665000>0.150800 translate<0,0.000000,0>}
cylinder{<26.120000,-0.1,16.665000><26.120000,0.135000,16.665000>0.049200 translate<0,0.000000,0>}}
box{<-0.250000,0,-0.062500><0.250000,0.036000,0.062500> rotate<0,-0.000000,0> translate<26.070000,0.000000,16.827500>}
box{<-0.112500,0,-0.162500><0.112500,0.036000,0.162500> rotate<0,-0.000000,0> translate<25.932500,0.000000,16.627500>}
box{<-0.062500,0,-0.112500><0.062500,0.036000,0.112500> rotate<0,-0.000000,0> translate<26.282500,0.000000,16.577500>}
box{<-0.212500,0,-0.062500><0.212500,0.036000,0.062500> rotate<0,-0.000000,0> translate<26.232500,0.000000,16.527500>}
box{<-0.250000,0,-0.175000><0.250000,0.036000,0.175000> rotate<0,-0.000000,0> translate<27.270000,0.000000,16.715000>}
box{<-0.300000,0,-0.062500><0.300000,0.036000,0.062500> rotate<0,-0.000000,0> translate<27.220000,0.000000,16.527500>}
box{<-0.850000,0,-0.150000><0.850000,0.036000,0.150000> rotate<0,-0.000000,0> translate<26.670000,0.000000,16.340000>}
box{<-0.850000,0,-0.350000><0.850000,0.036000,0.350000> rotate<0,-0.000000,0> translate<26.670000,0.000000,13.940000>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-0.000000,0> translate<25.982500,0.000000,15.802500>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-0.000000,0> translate<27.357500,0.000000,15.802500>}
box{<-0.175000,0,-0.175000><0.175000,0.036000,0.175000> rotate<0,-0.000000,0> translate<26.670000,0.000000,15.415000>}
//PIC silk screen
object{ARC(0.400000,0.101600,180.000000,360.000000,0.036000) translate<30.480000,0.000000,16.865000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.680000,0.000000,14.290000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.680000,0.000000,16.190000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,90.000000,0> translate<29.680000,0.000000,16.190000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.280000,0.000000,16.190000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.280000,0.000000,14.290000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,-90.000000,0> translate<31.280000,0.000000,14.290000> }
difference{
cylinder{<29.930000,0,16.665000><29.930000,0.036000,16.665000>0.150800 translate<0,0.000000,0>}
cylinder{<29.930000,-0.1,16.665000><29.930000,0.135000,16.665000>0.049200 translate<0,0.000000,0>}}
box{<-0.250000,0,-0.062500><0.250000,0.036000,0.062500> rotate<0,-0.000000,0> translate<29.880000,0.000000,16.827500>}
box{<-0.112500,0,-0.162500><0.112500,0.036000,0.162500> rotate<0,-0.000000,0> translate<29.742500,0.000000,16.627500>}
box{<-0.062500,0,-0.112500><0.062500,0.036000,0.112500> rotate<0,-0.000000,0> translate<30.092500,0.000000,16.577500>}
box{<-0.212500,0,-0.062500><0.212500,0.036000,0.062500> rotate<0,-0.000000,0> translate<30.042500,0.000000,16.527500>}
box{<-0.250000,0,-0.175000><0.250000,0.036000,0.175000> rotate<0,-0.000000,0> translate<31.080000,0.000000,16.715000>}
box{<-0.300000,0,-0.062500><0.300000,0.036000,0.062500> rotate<0,-0.000000,0> translate<31.030000,0.000000,16.527500>}
box{<-0.850000,0,-0.150000><0.850000,0.036000,0.150000> rotate<0,-0.000000,0> translate<30.480000,0.000000,16.340000>}
box{<-0.850000,0,-0.350000><0.850000,0.036000,0.350000> rotate<0,-0.000000,0> translate<30.480000,0.000000,13.940000>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-0.000000,0> translate<29.792500,0.000000,15.802500>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-0.000000,0> translate<31.167500,0.000000,15.802500>}
box{<-0.175000,0,-0.175000><0.175000,0.036000,0.175000> rotate<0,-0.000000,0> translate<30.480000,0.000000,15.415000>}
//PWR silk screen
object{ARC(0.400000,0.101600,180.000000,360.000000,0.036000) translate<22.860000,0.000000,16.865000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.060000,0.000000,14.290000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.060000,0.000000,16.190000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,90.000000,0> translate<22.060000,0.000000,16.190000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.660000,0.000000,16.190000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.660000,0.000000,14.290000>}
box{<0,0,-0.050800><1.900000,0.036000,0.050800> rotate<0,-90.000000,0> translate<23.660000,0.000000,14.290000> }
difference{
cylinder{<22.310000,0,16.665000><22.310000,0.036000,16.665000>0.150800 translate<0,0.000000,0>}
cylinder{<22.310000,-0.1,16.665000><22.310000,0.135000,16.665000>0.049200 translate<0,0.000000,0>}}
box{<-0.250000,0,-0.062500><0.250000,0.036000,0.062500> rotate<0,-0.000000,0> translate<22.260000,0.000000,16.827500>}
box{<-0.112500,0,-0.162500><0.112500,0.036000,0.162500> rotate<0,-0.000000,0> translate<22.122500,0.000000,16.627500>}
box{<-0.062500,0,-0.112500><0.062500,0.036000,0.112500> rotate<0,-0.000000,0> translate<22.472500,0.000000,16.577500>}
box{<-0.212500,0,-0.062500><0.212500,0.036000,0.062500> rotate<0,-0.000000,0> translate<22.422500,0.000000,16.527500>}
box{<-0.250000,0,-0.175000><0.250000,0.036000,0.175000> rotate<0,-0.000000,0> translate<23.460000,0.000000,16.715000>}
box{<-0.300000,0,-0.062500><0.300000,0.036000,0.062500> rotate<0,-0.000000,0> translate<23.410000,0.000000,16.527500>}
box{<-0.850000,0,-0.150000><0.850000,0.036000,0.150000> rotate<0,-0.000000,0> translate<22.860000,0.000000,16.340000>}
box{<-0.850000,0,-0.350000><0.850000,0.036000,0.350000> rotate<0,-0.000000,0> translate<22.860000,0.000000,13.940000>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-0.000000,0> translate<22.172500,0.000000,15.802500>}
box{<-0.162500,0,-0.212500><0.162500,0.036000,0.212500> rotate<0,-0.000000,0> translate<23.547500,0.000000,15.802500>}
box{<-0.175000,0,-0.175000><0.175000,0.036000,0.175000> rotate<0,-0.000000,0> translate<22.860000,0.000000,15.415000>}
//Q1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.709600,0.000000,25.552400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.030400,0.000000,25.552400>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<38.709600,0.000000,25.552400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.030400,0.000000,25.552400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.030400,0.000000,22.707600>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.030400,0.000000,22.707600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.030400,0.000000,22.707600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.709600,0.000000,22.707600>}
box{<0,0,-0.076200><1.320800,0.036000,0.076200> rotate<0,0.000000,0> translate<38.709600,0.000000,22.707600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.709600,0.000000,22.707600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.709600,0.000000,25.552400>}
box{<0,0,-0.076200><2.844800,0.036000,0.076200> rotate<0,90.000000,0> translate<38.709600,0.000000,25.552400> }
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<38.366700,0.000000,24.130000>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<40.373300,0.000000,25.069800>}
box{<-0.228600,0,-0.292100><0.228600,0.036000,0.292100> rotate<0,-90.000000,0> translate<40.373300,0.000000,23.190200>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.406000,-1.536000,10.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.406000,-1.536000,9.728000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.406000,-1.536000,9.728000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.694000,-1.536000,9.728000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.694000,-1.536000,10.592000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.694000,-1.536000,10.592000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<19.050000,-1.536000,9.525000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<19.050000,-1.536000,10.795000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.276000,0.000000,18.318000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.276000,0.000000,19.182000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.276000,0.000000,19.182000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.564000,0.000000,19.182000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.564000,0.000000,18.318000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.564000,0.000000,18.318000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-90.000000,0> translate<19.920000,0.000000,19.385000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-90.000000,0> translate<19.920000,0.000000,18.115000>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.646000,-1.536000,20.752000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.646000,-1.536000,19.888000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.646000,-1.536000,19.888000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.934000,-1.536000,19.888000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.934000,-1.536000,20.752000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,90.000000,0> translate<33.934000,-1.536000,20.752000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<34.290000,-1.536000,19.685000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-270.000000,0> translate<34.290000,-1.536000,20.955000>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.882000,0.000000,27.026000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.018000,0.000000,27.026000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.018000,0.000000,27.026000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.018000,0.000000,26.314000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.882000,0.000000,26.314000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.018000,0.000000,26.314000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-180.000000,0> translate<43.815000,0.000000,26.670000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-180.000000,0> translate<45.085000,0.000000,26.670000>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.018000,0.000000,22.504000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.882000,0.000000,22.504000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.018000,0.000000,22.504000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.882000,0.000000,23.216000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.018000,0.000000,23.216000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<44.018000,0.000000,23.216000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-0.000000,0> translate<45.085000,0.000000,22.860000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-0.000000,0> translate<43.815000,0.000000,22.860000>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.612000,0.000000,30.836000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.748000,0.000000,30.836000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.748000,0.000000,30.836000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.748000,0.000000,30.124000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.612000,0.000000,30.124000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.748000,0.000000,30.124000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-180.000000,0> translate<42.545000,0.000000,30.480000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-180.000000,0> translate<43.815000,0.000000,30.480000>}
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.000000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.900000,0.000000,21.590000>}
box{<0,0,-0.063500><33.900000,0.036000,0.063500> rotate<0,0.000000,0> translate<0.000000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.900000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.900000,0.000000,37.640000>}
box{<0,0,-0.063500><16.050000,0.036000,0.063500> rotate<0,90.000000,0> translate<33.900000,0.000000,37.640000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.000000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.000000,0.000000,37.640000>}
box{<0,0,-0.063500><16.050000,0.036000,0.063500> rotate<0,90.000000,0> translate<0.000000,0.000000,37.640000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.000000,0.000000,37.640000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.900000,0.000000,37.640000>}
box{<0,0,-0.063500><33.900000,0.036000,0.063500> rotate<0,0.000000,0> translate<0.000000,0.000000,37.640000> }
//X2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.000000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.000000,0.000000,11.430000>}
box{<0,0,-0.063500><14.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<0.000000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.000000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.000000,0.000000,20.430000>}
box{<0,0,-0.063500><9.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<14.000000,0.000000,20.430000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.000000,0.000000,20.430000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.000000,0.000000,20.430000>}
box{<0,0,-0.063500><14.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<0.000000,0.000000,20.430000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.000000,0.000000,20.430000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.000000,0.000000,11.430000>}
box{<0,0,-0.063500><9.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<0.000000,0.000000,11.430000> }
//X3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.260000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.640000,0.000000,34.290000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,0.000000,0> translate<40.640000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.640000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.640000,0.000000,57.150000>}
box{<0,0,-0.063500><22.860000,0.036000,0.063500> rotate<0,90.000000,0> translate<40.640000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.640000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.260000,0.000000,57.150000>}
box{<0,0,-0.063500><7.620000,0.036000,0.063500> rotate<0,0.000000,0> translate<40.640000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.260000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.260000,0.000000,34.290000>}
box{<0,0,-0.063500><22.860000,0.036000,0.063500> rotate<0,-90.000000,0> translate<48.260000,0.000000,34.290000> }
//X4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.130000,0.000000,78.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.890000,0.000000,78.880000>}
box{<0,0,-0.063500><15.240000,0.036000,0.063500> rotate<0,0.000000,0> translate<8.890000,0.000000,78.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.130000,0.000000,58.280000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.130000,0.000000,78.880000>}
box{<0,0,-0.063500><20.600000,0.036000,0.063500> rotate<0,90.000000,0> translate<24.130000,0.000000,78.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.130000,0.000000,58.280000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.890000,0.000000,58.280000>}
box{<0,0,-0.063500><15.240000,0.036000,0.063500> rotate<0,0.000000,0> translate<8.890000,0.000000,58.280000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.890000,0.000000,58.280000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.890000,0.000000,78.880000>}
box{<0,0,-0.063500><20.600000,0.036000,0.063500> rotate<0,90.000000,0> translate<8.890000,0.000000,78.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.320000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.050000,0.000000,68.580000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<19.050000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.050000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.780000,0.000000,66.040000>}
box{<0,0,-0.063500><2.839806,0.036000,0.063500> rotate<0,-63.430762,0> translate<17.780000,0.000000,66.040000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.780000,0.000000,66.040000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.780000,0.000000,72.390000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,90.000000,0> translate<17.780000,0.000000,72.390000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.780000,0.000000,72.390000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.240000,0.000000,72.390000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<15.240000,0.000000,72.390000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.240000,0.000000,72.390000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.240000,0.000000,66.040000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,-90.000000,0> translate<15.240000,0.000000,66.040000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.240000,0.000000,66.040000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.970000,0.000000,68.580000>}
box{<0,0,-0.063500><2.839806,0.036000,0.063500> rotate<0,63.430762,0> translate<13.970000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.970000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.700000,0.000000,68.580000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.700000,0.000000,68.580000> }
//X5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.640000,0.000000,78.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,78.880000>}
box{<0,0,-0.063500><15.240000,0.036000,0.063500> rotate<0,0.000000,0> translate<25.400000,0.000000,78.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.640000,0.000000,58.280000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.640000,0.000000,78.880000>}
box{<0,0,-0.063500><20.600000,0.036000,0.063500> rotate<0,90.000000,0> translate<40.640000,0.000000,78.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<40.640000,0.000000,58.280000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,58.280000>}
box{<0,0,-0.063500><15.240000,0.036000,0.063500> rotate<0,0.000000,0> translate<25.400000,0.000000,58.280000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,58.280000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.400000,0.000000,78.880000>}
box{<0,0,-0.063500><20.600000,0.036000,0.063500> rotate<0,90.000000,0> translate<25.400000,0.000000,78.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.830000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.560000,0.000000,68.580000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<35.560000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.560000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,66.040000>}
box{<0,0,-0.063500><2.839806,0.036000,0.063500> rotate<0,-63.430762,0> translate<34.290000,0.000000,66.040000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,66.040000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,72.390000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,90.000000,0> translate<34.290000,0.000000,72.390000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<34.290000,0.000000,72.390000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,72.390000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<31.750000,0.000000,72.390000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,72.390000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,66.040000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,-90.000000,0> translate<31.750000,0.000000,66.040000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.750000,0.000000,66.040000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.480000,0.000000,68.580000>}
box{<0,0,-0.063500><2.839806,0.036000,0.063500> rotate<0,63.430762,0> translate<30.480000,0.000000,68.580000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.480000,0.000000,68.580000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.210000,0.000000,68.580000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<29.210000,0.000000,68.580000> }
//X6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.740000,0.000000,40.340000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.740000,0.000000,54.310000>}
box{<0,0,-0.063500><13.970000,0.036000,0.063500> rotate<0,90.000000,0> translate<16.740000,0.000000,54.310000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.230000,0.000000,40.340000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.230000,0.000000,54.310000>}
box{<0,0,-0.063500><13.970000,0.036000,0.063500> rotate<0,90.000000,0> translate<0.230000,0.000000,54.310000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.230000,0.000000,54.310000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.740000,0.000000,54.310000>}
box{<0,0,-0.063500><16.510000,0.036000,0.063500> rotate<0,0.000000,0> translate<0.230000,0.000000,54.310000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.740000,0.000000,40.340000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.230000,0.000000,40.340000>}
box{<0,0,-0.063500><16.510000,0.036000,0.063500> rotate<0,0.000000,0> translate<0.230000,0.000000,40.340000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.200000,0.000000,53.040000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.770000,0.000000,53.040000>}
box{<0,0,-0.063500><11.430000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.770000,0.000000,53.040000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.770000,0.000000,53.040000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.770000,0.000000,51.770000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<2.770000,0.000000,51.770000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.770000,0.000000,51.770000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.500000,0.000000,51.770000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.500000,0.000000,51.770000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.500000,0.000000,51.770000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.500000,0.000000,49.230000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,-90.000000,0> translate<1.500000,0.000000,49.230000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.500000,0.000000,49.230000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.865000,0.000000,49.230000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<0.865000,0.000000,49.230000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.865000,0.000000,49.230000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.865000,0.000000,45.420000>}
box{<0,0,-0.063500><3.810000,0.036000,0.063500> rotate<0,-90.000000,0> translate<0.865000,0.000000,45.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.865000,0.000000,45.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.500000,0.000000,45.420000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,0.000000,0> translate<0.865000,0.000000,45.420000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.500000,0.000000,45.420000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.500000,0.000000,42.880000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,-90.000000,0> translate<1.500000,0.000000,42.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.500000,0.000000,42.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.770000,0.000000,42.880000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,0.000000,0> translate<1.500000,0.000000,42.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.770000,0.000000,42.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.770000,0.000000,41.610000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<2.770000,0.000000,41.610000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.770000,0.000000,41.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.200000,0.000000,41.610000>}
box{<0,0,-0.063500><11.430000,0.036000,0.063500> rotate<0,0.000000,0> translate<2.770000,0.000000,41.610000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.200000,0.000000,53.040000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.200000,0.000000,41.610000>}
box{<0,0,-0.063500><11.430000,0.036000,0.063500> rotate<0,-90.000000,0> translate<14.200000,0.000000,41.610000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  NETNODE(-24.002500,0,-39.687500,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//B1	9902031	PUSHBUTTON
//C1	10u/7565127	CHIPCAP
//C2	10u/7565127	CHIPCAP
//IC1	PIC18F2320/9762051	SO-28W
//IC2	1087165	78XXS
//LTX		CHIPLED_1206
//PIC		CHIPLED_1206
//PWR		CHIPLED_1206
//X1	XPORT	XPORT
//X2	DC10R/224959	DC10R
//X3	SCREW_TERMINAL/3041438	SCREW_TERMINAL_8PINS
//X4	RJ45H	RJ45H
//X5	RJ45H	RJ45H
//X6	X/1097917	RJ11
