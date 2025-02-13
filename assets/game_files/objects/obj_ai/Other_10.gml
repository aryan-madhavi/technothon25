/// @description Play audio if moving

snd = snd_ai_move;
intro_len = 0.428;
total_len = 1.041;
loop_len = total_len-intro_len;

if global.battle and snd_inst != noone {
	if audio_is_playing(snd_inst)
		audio_stop_sound(snd_inst);
	snd_inst = noone;
}
else if x != xprevious or y != yprevious {
	if snd_inst != noone {
		pos = audio_sound_get_track_position(snd_inst)
		if pos >= total_len {
			audio_sound_set_track_position(snd_inst,pos-loop_len)
		}
	}
	else
		snd_inst = audio_play_sound(snd,.5,false);
}
else {
	if audio_is_playing(snd_inst)
		audio_stop_sound(snd_inst)
	snd_inst = noone;
}