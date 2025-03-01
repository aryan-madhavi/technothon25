
function pass() {}

function get_level_no() {
	var _level = 0;
	
	switch room {
		case rm_game:
		case rm_level_0:	_level = 0;	break;
		case rm_level_1:	_level = 1;	break;
		case rm_level_2:	_level = 2;	break;
		case rm_level_3:	_level = 3;	break;
		case rm_level_4:	_level = 4;	break;
		case rm_level_5:	_level = 5;	break;
		case rm_level_6:	_level = 6;	break;
		case rm_level_7:	_level = 7;	break;
		case rm_level_8:	_level = 8;	break;
	}
	
	return int64(_level);
	
}

function user_save(_level,_challenge) {
	
	if _level != global.user_current_level {
		global.user_current_level = _level;
		global.user_completed = "";
	}
	
	global.user_completed = string_concat(global.user_completed,_challenge, " ");
	
	update_save(global.user_current_level,string_trim(global.user_completed))
}

function get_level_struct() {
	
	var _struct = global.levels;
	
	return _struct[get_level_no()];
	
}

function get_file(_is_enemy, _file) {

	if _file == "wait.json" or _file == "continue.json"
		return $"common\\{_file}";
		
	var _struct = get_level_struct();
	var _root = "";
	
	_root = _struct.home;
	
	_struct = _is_enemy ? _struct.enemies : _struct.allies;

	_root = _root + _struct.path + _file;
		
	return _root;
	
}

function get_enemy_array() {
	
	var _struct = get_level_struct();
	
	_struct = _struct.enemies.files;
		
	return _struct;
	
}