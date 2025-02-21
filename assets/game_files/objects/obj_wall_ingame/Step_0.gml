if not scale_set {
	image_xscale = width / sprite_get_width(sprite_index);
	image_yscale = height != 0
					? height / sprite_get_height(sprite_index)
					: 1;
	scale_set = true;
}