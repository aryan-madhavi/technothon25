

switch room {
	case rm_menu_main:
	case rm_menu_pause:
		event_user(1);
	default:
		exit;
}