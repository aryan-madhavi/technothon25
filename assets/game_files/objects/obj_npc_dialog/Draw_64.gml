if global.pause
	exit;

draw_set_color(c_white);
draw_set_font(fnt_consolas);
var _str_width = string_width(text[page]);
var _str_height = string_height(" ");


var _xbuf = 20, _ybuf = 20;
var _cam = view_camera[0];
_width = camera_get_view_width(_cam);
_height = camera_get_view_height(_cam) / 4;


var _x1 = _xbuf;
var _y1 = _ybuf;
var _x2 = _x1 + _width - _xbuf*2;
_height = (string_count(ansi_char(10),text[page]) + ceil(_str_width/(_x2-_x1))) * _str_height;
var _y2 = _y1 + _height + _ybuf*2 //+ (ceil(_str_width/(_x2-_x1)) * _str_height) - _str_height*2;


var _c = c_black;
draw_rectangle_color(
	_x1, _y1, 
	_x2, _y2,
	_c,_c,_c,_c,false
);

_c = c_white;
draw_rectangle_color(
	_x1, _y1,
	_x2, _y2,
	_c,_c,_c,_c,true
);


draw_set_halign(fa_left);
draw_set_valign(fa_top);
if char_count < string_length(text[page])
	char_count += .5;
text_part = string_copy(text[page],1,char_count); 
draw_text_ext(_x1+op_border,_y1+op_border,text_part,-1,_x2 - _x1 - op_border*2);
event_user(0);

_c = c_yellow;
font_size = 12 / font_get_size(fnt_robotronika);
draw_set_font(fnt_robotronika);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text_transformed_color(_x2-op_border,_y2-op_border,name,font_size,font_size,0,_c,_c,_c,_c,1);


draw_set_halign(fa_left);
draw_set_valign(fa_top);