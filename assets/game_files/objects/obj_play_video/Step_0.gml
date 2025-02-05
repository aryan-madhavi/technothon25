/// @description 

event_inherited();

if not inside exit;

if keyboard_check_pressed(ord("F"))
	play = !play;
	
if keyboard_check_pressed(vk_space)
	pause = !pause;

//if pause 	video_pause();
//else		video_resume();

if not play {
	video_close();
	video = undefined;
	pause = false;
	play = false;
	global.pause = false;
}