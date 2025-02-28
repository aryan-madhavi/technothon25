/// @description Set bots as defeated according to user_level


var _user_level = get_level();
var _user_completed = get_completed();

global.user_current_level = _user_level;
global.user_completed = _user_completed + " ";

if _user_level == 0
	exit;

for (var _i = 1; _i < _user_level; ++_i) {

	global.levels[_i].enemies.files = [];

}

var _level_arr = global.levels[_user_level].enemies.files;

var _completed_arr = string_split(_user_completed," ");
show_debug_message(global.user_completed)

for (var _i = 0; _i < array_length(_completed_arr); ++_i) {
	show_debug_message(array_contains(global.levels[_user_level].enemies.files,_completed_arr[_i]));
	
	if array_contains(global.levels[_user_level].enemies.files,_completed_arr[_i]) {
	
		var _pos = array_get_index(global.levels[_user_level].enemies.files,_completed_arr[_i]);
		show_debug_message(global.levels[_user_level].enemies.files[_pos]);
		array_delete(global.levels[_user_level].enemies.files,_pos,1)
	
	}

}




