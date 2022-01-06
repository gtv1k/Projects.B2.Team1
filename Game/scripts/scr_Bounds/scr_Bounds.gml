function Bounds(__center = zero, __size = zero) constructor
{
	//x, y, width, height
	
	#region Constructor
	
	if(!is_struct(__center) or !is_struct(__size))
	{
		throw ("[ERROR] INVALID INPUT");
	}
	
	self._center  =  __center;
	self._size    =  __size;
	self._extents = (__size).__div__(2);

	self._min     = (_center).__sub__(_extents);
	self._max     = (_center).__add__(_extents);

	self._surfaceArea = (_size.x * _size.y);
	
	#endregion
	
	#region Properties
	
	static Min = function()
	{
		return _min;
	}
	static SetMin = function(__min)
	{
		self._min = __min;
		
		self._extents = ((_max).__sub__(_min)).__div__(2);
		self._center  =  (_min).__add__(_extents);
		self._size    =  (_extents).__mul__(2);
		
		self._surfaceArea = (_size.x * _size.y);

		return self;
	}
	
	
	static Max = function()
	{
		return _max;
	}
	static SetMax = function(__max)
	{
		self._max = __max;
		
		self._extents = ((_max).__sub__(_min)).__div__(2);
		self._center  =  (_min).__add__(_extents);
		self._size    =  (_extents).__mul__(2);
		
		self._surfaceArea = (_size.x * _size.y);

		return self;
	}
	
	static SetMinMax = function(__min, __max)
	{
		self._min = __min;
		self._max = __max;
		
    	self._extents = ((_max).__sub__(_min)).__div__(2);
    	self._center  =  (_min).__add__(_extents);
    	self._size    =  (_extents).__mul__(2);
    	
    	self._surfaceArea = (_size.x * _size.y);
    	
    	return self;
	}
	
	static Center = function()
	{
		return _center;
	}
	static SetCenter = function(__center)
	{
		self._center = __center;
		
		self._min = (_center).__sub__(_extents);
		self._max = (_center).__add__(_extents);
		
		return self;
	}
	
	
	static Extents = function()
	{
		return _extents;
	}
	static SetExtents = function(__extents)
	{
		self._extents = __extents;
		self._size    = (_extents).__mul__(2);
		
		self._surfaceArea = (_size.x * _size.y);
		
		return self;
	}
	
	
	static Size = function()
	{
		return _size;
	}
	static SetSize = function(__size)
	{
		self._size    = __size;
		self._extents = (_size).__div__(2);

		self._surfaceArea = (_size.x * _size.y);
		
		return self;
	}
	
	
	static Width = function()
	{
		return _size.x;
	}
	
	static Height = function()
	{
		return _size.y;
	}
	
	static SurfaceArea = function()
	{
		return _surfaceArea;
	}
	
	static Bottom = function()
	{
		return new vec2(_center.x, _min.y);
	}
	static Top = function()
	{
		return new vec2(_center.x, _max.y);
	}
	static Left = function()
	{
		return new vec2(_min.x, _center.y);
	}
	static Right = function()
	{
		return new vec2(_max.x, _center.y);
	}

	static BottomLeft = function()
	{
		return new vec2(_min.x, _min.y);
	}
	static BottomRight = function()
	{
		return new vec2(_max.x, _min.y);
	}
	static TopLeft = function()
	{
		return new vec2(_min.x, _max.y);
	}
	static TopRight = function()
	{
		return new vec2(_max.x, _max.y);
	}
	
	#endregion
	
	#region Functions
	
	static Shrink = function(__amount)
	{
		self._extents -= (__amount).__div__(2);

		return self;
	}
	
	static Grow = function(__amount)
	{
		self._extents += (__amount).__div__(2);

		return self;
	}
	
	static Draw = function()
	{	
		/*
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
		*/
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
	var _min = /*min*/ min(_a.Min(), _b.Min());
	var _max = /*max*/ max(_a.Max(), _b.Max());
	
	var _bounds = new Bounds();
	
	_bounds.SetMin(_min);
	_bounds.SetMax(_max);
	
	return _bounds;
}