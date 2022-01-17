/// @description Insert description here
// You can write your code in this editor

for(var index = 0; index < instance_number(oCapture); index ++)
{
	var inst = instance_find(oCapture, index);
	
	if(inst.name == capture_name)
	{
		instance_capture = inst;
		capture_width  = abs(inst.bbox_left   - inst.bbox_right);
		capture_height = abs(inst.bbox_bottom - inst.bbox_top);
		
		inst.visible = false;
	}
}

if(instance_capture != noone)
{
	if(surface_exists(surface_mirror) == false)
	{
		surface_mirror = surface_create(capture_width, capture_height);
	}
	surface_copy_part(surface_mirror, 0, 0, application_surface, instance_capture.x, instance_capture.y,capture_width, capture_height);
	//draw_surface(surface_mirror, x, y);
	draw_surface_ext(surface_mirror, x, y + capture_height, 1, -1, 0, c_white, 0.2)
}
else
{
	draw_self();
}