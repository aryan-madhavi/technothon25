// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_sendgpt(_question){
	
	var _file = file_text_open_read("KEYS.txt");
	var _a = file_text_read_string(_file);
	file_text_close(_file);
	
	var _map = ds_map_create();
	ds_map_add(_map, "Authorization", "Bearer " + $"sk-{_a}");
	ds_map_add(_map, "Content-Type", "application/json");

    var _curl = {
					"model": "gpt-4o-mini",
					"messages": [
			            {
			                "role": "developer",
			                "content": "Your name is 'Riruru'. You are a helpful AI robot that has to help the user to defeat the rogue AI robots. Be extremely concise. Answer within 100 words. Ensure the response is in plain text without any Markdown or special formatting. If asked about exiting, respond by asking the to hit 'F1' key. "
			            },
			            {
			                "role": "user",
			                "content": _question,
			            }
			        ],
					//"max_tokens": int64(300),
					"temperature": 0.6,
					//"n": int64(4),
			    }
	/*var _curl = {
					"model": "text-daVinco-03",
					"prompt": "Write a haiku about recursion in programming",
					"max_tokens": int64(30),
					"temperature": 0.6,
					"n": int64(4),
				};*/
			
	var _data = json_stringify(_curl);


	request = http_request("https://api.openai.com/v1/chat/completions", "POST", _map, _data);
	
	display_string = "Thinking...";

	show_debug_message("Request Sent");
	show_debug_message(request);
	show_debug_message(_data);

	ds_map_destroy(_map);

}