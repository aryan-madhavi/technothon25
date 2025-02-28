state = STATE_AARIONA.IDLE;

xpsd = 0;
yspd = 0;

mov_spd = 1;

face = DOWN;

sprite[SIDE] = spr_aariona_walk_side;
sprite[UP] = spr_aariona_walk_up;
sprite[DOWN] = spr_aariona_walk_down;

room_start = function() {
	
	event_perform(ev_other,ev_room_start);
	
}