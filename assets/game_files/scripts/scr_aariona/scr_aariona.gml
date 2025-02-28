
#macro DOWN 0
#macro SIDE 1
#macro UP 2

enum STATE_AARIONA {
	IDLE,
	WALK,
	SPRINT,
}

last_room = noone;
xx = 0;
yy = 0;
face = 0;
state = 0;