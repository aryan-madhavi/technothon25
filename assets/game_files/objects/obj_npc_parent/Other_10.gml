/// @description Get dialogues from file
var _file = file_text_open_read($"dialogues\\{category}\\{dialogue_file}");
var _i = 0; 

my_name = file_text_read_string(_file);
file_text_readln(_file);

while(!file_text_eof(_file)) {
    my_text[++_i] = file_text_read_string(_file);
    file_text_readln(_file);
}
file_text_close(_file);