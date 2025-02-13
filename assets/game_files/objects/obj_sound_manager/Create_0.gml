// Current playing sound
snd_inst = noone;
snd_asset = noone;
target_snd_asset = noone;
fade_in_inst_vol = 1;
start_fade_in_time = 0;
end_fade_out_time = 0;

// Stopping current sound
fade_out_insts = array_create(0);
fade_out_inst_vol = array_create(0);
fade_out_inst_time = array_create(0);

room_start = function() {
	event_perform(ev_other,ev_room_start);
}