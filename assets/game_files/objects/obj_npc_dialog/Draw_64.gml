draw_set_color(c_white);

draw_set_font(fnt_robotronika);
var _str_width = string_width(text[page]);
var _str_height = string_height(" ");

_width = 300;
_height = _str_height + op_border*2;

var _xbuf = 20, _ybuf = 20;
var _cam = view_camera[0];
var _x1 = camera_get_view_x(_cam) + _xbuf;
var _y1 = camera_get_view_y(_cam) + (_height + _ybuf);
var _x2 = _x1 + _width + op_border;
var _y2 = _y1 + _height + op_border;

var _c = c_black;
draw_rectangle_color(
	_x1, _y1 - ((round(_str_width/_width) - 1) * _str_height),
	_x2, _y2,
	_c,_c,_c,_c,false
);
_c = c_white;
draw_rectangle_color(
	_x1, _y1 - ((round(_str_width/_width) - 1) * _str_height),
	_x2, _y2,
	_c,_c,_c,_c,true
);

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_text_ext(_x1+op_border,_y1+_height,text[page],_str_height,_width);

draw_set_halign(fa_left);
draw_set_valign(fa_top);