/// @description Get dialogues from file

var _file = file_text_open_read($"{get_file(false, dialogue_file)}");
var _i = 0; 

my_name = file_text_read_string(_file);
file_text_readln(_file);

var _page_text = "";

while(!file_text_eof(_file)) {
	var _s = string_trim(file_text_read_string(_file));
    
	switch _s {
		
		case "@START":
			_page_text = "";
			break;
			
		case "@END":
			my_text[_i++] = _page_text;
			break;
			
		default:
			_s = string_replace(_s,"\\t","    ");
			_page_text = string_concat(_page_text,_s,"\n");
			break;
		
	}
	
	file_text_readln(_file);
}

//show_debug_message(my_text);

file_text_close(_file);