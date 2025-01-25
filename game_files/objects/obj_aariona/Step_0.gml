h_input = keyboard_check(vk_right) - keyboard_check(vk_left);
v_input = keyboard_check(vk_down) - keyboard_check(vk_up);
sprint = keyboard_check(vk_shift);

if not instance_exists(obj_pauser) and ( h_input != 0 or v_input != 0) {
	if sprint == true { state = STATE_AARIONA.SPRINT; }
	else { state = STATE_AARIONA.WALK; }
	dir = point_direction(0,0,h_input,v_input);
	direction = dir;
	
	switch (state) {
		case STATE_AARIONA.IDLE:
			mov_spd = 0;
			image_speed = 0;
			image_index = 1;
			break;
		case STATE_AARIONA.WALK:
			image_speed = 1;
			mov_spd = 3;
			break;
		case STATE_AARIONA.SPRINT:
			image_speed = 1;
			mov_spd = 5;
			break;
	}
	
	moveX = lengthdir_x(mov_spd,dir);
	moveY = lengthdir_y(mov_spd,dir);
	
	if place_meeting(x+moveX,y,obj_wall) == true {
		moveX = 0;
	}
	if place_meeting(x,y+moveY,obj_wall) == true {
		moveY = 0;	
	}
	
	x += moveX;
	y += moveY;
	
	switch(dir) {
		case 0:
			face = RIGHT;
			break;
		case 90:
			face = UP;
			break;
		case 180:
			face = LEFT;
			break;
		case 270:
			face = DOWN;
			break;
	}
}
else { image_index = 1; }

mask_index = sprite[face];
sprite_index = sprite[face];

depth = -bbox_bottom;