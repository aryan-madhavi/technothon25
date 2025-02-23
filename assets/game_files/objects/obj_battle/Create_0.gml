
event_inherited();

interact_key = vk_f2;

prompt = "Press 'F2' to fight";

sprite_index = spr_interact;

hp_total = 100;
enemy = noone;

hp_player = hp_total;
hp_enemy = hp_total;

damage_enemy = 0;
damage_player = hp_total/5;

player_won = false;

if w != 0 or h != 0 {
	image_xscale = w / sprite_width;
	image_yscale = h / sprite_height;
}

read_file = false;
//instructions = array_create(0);
assessment = array_create(0);


#macro QUESTION 0
#macro OPTIONS 1
#macro ANSWER 2

page = 0;
cc_que = 0;
cc_opt = 0;
ans = "";

_temp_snd = noone;

alarm[0] = 1;