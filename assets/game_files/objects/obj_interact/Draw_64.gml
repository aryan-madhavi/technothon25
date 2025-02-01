if (image_index % 2 != 0)
	exit;

draw_set_font(fnt_biome);

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

var _cam = view_camera[0];
var _x = camera_get_view_width(_cam) - 20;
var _y = camera_get_view_height(_cam) - 15;

//draw_rectangle(x, y, x+len, y+peak, true);
//draw_set_colour(c_yellow);
draw_text(_x,_y,text);


draw_set_halign(fa_left);
draw_set_valign(fa_top);

//depth = -bbox_bottom;