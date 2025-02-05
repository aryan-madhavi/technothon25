/// @description Get video stage

var _type = async_load[? "type"];


if (_type == "video_start")

{
    play = true;
	
	global.pause = true;
}

else if (_type == "video_end") {

    play = false;

    show_debug_message("CLOSED!");

    video_close();

    video = undefined; // Reset the video variable
	
	global.pause = false;
}