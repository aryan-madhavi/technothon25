/// @description 

event_inherited();

if (play) {
	
    if (!video_loaded) {

        // Check if a video is already loaded or playing, close it before loading a new one

        if (video != undefined && (video_get_status() == video_status_playing || video_get_status() == video_status_preparing)) {

            video_close();

            video = undefined; // Reset the video variable

        } else {

            video = video_open($"video\\{video_file}");

            video_enable_loop(false);

            video_loaded = true;

        }

    } else {

		audio_pause_all();

        var videoData = video_draw();

        var videoStatus = videoData[0];

        if (videoStatus == 0) {

            draw_surface_ext(
				videoData[1],0,0,
				camera_get_view_width(view_camera[0]) / 1024,	//800/1024,
				camera_get_view_height(view_camera[0]) / 768,	//600/768,
				0,c_white,1
			);	

        }

    }

} else {

    if (video_loaded) {

        if (video != undefined) {

            video_close();

            video = undefined; // Reset the video variable

        }

        video_loaded = false;

    }
	
	audio_resume_all();
	
}

/*
if not (inside and action and play) {
	video = video_close();
	video = noone;
	exit;
}

play = false;
video = video_open($"video\\{video_file}");
video_enable_loop(false);
var _video_data = video_draw();
var _video_status = _video_data[0];

if _video_status == 0 {
	draw_surface_ext(
		_video_data[1],0,0,
		camera_get_view_width(view_camera[0]) / 1024,	//800/1024,
		camera_get_view_height(view_camera[0]) / 768,	//600/768,
		0,c_white,1
	);	
}