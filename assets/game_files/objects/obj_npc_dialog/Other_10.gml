/// @description Play Audio if talking

snd = choose_robot_lang();

if string_length(text_part) < string_length(text[page])  {
	if snd_inst == noone 
		snd_inst = audio_play_sound(snd,1,true);
}
else {
	if string_length(text_part) >= string_length(text[page]) and audio_is_playing(snd_inst)
		audio_stop_sound(snd_inst)
	snd_inst = noone;
}