event_inherited();

if (instance_exists(obj_controls)) {
	instance_destroy(obj_controls);
}
else {
	instance_create_layer(
		camera_get_view_width(view_camera[0]) / 2,
		camera_get_view_height(view_camera[0]) - 100,
		"Instances",
		obj_controls
	);
}