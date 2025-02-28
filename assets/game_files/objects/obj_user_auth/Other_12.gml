/// @description Set bots as defeated according to user_level


var _user_level = get_level();
var _user_completed = get_completed();


for (var _i = 1; _i < _user_level; ++_i) {

	global.levels[_i].enemies.files = [];

}

var _level_arr = global.levels[_user_level].enemies.files;
var _completed_arr = string_split(_user_completed," ");

for (var _i = 0; _i < array_length(_completed_arr); ++_i) {

	if array_contains(_level_arr,_completed_arr[_i]) {
	
		var _pos = array_get_index(_level_arr,_completed_arr[_i]);
	
		array_delete(_level_arr,_pos,1)
	
	}

}




