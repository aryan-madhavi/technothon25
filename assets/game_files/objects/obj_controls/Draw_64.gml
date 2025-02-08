if not help
	exit;

var _cam = view_camera[0];
var _xbuf = 20, _ybuf = 20;
var _view_width = camera_get_view_width(_cam);
var _view_height = camera_get_view_height(_cam);

display_set_gui_size(_view_width,_view_height);

draw_set_color(c_black);
draw_rectangle(0,0,_view_width,_view_height,false);

draw_set_color(c_white);

draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_set_font(fnt_case1979);
draw_set_color(c_yellow);
draw_text(_view_width/2,_ybuf*2,"CONTROLS");

draw_set_color(c_white);
draw_set_font(fnt_bitpap);

if array_length(my_text) == 0
	event_user(0);
for (var _i = 0; _i < array_length(my_text); ++_i)
	draw_text_transformed(_view_width/2,_ybuf*6+_i*string_height(" "),my_text[_i],.8,.8,0);

draw_set_color(c_silver);
draw_text_transformed(_view_width/2,_view_height-_ybuf*3,"Press 'esc' key to go back",.7,.7,0);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);