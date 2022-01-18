/// @description

sus = 5;

#macro cam view_camera[0]
#macro base_width  display_get_width()  / 5//320
#macro base_height display_get_height() / 5//180
current_width  = base_width
current_height = base_height

#macro center_window alarm[0]=1
#macro resize_window alarm[1]=1 

#macro resize_app_surface surface_resize(application_surface,current_width*sub_pixel_scale,current_height*sub_pixel_scale)

window_scale=10//3;
gui_scale=2;//1
sub_pixel_scale=window_scale;
is_full_screen=window_get_fullscreen();

instance_create_depth(0,0,-1000,obj_screen_fade);
resize_app_surface; 
resize_window;




