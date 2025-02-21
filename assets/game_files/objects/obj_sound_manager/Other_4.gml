switch room {
	case rm_menu_main:
	case rm_menu_email:
	case rm_menu_pass:
	case rm_menu_pause:
		set_snd_ingame(snd_phantoms_embrace,20,0);
		break;
	case rm_game:
	case rm_level_0:
	case rm_level_1:
	case rm_level_2:
	case rm_level_3:
		set_snd_ingame(snd_hydra,60,60);
		break;
}