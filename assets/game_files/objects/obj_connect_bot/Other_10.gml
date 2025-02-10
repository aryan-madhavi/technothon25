/// @description Play audio for AI's response

snd = snd_ai_response;

if string_length(text_part) < string_length(display_string) {
	if snd_inst == noone
		snd_inst = audio_play_sound(snd,1,true);
}
else {
	if string_length(text_part) >= string_length(display_string) and audio_is_playing(snd_inst) {
		audio_stop_sound(snd_inst);
		snd_inst = noone;
	}
}