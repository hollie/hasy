=begin comment
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

xPL_Squeezebox.pm - xPL support for the former SlimDevices (now Logitech) Squeezebox devices

  $Date$
  $Revision$

Info:

  This module allows to easily integrate Squeezebox devices in your MH setup.

  It supports device monitoring (check the heartbeat), keeps the state of the 
  squeezebox (playing/stopped/power_off), allows to play sounds while 
  maintaining the current playlist.
     
Usage:

 In your items.mht, add the squeezebox devices like this:
 
   XPL_SQUEEZEBOX, device_name, , SBs

 Then in your code do something like:
   
   # Request the state of the plugwise devices

Todo:

License:
  This free software is licensed under the terms of the GNU public license.

Authors:
  Lieven Hollevoet  lieven@lika.be

Credits:

@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
=cut

use strict;

package xPL_Squeezebox;
use base qw(xPL_Item);

sub new {
    my ($class, $source) = @_;
    my $self = $class->SUPER::new(source);
    $self->SUPER::class_name('audio.bas*');
    $$self{id} = $id;
    $$self{state_monitor} = "audio.basic : status";
    #$self->SUPER::device_monitor("device=$id") if $id;
    # remap the state values to on and off
    $self->tie_value_convertor('level','($section =~ /^audio.basic/ and $status eq "stopped") ? "off" : "on"');

    $self->addStates ('on', 'off');
	
    return $self;
}


sub request_stat {
    my ($self) = @_;
    $self->SUPER::send_cmnd('audio.basic' => { 'command' => 'status' });
}

sub id {
    my ($self) = @_;
    return $$self{id};
}

sub addStates {
    my $self = shift;
    push(@{$$self{states}}, @_) unless $self->{displayonly};
}

sub ignore_message {
    my ($self, $p_data) = @_;
    my $ignore_msg = 0;
    if (!(defined($$p_data{'audio.basic'}))){
	$ignore_msg = 1;
    }
    return $ignore_msg;
}

sub default_setstate
{
    my ($self, $state, $substate, $set_by) = @_;
    if ($set_by =~ /^xpl/i) {
    	if ($$self{changed} =~ /audio\.basic/) {
           &::print_log("[xPL_Squeezebox] " . $self->get_object_name
                . " state is $state") if $main::Debug{xpl_squeezebox};
           # TO-DO: process all of the other pertinent attributes available
    	   return -1 if $self->state eq $state; # don't propagate state unless it has changed
	}
    } else {
    	my $cmnd = ($state =~ /^off/i) ? 'off' : 'on';
    	
    	return -1 if ($self->state eq $state); # Don't propagate state unless it has changed.
        &::print_log("[xPL_Squeezebox] Request " . $self->get_object_name
		     . " turn " . $cmnd 
	    ) if $main::Debug{xpl_squeezebox};
        my $cmd_block;
    	#$$cmd_block{'command'} = $cmnd;
    	#$$cmd_block{'device'} = $self->id;
    	#$self->SUPER::send_cmnd('plugwise.basic', $cmd_block);
    	return;
    }
	
}
    
1;
