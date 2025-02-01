switch(obj_aariona.face) {
	case UP:	face = UP;			break;
	case DOWN:	face = DOWN;		break;
	case SIDE:	face = SIDE;	image_xscale = obj_aariona.image_xscale;	break;
}

//mov_spd = obj_aariona.mov_spd-1;

mask_index = sprite[face];
sprite_index = sprite[face];

mp_potential_step_object(obj_aariona.pos_x[record], obj_aariona.pos_y[record],mov_spd,obj_wall);

//x = obj_aariona.pos_x[record];
//y = obj_aariona.pos_y[record];

depth = -bbox_bottom;