/// @description Wall Interact

prompt = "Press 'F' to interact";

// Background
draw_sprite(spr_tb_bg,0,0,0);

// Message Box
var _x1 = 0;
var _y1 = 0;
var _x2 = sprite_get_width(spr_tb_bg);
var _y2 = sprite_get_height(spr_tb_bg);
draw_sprite_stretched(spr_textbox,-1,_x1,_y1,800,600);

// Prompts
draw_set_font(fnt_doto);
var _p = "Press 'F2' to exit";
draw_sprite_ext(spr_textbox,0,500,20,(string_width(_p)+50)/sprite_get_width(spr_textbox),.6,0,c_white,1);
draw_text(520,30,_p);


#region Assessments

var _xbuf = 15, _ybuf = 20;
_x1 += _xbuf;
_y1 += 5*_ybuf;
_x2 = -2*_xbuf + sprite_get_width(spr_tb_bg);
_y2 = -3*_ybuf + sprite_get_height(spr_tb_bg);

draw_set_font(fnt_consolas);
draw_set_valign(fa_top);
draw_set_halign(fa_left);


// Question
if cc_que < string_length(assessment[page][QUESTION])
	cc_que += .7;
text_part = string_copy(assessment[page][QUESTION],1,cc_que);

draw_text_ext(_x1,_y1,text_part,-1,_x2-_x1);


newln_count = string_count(ansi_char(10),assessment[page][QUESTION]);
_y1 += string_height(" ") * (string_width(text_part)/(_x2-_x1) + newln_count + 1);

// Options
if cc_que >= string_length(assessment[page][QUESTION])
for (var _i = 0; _i < array_length(assessment[page][OPTIONS]); ++_i) {
		
	if cc_opt < string_length(assessment[page][OPTIONS][_i])
		cc_opt += .5 / array_length(assessment[page][OPTIONS]);
		
	text_part = string_copy(assessment[page][OPTIONS][_i],1,cc_opt);
	
	draw_text(_x1,_y1+string_height(" ")*_i, $"    {_i+1}. {text_part}");
	
}

// Answer
draw_set_font(fnt_nova);
draw_set_valign(fa_top);
draw_set_halign(fa_right);
if alarm[0] or keyboard_string != ""
	draw_text(_x2 + _xbuf, _y2, " |");
else
	draw_text(_x2 + _xbuf, _y2, " -");
draw_text(_x2,_y2,keyboard_string);

draw_set_font(fnt_doto);
draw_set_valign(fa_bottom);
draw_set_halign(fa_right);
draw_text(_x2,_y2,"Type your option number and hit ENTER");

#endregion

#region Sprites

// Aariona
_x2 = _x1 + _xbuf*4;
_y2 = -3*_ybuf + sprite_get_height(spr_tb_bg);
if not instance_exists(obj_tb_aariona) {
	instance_create_layer(0,0,"Instances",obj_tb_aariona);
	obj_tb_aariona.image_xscale *= -1;
}
draw_sprite_ext(spr_tb_aariona,obj_tb_aariona.image_index,_x2,_y2,obj_tb_aariona.image_xscale,obj_tb_aariona.image_yscale,0,c_white,1);
_x2 -= _xbuf;
_y2 -= sprite_get_height(spr_tb_aariona)*2;
draw_sprite_ext(spr_tb_hp,0,_x2,_y2,3*sprite_get_width(spr_tb_hp),1,0,c_white,1);
draw_sprite_ext(spr_tb_hp,0,_x2,_y2,3*sprite_get_width(spr_tb_hp)*(hp_player/hp_total),1,0,c_lime,1);

// Wall
_x2 = -(_x1 + _xbuf*4) + sprite_get_width(spr_tb_bg);
_y2 = -3*_ybuf + sprite_get_height(spr_tb_bg);
_y2 -= sprite_get_height(spr_tb_aariona)*2;
draw_sprite_ext(spr_tb_hp,0,_x2,_y2,-3*sprite_get_width(spr_tb_hp),1,0,c_white,1);
draw_sprite_ext(spr_tb_hp,0,_x2,_y2,-3*sprite_get_width(spr_tb_hp)*(hp_enemy/hp_total),1,0,c_red,1);

draw_set_color(c_white);
draw_set_font(fnt_elianto);
draw_set_valign(fa_top);
draw_set_halign(fa_right);
draw_text(_x2,_y2 + sprite_get_height(spr_tb_hp)*1.5,"Wall");

#endregion

draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_left);


