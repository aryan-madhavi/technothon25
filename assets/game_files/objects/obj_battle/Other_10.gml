/// @description Read Assesment file

//_name = get_file(true, (array_length(get_enemy_array()) > check_challenges_remains and check_challenges_remains != 0) ? "challenge0.txt" : file__name)

//_name = get_file(true, not (array_length(get_enemy_array()) > check_challenges_remains and check_challenges_remains != 0) ? "challenge0.txt" : "continue.txt")

var _name = "";

if check_challenges_remains != 0 {
	if array_length(get_enemy_array()) > check_challenges_remains
		_name = get_file(true,"challenge0.txt");
	else if array_length(get_enemy_array()) == check_challenges_remains
		_name = get_file(true,"continue.txt");
}
else {
	_name = get_file(true,file_name);
}

var _file = file_text_open_read($"{_name}");

read_file = true;

var _questions = array_create(0);
var _options = array_create(0);
var _answers = array_create(0);

var _option = array_create(0);

while(!file_text_eof(_file)) {
    
	var _s = file_text_read_string(_file);
	var _type = string_char_at(_s,0);
	_s = string(string_trim(string_copy(_s,4,string_length(_s))));
	
	switch _type {
		
		case "Q":
			if _options != [] {
				array_push(_options,_option);
			}
			array_push(_questions,_s);
			break;

		case "A":
			_option = [];
			array_push(_answers,_s);
			break;

		case "O":
		case " ":
			array_push(_option,_s);
			break;
			
	}
	
	file_text_readln(_file);
}

file_text_close(_file);

var _final = array_create(0);
for (var _i = 0; _i < array_length(_questions); ++_i) {
	array_push(_final, _questions[_i]);
	array_push(_final, _options[_i]);
	array_push(_final, _answers[_i]);
	array_push(assessment, _final);
	_final = [];
}

show_debug_message(" ");
show_debug_message(assessment);

damage_enemy = hp_enemy / array_length(assessment);