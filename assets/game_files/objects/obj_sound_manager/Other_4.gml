switch room {
	case rm_menu_main:
	case rm_menu_email:
	case rm_menu_pass:
	case rm_menu_pause:
		set_snd_ingame(snd_phantoms_embrace,20,10);
		break;
	case rm_lab:
	case rm_game:
		set_snd_ingame(snd_hydra,60,60);
		break;
}