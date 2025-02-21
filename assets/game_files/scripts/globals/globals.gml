
#macro DOWN 0
#macro SIDE 1
#macro UP 2

enum STATE_AARIONA {
	IDLE,
	WALK,
	SPRINT,
}


// Game State
pause = false;
battle = false;
current_battler_id = noone;

// Sound
master_vol = 1;
music_vol = 1;