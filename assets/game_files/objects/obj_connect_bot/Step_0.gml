
if global.pause and not help {
	exit;
}

switch room {
	case rm_menu_main:
	case rm_menu_email:
	case rm_menu_pass:
	case rm_menu_pause:
		exit;
}

if string_length(text_part) >= string_length(display_string) 
and display_string != "Thinking..."
and keyboard_check_pressed(vk_f1) {
	help = !help;
}

if help and keyboard_check_pressed(vk_enter) {
	_question = string_copy(keyboard_string,1,string_length(keyboard_string));
	scr_sendgpt(_question);
}

global.pause = help;