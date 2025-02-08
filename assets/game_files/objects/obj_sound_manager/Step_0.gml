
var _final_vol = global.master_vol * global.music_vol;

// Play the target sound
if snd_asset != target_snd_asset {
	
	// Fade out previous sound
	if audio_is_playing(snd_inst) {
		
		// Add snd_inst to fade_out_insts
		array_push(fade_out_insts, snd_inst);
		array_push(fade_out_inst_vol, fade_in_inst_vol);
		array_push(fade_out_inst_time, end_fade_out_time);
		
		// Reset the snd_inst and snd_asset
		snd_inst = noone;
		snd_asset = noone;
	}
	
	// Play the sound, once previous sound has faded out
	if array_length(fade_out_insts) == 0 and audio_exists(target_snd_asset) {
	
		// Play sound and store it's instance in a variable
		snd_inst = audio_play_sound(target_snd_asset,0,true);
	
		// Start sound volume at 0
		audio_sound_gain(snd_inst,0,0);
		fade_in_inst_vol = 0;
	
		snd_asset = target_snd_asset;
	}
}

// Volume Control 
	// Main Sound Volume
	if audio_is_playing(snd_inst) {
	
		// Fade the sound in
		if start_fade_in_time > 0
			fade_in_inst_vol = fade_in_inst_vol < 1 
								? fade_in_inst_vol + 1/start_fade_in_time 
								: 1;
		// Immediately start the sound
		else
			fade_in_inst_vol = 1;
		
		audio_sound_gain(snd_inst, fade_in_inst_vol*_final_vol, 0);
	}
	
	// Fading sounds out
	for (var _i = 0; _i < array_length(fade_out_insts); ++_i) {
	    
		fade_out_inst_vol[_i] = fade_out_inst_time[_i] > 0
								? fade_out_inst_vol[_i] - 1/fade_out_inst_time[_i]	// Fade the volume
								: 0;												// Immediately set volume = 0
		
		// Set gain
		audio_sound_gain(fade_out_insts[_i], fade_out_inst_vol[_i]*_final_vol, 0);
		
		// Stop sound once, volume = 0 and remove it from all arrays
		if fade_out_inst_vol[_i] <= 0 and audio_is_playing(fade_out_insts[_i]) {
			
			// Stop sound
			audio_stop_sound(fade_out_insts[_i]);
			
			// Remove it from all arrays
			array_delete(fade_out_insts,_i,1);
			array_delete(fade_out_inst_vol,_i,1);
			array_delete(fade_out_inst_time,_i,1);
			
			// Decrement loop after deleting an entry
			--_i;
		}
		
	}