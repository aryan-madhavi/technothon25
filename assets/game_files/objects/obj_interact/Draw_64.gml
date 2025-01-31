if not inside
	exit;

if action
	exit;

draw_set_font(fnt_biome);

var _c = c_teal;
var _cam = view_camera[0];
var _xbuf = 20, _ybuf = 15;
var _x2 = camera_get_view_width(_cam) - _xbuf;
var _y2 = camera_get_view_height(_cam) - _ybuf;
var _x1 = _x2 - string_width(text) - _xbuf*2;
var _y1 = _y2 - string_height(text) - _ybuf*2;

draw_rectangle_color(_x1,_y1,_x2,_y2,_c,_c,_c,_c,true);

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(_x2-_xbuf,_y2-_ybuf,text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);