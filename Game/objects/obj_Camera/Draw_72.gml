/// @description Build MVP before drawing.

cameraPosition = new vec2(
	camera_get_view_x(camera) + (cameraSize.x / 2), 
	camera_get_view_y(camera) + (cameraSize.y / 2));

var _viewMatrix = matrix_build_lookat(
	/*xfrom: */cameraPosition.x, 
	/*yfrom: */cameraPosition.y, 
	/*zfrom: */cameraNearPlane,
	
	/*xto:   */cameraPosition.x, 
	/*yto:   */cameraPosition.y,  //-32
	/*yto:   */cameraFarPlane,
	
	/*xup:   */0, 
	/*yup:   */1, 
	/*zup:   */0);

var _projMatrix = matrix_build_projection_perspective_fov(
	/*fov:    */cameraFieldOfView, 
	/*aspect: */cameraAspectRatio, 
	/*znear:  */1, 
	/*zfar:   */32000);
	
camera_set_view_mat(camera, _viewMatrix);
camera_set_proj_mat(camera, _projMatrix);

camera_apply(camera);

	
//var _projMatrix = matrix_build_projection_perspective(
//	/*w:     */cameraSize.x,
//	/*h:     */cameraSize.y,
//	/*znear: */cameraNearPlane,
//	/*zfar:  */cameraFarPlane);