/// @description Destroy instances
instance_destroy(creator.area);
creator.area = noone;
instance_destroy();
creator.my_dialog = noone;
creator.read_file = false;
creator.my_text = [];
creator.my_name = "";
creator.prompt = "Press F to Talk";
if audio_is_playing(snd_inst)
	audio_stop_sound(snd_inst);
snd_inst = noone;