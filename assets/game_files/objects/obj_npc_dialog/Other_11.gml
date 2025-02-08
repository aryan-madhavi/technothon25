/// @description Destroy instances
instance_destroy(creator.area);
creator.area = noone;
instance_destroy();
creator.my_dialog = noone;
creator.prompt = "Press T to Talk";
if audio_is_playing(snd_inst)
	audio_stop_sound(snd_inst);
snd_inst = noone;