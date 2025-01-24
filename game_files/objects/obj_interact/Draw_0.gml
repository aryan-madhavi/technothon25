draw_set_font(fnt_help_dialog);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//draw_rectangle(x, y, x+len, y+peak, true);
//draw_set_colour(c_yellow);
draw_text(x,y,msg);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

//depth = -bbox_bottom;