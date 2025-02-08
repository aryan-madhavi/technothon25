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

function choose_robot_lang() {
	randomize();
	var _robot_langs = [
		snd_robot_lang_1,
		snd_robot_lang_2,
		snd_robot_lang_3,
		snd_robot_lang_4,
		snd_robot_lang_5,
		snd_robot_lang_6,
	];
	var _i = irandom(array_length(_robot_langs)-1);
	return _robot_langs[_i];
}