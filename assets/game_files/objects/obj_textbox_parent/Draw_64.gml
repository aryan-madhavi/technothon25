draw_set_color(c_white);

draw_set_font(fnt_bitpap);
var _str_width = string_width(keyboard_string);
var _str_height = string_height(" ");

_width = (_str_width > 300 ? _str_width : 300) + op_border*2;
_height = _str_height + op_border*2;

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_text_transformed(x,y,prompt,0.85,0.85,0);

draw_sprite_ext(sprite_index,image_index,x,y,_width/sprite_width,_height/sprite_height,0,c_white,1);

draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text(x+op_border,y+_height/2,keyboard_string);

if alarm[0] and not keyboard_check_pressed(vk_anykey)
	draw_line_width(x+_str_width+op_border,y+op_border,x+_str_width+op_border,y+_height-op_border,2);

draw_set_halign(fa_left);
draw_set_valign(fa_top);