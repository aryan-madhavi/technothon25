if not global.pause
	event_inherited();

if hp_enemy == 0 or hp_player == 0 {
	action = false;
	hp_enemy = hp_total;
	hp_player = hp_total;
	damage_enemy = 0;
}

if not action {
	read_file = false;
	cc_que = 0;
	cc_opt = 0;
	page = 0;
	assessment = [];
	if instance_exists(obj_tb_aariona)
		instance_destroy(obj_tb_aariona);
	exit;
}


if not read_file
	event_user(0);


// Background
draw_sprite(spr_tb_bg,0,0,0);

// Message Box
var _x1 = 0;
var _y1 = 340;
var _x2 = sprite_get_width(spr_tb_bg) / sprite_get_width(spr_textbox);
var _y2 = (sprite_get_height(spr_tb_bg)/2.3) / sprite_get_height(spr_textbox);
//draw_sprite_ext(spr_textbox,-1,_x1,_y1,_x2,_y2,0,c_white,1);
draw_sprite_stretched(spr_textbox,-1,_x1,_y1,800,600);
// Prompts
draw_set_font(fnt_lt_railway);
var _p = "Press 'F2' to exit";
draw_sprite_ext(spr_textbox,0,500,20,(string_width(_p)+50)/sprite_get_width(spr_textbox),.6,0,c_white,1);
draw_text(520,30,_p);

#region Assessments

var _xbuf = 15, _ybuf = 20;
_x1 += _xbuf;
_y1 += _ybuf;

draw_set_font(fnt_consolas);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// Question
if cc_que < string_length(assessment[page][QUESTION])
	cc_que += .5;
text_part = string_copy(assessment[page][QUESTION],1,cc_que);

draw_text(_x1,_y1,text_part);

_y1 += string_height(" ");

// Options
if cc_que >= string_length(assessment[page][QUESTION])
for (var _i = 0; _i < array_length(assessment[page][OPTIONS]); ++_i) {
		
	if cc_opt < string_length(assessment[page][OPTIONS][_i])
		cc_opt += .5 / array_length(assessment[page][OPTIONS]);
		
	text_part = string_copy(assessment[page][OPTIONS][_i],1,cc_opt);
	
	draw_text(_x1,_y1+string_height(" ")*_i, $"    {_i+1}. {text_part}");
	
}

// Answer
_x2 = -2*_xbuf + sprite_get_width(spr_tb_bg);
_y2 = -3*_ybuf + sprite_get_height(spr_tb_bg);
draw_set_valign(fa_top);
draw_set_halign(fa_right);
draw_text(_x2 + _xbuf, _y2, " |");
draw_text(_x2,_y2,keyboard_string);

draw_set_font(fnt_lt_railway);
draw_set_color(c_silver);
draw_set_valign(fa_bottom);
draw_set_halign(fa_right);
draw_text(_x2,_y2-5,"Type your answer");

draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
#endregion



#region Sprites

// Aariona
_x1 = sprite_get_width(spr_tb_bg) / 4 * 3;
_y1 = sprite_get_height(spr_tb_bg) / 4 * 2.125;
if not instance_exists(obj_tb_aariona)
	instance_create_layer(0,0,"Instances",obj_tb_aariona);
draw_sprite_ext(spr_tb_aariona,obj_tb_aariona.image_index,_x1,_y1,obj_tb_aariona.image_xscale,obj_tb_aariona.image_yscale,0,c_white,1);
_x1 -= _xbuf;
_y1 -= sprite_get_height(spr_tb_aariona)*2.5;
draw_sprite_ext(spr_tb_hp,0,_x1,_y1,3*sprite_get_width(spr_tb_hp),1,0,c_white,1);
draw_sprite_ext(spr_tb_hp,0,_x1,_y1,3*sprite_get_width(spr_tb_hp)*(hp_player/hp_total),1,0,c_lime,1);

// Enemy
_x1 = sprite_get_width(spr_tb_bg) / 4;
_y1 = sprite_get_height(spr_tb_bg) / 4 * 2.125;
draw_sprite_ext(enemy_spr,obj_enemy.image_index,_x1,_y1,5,5,0,c_white,1);
_x1 += _xbuf;
_y1 -= sprite_get_height(spr_tb_aariona)*2.5;
draw_sprite_ext(spr_tb_hp,0,_x1,_y1,-3*sprite_get_width(spr_tb_hp),1,0,c_white,1);
draw_sprite_ext(spr_tb_hp,0,_x1,_y1,-3*sprite_get_width(spr_tb_hp)*(hp_enemy/hp_total),1,0,c_red,1);
#endregion

