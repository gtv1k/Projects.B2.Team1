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
	_size.y = -_size.y;
	
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
	
	static BL = function()
	{
		return new vec2(_min.x, _min.y);
	}
	static BR = function()
	{
		return new vec2(_max.x, _min.y);
	}
	static TL = function()
	{
		return new vec2(_min.x, _max.y);
	}
	static TR = function()
	{
		return new vec2(_max.x, _max.y);
	}
	
	#endregion
	
	#region Functions
	
	static Shrink = function(__amount)
	{
		__amount = (__amount).__div__(2);
		
		SetExtents((_extents).__sub__(__amount));

		return self;
	}
	
	static Grow = function(__amount)
	{
		__amount = (__amount).__div__(2);
		
		SetExtents((_extents).__add__(__amount));

		return self;
	}
	
	static Shrink = function(__amount)
	{
		if(is_numeric(__amount))
		{
			__amount /= 2;
		}
		else if(is_struct(_amount))
		{
			__amount = (__amount).__div__(2);
		}
		else
		{
			throw "InvalidArgumentException";
		}
		
		var __size = (_size).__sub__(__amount);
		
		return new Bounds(_center, __size);
	}
	
	static NewGrown = function(__amount)
	{
		/*
		__amount = (__amount).__div__(2);
		
		var __size = (_size).__add__(__amount);
		
		return new Bounds(_center, __size);
		*/
		
		if(is_numeric(__amount))
		{
			__amount /= 2;
		}
		else if(is_struct(__amount))
		{
			__amount = (__amount).__div__(2);
		}
		else
		{
			throw "InvalidArgumentException";
		}
		
		var __size = (_size).__add__(__amount);
		
		return new Bounds(_center, __size);
	}
	
	static Draw = function()
	{
		Debug.DrawNewLine(BL(), BR(), 2, c_aqua);
		Debug.DrawNewLine(BR(), TR(), 2, c_aqua);
		Debug.DrawNewLine(TR(), TL(), 2, c_aqua);
		Debug.DrawNewLine(TL(), BL(), 2, c_aqua);
		
		
		Debug.DrawCircle(/*center: */Center(), /*radius: */4, /*doOutline: */false, /*color: */ c_grey);
		
		Debug.DrawCircle(/*center: */BL(), /*radius: */4, /*doOutline: */false, /*color: */ c_black);
		Debug.DrawCircle(/*center: */TL(), /*radius: */4, /*doOutline: */false, /*color: */ c_lime);
		Debug.DrawCircle(/*center: */BR(), /*radius: */4, /*doOutline: */false, /*color: */ c_red);
		Debug.DrawCircle(/*center: */TR(), /*radius: */4, /*doOutline: */false, /*color: */ c_yellow);
	}
	
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