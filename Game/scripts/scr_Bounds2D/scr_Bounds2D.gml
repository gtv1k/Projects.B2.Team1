function Bounds2D(_min, _max) constructor
{
	//x, y, width, height
	
	#region Constructor
	
	if(is_struct(_min) and is_struct(_max)) //is vec2
	{
		self.Min = _min;
		self.Max = _max;
		
		self.Center  = ((Min).__add__(Max)).__div__(2);
		
		self.Size    =  (Max).__sub__(Min);
		self.Width   = Size.x;
		self.Height  = Size.y;
		
		self.Extents =  (Size).__div__(2);
		
		self.SurfaceArea = Width * Height;
		
		self.b_l = new vec2(Min.x, Max.y);
		self.b_r = new vec2(Max.x, Max.y);
		self.t_l = new vec2(Min.x, Min.y);
		self.t_r = new vec2(Max.x, Min.y);
		
		//Reload();

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
		draw_circle(Center.x, Center.y, 2, false)
		
		draw_set_color(c_red);
		draw_circle(Min.x, Min.y, 4, false);
		
		draw_set_color(c_blue);
		draw_circle(Max.x, Max.y, 4, false)
	}
	
	/*
	static Reload = function()
	{
		self.Center  = ((Min).__add__(Max)).__div__(2);
		
		self.Size    =  (Max).__sub__(Min);
		self.Width   = Size.x;
		self.Height  = Size.y;
		
		self.Extents =  (Size).__div__(2);
		
		self.SurfaceArea = Width * Height;
		
		self.b_l = new vec2(Min.x, Min.y);
		self.b_r = new vec2(Max.x, Min.y);
		self.t_l = new vec2(Min.x, Max.y);
		self.t_r = new vec2(Max.x, Max.y);
	}
	*/
	
	#endregion
}

// Combines two Bounds into one new one.
// ┌───┐              ╔═══┬───────┐
// │ A │              ║ A │       │
// └───┘   ┌───┐  ->  ├───┘ C ┌───┤
//         │ B │      │       │ B ║
//         └───┘      └───────┴═══╝
function BoundsUnion(_a, _b)
{
	return new Bounds2D(
		/*min*/ Min(_a.Min, _b.Min), 
		/*max*/ Max(_a.Max, _b.Max));
}