if obj_aariona.face = LEFT
	image_xscale = -1;	
else
	image_xscale = 1;
	
switch(obj_aariona.face) {
	case UP:	face = UP;			break;
	case DOWN:	face = DOWN;		break;
	case RIGHT:	face = SIDE;		break;
	case LEFT:	face = SIDE;	image_xscale = -1;	break;
}

sprite_index = sprite[face];

mp_potential_step(obj_aariona.pos_x[record], obj_aariona.pos_y[record],mov_spd,true);

//x = obj_aariona.pos_x[record];
//y = obj_aariona.pos_y[record];

depth = -bbox_bottom;