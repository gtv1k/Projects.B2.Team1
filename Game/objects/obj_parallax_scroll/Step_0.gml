

var _cam_x = camera_get_view_x(view_camera[0]) ;

layer_x("Background_Closest", _cam_x * 0.4); // Change the background layer name to whatever you use in the room editor
layer_x("Background_Mid_Close", _cam_x * 0.45);   // Change the 0.25 and 0.5 values to change the speed of the effect
layer_x("Background_Mid_Far", _cam_x * 0.5);   // Change the 0.25 and 0.5 values to change the speed of the effect
layer_x("Background_Furthest", _cam_x * 0.55);   // Change the 0.25 and 0.5 values to change the speed of the effect
layer_x("Background_Buildings", _cam_x * 0.6);   // Change the 0.25 and 0.5 values to change the speed of the effect