if not help and not global.battle {
	keyboard_string = "";
	exit;
}

var _cam = view_camera[0];
var _xbuf = 20, _ybuf = 20, _op_border = 12;
var _view_width = camera_get_view_width(_cam);
var _view_height = camera_get_view_height(_cam);

display_set_gui_size(_view_width,_view_height);

draw_set_color(c_black);
draw_rectangle(0,0,_view_width,_view_height,false);

draw_set_color(c_white);

var _x1 = _xbuf;
var _y1 = _view_height * 3 / 4;
var _x2 = _view_width - _xbuf;
var _y2 = _view_height - _ybuf;

var _c = c_yellow;
draw_roundrect_color(_x1,_y1,_x2,_y2,_c,_c,true);

draw_set_font(fnt_square_block);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text_ext(_x1+_op_border,_y1+_op_border,keyboard_string,-1,_view_width-_xbuf*2.5-_op_border);

if display_string != "" {
	_x1 = _xbuf;
	_y1 = _ybuf;
	_x2 = _view_width - _xbuf;
	_y2 = _view_height / 1.5 + _ybuf;
	
	draw_roundrect_ext(_x1,_y1,_x2,_y2,20,20,true);
	
	var _c = c_teal;
	draw_set_font(fnt_case1979);
	draw_text_transformed_color(_x1+_op_border,_y1+_op_border,"RIRURU",.5,.5,0,_c,_c,_c,_c,1);
	
	if char_count < string_length(display_string)
		char_count += .5;
	text_part = string_copy(display_string,1,char_count);
	
	draw_set_font(fnt_elianto);
	_y1 += string_height(" ")*1.5;
	draw_text_ext(_x1+_op_border,_y1+_op_border,text_part,string_height(" ")+5,_view_width-_xbuf*2.5-_op_border);
	event_user(0);
}
else {
	
	draw_set_valign(fa_top);
	draw_set_halign(fa_center);

	draw_set_font(fnt_bitpap);
	draw_text(_view_width/2,_ybuf*2,"Need Help?");

	//draw_set_font(fnt_lt_railway);
	//draw_text_transformed(_view_width/2,_ybuf*5.5,"Start typing your question",2,2,0);
	draw_set_font(fnt_robotronika);
	draw_text(_view_width/2,_ybuf*6,"Start typing your question");
	draw_set_font(fnt_doto);
	draw_text(_view_width/2,_ybuf*7,"Press F1 to exit and ENTER to ask");
}

draw_set_valign(fa_top);
draw_set_halign(fa_left);