#! /bin/sh

rrdtool create ventilatie/ebos.rrd    \
 --step 900                           \
 DS:temperature:GAUGE:1800:-80:80      \
 DS:dewpoint:GAUGE:1800:-80:80         \
 RRA:AVERAGE:0.5:1:4032 \
 RRA:AVERAGE:0.5:12:720 \
 RRA:AVERAGE:0.5:288:365 \
 RRA:AVERAGE:0.5:2016:1560 \
 RRA:MIN:0.5:12:720 \
 RRA:MIN:0.5:288:365 \
 RRA:MIN:0.5:2016:1560 \
 RRA:MAX:0.5:12:720 \
 RRA:MAX:0.5:288:365 \
 RRA:MAX:0.5:2016:1560

rrdtool create ventilatie/aww_uit.rrd    \
   DS:temperature:GAUGE:600:-80:80      \
   RRA:AVERAGE:0.5:1:4032 \
   RRA:AVERAGE:0.5:12:720 \
   RRA:AVERAGE:0.5:288:365 \
   RRA:AVERAGE:0.5:2016:1560 \
   RRA:MIN:0.5:12:720 \
   RRA:MIN:0.5:288:365 \
   RRA:MIN:0.5:2016:1560 \
   RRA:MAX:0.5:12:720 \
   RRA:MAX:0.5:288:365 \
   RRA:MAX:0.5:2016:1560

  rrdtool create ventilatie/unit_ext_in.rrd    \
   DS:temperature:GAUGE:600:-80:80      \
   RRA:AVERAGE:0.5:1:4032 \
   RRA:AVERAGE:0.5:12:720 \
   RRA:AVERAGE:0.5:288:365 \
   RRA:AVERAGE:0.5:2016:1560 \
   RRA:MIN:0.5:12:720 \
   RRA:MIN:0.5:288:365 \
   RRA:MIN:0.5:2016:1560 \
   RRA:MAX:0.5:12:720 \
   RRA:MAX:0.5:288:365 \
   RRA:MAX:0.5:2016:1560

  rrdtool create ventilatie/unit_int_in.rrd    \
   DS:temperature:GAUGE:600:-80:80      \
   RRA:AVERAGE:0.5:1:4032 \
   RRA:AVERAGE:0.5:12:720 \
   RRA:AVERAGE:0.5:288:365 \
   RRA:AVERAGE:0.5:2016:1560 \
   RRA:MIN:0.5:12:720 \
   RRA:MIN:0.5:288:365 \
   RRA:MIN:0.5:2016:1560 \
   RRA:MAX:0.5:12:720 \
   RRA:MAX:0.5:288:365 \
   RRA:MAX:0.5:2016:1560

  rrdtool create ventilatie/unit_int_uit.rrd    \
   DS:temperature:GAUGE:600:-80:80      \
   RRA:AVERAGE:0.5:1:4032 \
   RRA:AVERAGE:0.5:12:720 \
   RRA:AVERAGE:0.5:288:365 \
   RRA:AVERAGE:0.5:2016:1560 \
   RRA:MIN:0.5:12:720 \
   RRA:MIN:0.5:288:365 \
   RRA:MIN:0.5:2016:1560 \
   RRA:MAX:0.5:12:720 \
   RRA:MAX:0.5:288:365 \
   RRA:MAX:0.5:2016:1560

