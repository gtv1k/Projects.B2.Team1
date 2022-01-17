


/// @description Zoom GUI / Detectc Fullscreen Switch
var _full=window_get_fullscreen();
if(is_full_screen != _full)
{
	instance_create_depth(0,0,-1000,obj_screen_fade);
	is_full_screen=_full;
	if(!is_full_screen)
	{	//Switching back from full screen.  Adjust window size.
		
		resize_window;
	}
}




