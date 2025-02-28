/// @description Read JSON file

var _name = "";//get_file(true,"challenge1.json");

if check_challenges_remains != 0 {
	if array_length(get_enemy_array()) > check_challenges_remains
		_name = get_file(true,"wait.json");
	else if array_length(get_enemy_array()) <= check_challenges_remains
		_name = get_file(true,file_name);
}
else {
	_name = get_file(true,file_name);
}

var _file = file_text_open_read(_name);

read_file = true;

var _json = "";

while(!file_text_eof(_file)) {
	_json += string_trim(file_text_read_string(_file));
	file_text_readln(_file);
}
file_text_close(_file);

_json = string_replace_all(_json,"\\t","    ");


var _data = json_parse(_json);

var _questions = array_create(0);
var _options = array_create(0);
var _answers = array_create(0);

for (var _i = 0; _i < array_length(_data.assessment); ++_i) {
	
	var _elem = _data.assessment[_i];
	
	// Trim Strings
	_elem.question = string_trim(_elem.question);
	for (var _j = 0; _j < array_length(_elem.options); ++_j)
		_elem.options[_j] = string_trim(_elem.options[_j]);
	_elem.answer = string_trim(_elem.answer);
	
	// Insert elements
	array_push(_questions,	_elem.question);
	array_push(_options,	_elem.options);
	array_push(_answers,	_elem.answer);
	
	var _final = array_create(0);
	array_push(_final, _questions[_i]);
	array_push(_final, _options[_i]);
	array_push(_final, _answers[_i]);
	array_push(assessment, _final);

}

show_debug_message(assessment);

damage_enemy = hp_enemy / array_length(assessment);
