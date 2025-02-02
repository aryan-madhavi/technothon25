/// @description Get video stage

var _type = async_load[? "type"];


if (_type == "video_start")

{
    play = true;
	instance_create_layer(x,y,"Instances",obj_pauser);

}

else if (_type == "video_end") {

    play = false;

    show_debug_message("CLOSED!");

    video_close();

    video = undefined; // Reset the video variable
	
	instance_destroy(obj_pauser);
}