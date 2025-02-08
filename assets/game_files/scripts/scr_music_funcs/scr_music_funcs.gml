function set_snd_ingame(_snd, _fade_out_current_snd = 0, _fade_in = 0) {
	with obj_sound_manager {

		// _snd = set to any sound (including 'noone' to stop/fade out)
		target_snd_asset = _snd;

		// _fade_out_current_snd = time (in frames) to fade out current sound (if playing)
		end_fade_out_time = _fade_out_current_snd;

		// _fade_in = time (in frames) to fade in target sound (if not 'noone')
		start_fade_in_time = _fade_in;
	}
} 