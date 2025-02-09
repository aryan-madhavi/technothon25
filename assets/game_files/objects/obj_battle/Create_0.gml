
event_inherited();

interact_key = vk_enter;

prompt = "Press 'ENTER' to fight";

sprite_index = spr_interact;

if w != 0 or h != 0 {
	image_xscale = w / sprite_width;
	image_yscale = h / sprite_height;
}