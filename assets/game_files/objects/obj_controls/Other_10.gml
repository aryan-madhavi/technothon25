/// @description Read controls.txt file

var _file = file_text_open_read("common\\controls.txt");
var _i = 0; 

while(!file_text_eof(_file)) {
	my_text[_i++] = file_text_read_string(_file);
    file_text_readln(_file);
}
file_text_close(_file);