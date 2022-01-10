camera = view_camera[0];

cameraSize = new vec2(camera_get_view_width(camera), camera_get_view_height(camera));

//mutable
cameraPosition = new vec2(
	camera_get_view_x(camera) + (cameraSize.x / 2), 
	camera_get_view_y(camera) + (cameraSize.y / 2));

cameraAspectRatio = (cameraSize.x / cameraSize.y);