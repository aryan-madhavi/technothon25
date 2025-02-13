
levels = {
	level_1 : {
		rm : rm_level_1,
		home : "level1\\",
		enemies : {
			path : "assessments\\",
			files : ["final_boss.txt"],	
		},
		allies : {
			path : "dialogues\\",
			files : ["friend_intro.txt","friend_intro_bot_name.txt","friend_intro_zenon.txt","friend_intro_nexis.txt",],	
		}
	},	
}


function get_file(_is_enemy, _file) {
	
	var _struct = global.levels;
	var _root = "";
	
	switch room {
		case rm_level_1:
			_struct = _struct.level_1;
	}
	
	_root = _struct.home;
	
	_struct = _is_enemy ? _struct.enemies : _struct.allies;
	
	_root = _root + _struct.path + _file;
		
	return _root;
	
}

function pass() {}