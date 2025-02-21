draw_sprite(sprite_index,0,x,y);

var _cam = view_camera[0];

var _x = x;
var _y = y - (sprite_get_height(sprite_index) + 30);


draw_set_font(fnt_elianto);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);

draw_circle(_x,_y,18,false);
draw_text_color(_x,_y,num,c_teal,c_teal,c_teal,c_teal,1);


draw_set_valign(fa_top);
draw_set_halign(fa_left);

