/// @description 

event_inherited();

if not inside exit;

if keyboard_check_pressed(ord("F"))
	play = !play;
	
if not play {
	video_close();
	video = undefined;
	if instance_exists(obj_pauser)
		instance_destroy(obj_pauser);
}