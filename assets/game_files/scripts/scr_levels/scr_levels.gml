
levels = [
	{
		rm : rm_level_0,
		home : "",
		enemies : {
			path : "",
			files : [],	
		},
		allies : {
			path : "",
		}
	},	
	{
		rm : rm_level_1,
		home : "level1\\",
		enemies : {
			path : "assessments\\",
			files : ["challenge1.json", "challenge2.json", "challenge3.json"],	
		},
		allies : {
			path : "dialogue\\",
		}
	},
	{
		rm : rm_level_2,
		home : "level2\\",
		enemies : {
			path : "assessments\\",
			files : ["challenge1.json", "challenge2.json", "challenge3.json"],	
		},
		allies : {
			path : "dialogue\\",
		}
	},
	{
		rm : rm_level_3,
		home : "level3\\",
		enemies : {
			path : "assessments\\",
			files : ["challenge1.json", "challenge2.json"],	
		},
		allies : {
			path : "dialogue\\",
		}
	},
	{
		rm : rm_level_4,
		home : "level4\\",
		enemies : {
			path : "assessments\\",
			files : ["challenge1.json", "challenge2.json", "challenge3.json"],	
		},
		allies : {
			path : "dialogue\\",
		}
	},
];

function get_level() {
	
	var _struct = global.levels;
	
	switch room {
		case rm_game:
		case rm_level_0:	_struct = _struct[0];	break;
		case rm_level_1:	_struct = _struct[1];	break;
		case rm_level_2:	_struct = _struct[2];	break;
		case rm_level_3:	_struct = _struct[3];	break;
		case rm_level_4:	_struct = _struct[4];	break;
	}
	
	return _struct;
	
}

function get_file(_is_enemy, _file) {
	
	if _file == "wait.json" or _file == "continue.json"
		return $"common\\{_file}";
	
	var _struct = get_level();
	var _root = "";
	
	_root = _struct.home;
	
	_struct = _is_enemy ? _struct.enemies : _struct.allies;
	
	_root = _root + _struct.path + _file;
		
	return _root;
	
}

function get_enemy_array() {
	
	var _struct = get_level();
	
	_struct = _struct.enemies.files;
		
	return _struct;
	
}

function pass() {}