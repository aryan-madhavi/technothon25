if global.pause and not help and room == rm_menu_pause
	exit;

if keyboard_check_pressed(vk_f1) 
	help = !help;

if help and keyboard_check_pressed(vk_enter) {
	_question = string_copy(keyboard_string,1,string_length(keyboard_string));
	scr_sendgpt(_question);
}

global.pause = help;