function Bounds(_min, _max) constructor
{
	//x, y, width, height
	
	#region Constructor
	
	if(is_struct(_min) and is_struct(_max)) //is vec2
	{
		self.Min = _min;
		self.Max = _max;
		
		self.center  = ((_min).__add__(_max)).__div__(2);
		
		self.size    =  (_max).__sub__(_min);
		
		self.extents =  (size).__div__(2);
		
		self.b_l = new vec2(Min.x, Min.y);
		self.b_r = new vec2(Max.x, Min.y);
		self.t_r = new vec2(Max.x, Max.y);
		self.t_l = new vec2(Min.x, Max.y);
		
		show_debug_message("b_l" + string(b_l));
		show_debug_message("b_r" + string(b_r));
		show_debug_message("t_r" + string(t_r));
		show_debug_message("t_l" + string(t_l));

		return;
	}
		
	throw ("[ERROR] INVALID INPUT");
	
	#endregion
	
	#region Functions
	
	static Draw = function()
	{	
		draw_set_color(c_aqua);
		draw_line_width(b_l.x, b_l.y, b_r.x, b_r.y, 1);
		draw_line_width(b_r.x, b_r.y, t_r.x, t_r.y, 1);
		draw_line_width(t_r.x, t_r.y, t_l.x, t_l.y, 1);
		draw_line_width(t_l.x, t_l.y, b_l.x, b_l.y, 1);
		
		draw_set_color(c_gray);
		draw_circle(center.x, center.y, 2, false)
		
		draw_set_color(c_red);
		draw_circle(Min.x, Min.y, 4, false);
		
		draw_set_color(c_blue);
		draw_circle(Max.x, Max.y, 4, false)
	}
	
	#endregion
}