function vec2(x = 0, y) constructor
{
	#region Constructor
	
	if (is_numeric(x) && is_numeric(y)) //(normal)
	{
		self.x = x;
		self.y = y;
		return;
	}
	if is_undefined(y) //has 1 input
	{
		if is_struct(x) //is vec2 (other)
		{
			self.x = x.x;
			self.y = x.y;
			return;
		}
		if is_numeric(x) //is number (scalar)
		{
			self.x = x;
			self.y = x;
			return;
		}
	}
	
	throw ("[ERROR] INVALID INPUT");
	
	//TODO: see if can throw error here instead?
	
	#endregion
	
	#region Swizzles
	
	//TODO: Swizzle variables
	
	static xy=function()
	{
		gml_pragma("forceinline");
		
		return new vec2(x, y);
	}
	static yx=function()
	{
		gml_pragma("forceinline");
		
		return new vec2(y, x);
	}
	static xx=function()
	{
		gml_pragma("forceinline");
		
		return new vec2(x, x);
	}
	static yy=function()
	{
		gml_pragma("forceinline");
		
		return new vec2(y, y);
	}
	
	#endregion
	
	#region Operators
	
	#region Arithmetic
	
	//Multiplication
	static __mul__=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			return new vec2((self.x * input.x), (self.y * input.y));
		}
		if is_numeric(input)
		{	
			return new vec2((self.x * input), (self.y * input));
		}
	
		throw ("Unexpected Argument!");
	}
	
	//Division
	static __div__=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			return new vec2((self.x / input.x), (self.y / input.y));
		}
		if is_numeric(input)
		{
			return new vec2((self.x / input), (self.y / input));
		}
	
		throw ("Unexpected Argument!");
	}
	
	
	//Addition
	static __add__=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			return new vec2((self.x + input.x), (self.y + input.y));
		}
		if is_numeric(input)
		{
			return new vec2((self.x + input), (self.y + input));
		}
	
		throw ("Unexpected Argument!");
	}
	
	//Subtraction
	static __sub__=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			return new vec2((self.x - input.x), (self.y - input.y));
		}
		if is_numeric(input)
		{	
			return new vec2((self.x - input), (self.y - input));
		}
	
		throw ("Unexpected Argument!");
	}
	
	
	//Remainder
	static __mod__=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			return new vec2((self.x % input.x), (self.y % input.y));
		}
		if is_numeric(input)
		{
			return new vec2((self.x % input), (self.y % input));
		}
	
		throw ("Unexpected Argument!");
	}
	
	//Dot Product
	static __dot__=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			return (self.x * input.x) + (self.y * input.y);
		}
		
		throw ("Unexpected Argument!");
	}
	
	//Negation
	static _neg=function()
	{
		gml_pragma("forceinline");
		
		return new vec2(-self.x, -self.y);
	}
	
	//Absolute Value, makes every axis a positive number. -5 becomes 5, 4 stays 4
	static _abs=function()
	{
		gml_pragma("forceinline");
		
		return new vec2(abs(self.x), abs(self.y));
	}
	
	#endregion
	
	#region Compound Arithmetic
	
	//Compound Multiplication
	//Same result as `value = value.__mul__(input);`
	static __c_mul__=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			self.x *= input.x;
			self.y *= input.y;
			return self;
		}
		if is_numeric(input)
		{	
			self.x *= input;
			self.y *= input;
			return self;
		}
	
		throw ("Unexpected Argument!");
	}
	
	//Compound Division
	//Same result as `value = value.__div__(input);`
	static __c_div__=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			self.x /= input.x;
			self.y /= input.y;
			return self;
		}
		if is_numeric(input)
		{	
			self.x /= input;
			self.y /= input;
			return self;
		}
	
		throw ("Unexpected Argument!");
	}
	
	
	//Compound Addition
	//Same result as `value = value.__add__(input);`
	static __c_add__=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			self.x += input.x;
			self.y += input.y;
			return self;
		}
		if is_numeric(input)
		{	
			self.x += input;
			self.y += input;
			return self;
		}
	
		throw ("Unexpected Argument!");
	}
	
	//Compound Subtraction
	//Same result as `value = value.__sub__(input);`
	static __c_sub__=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			self.x -= input.x;
			self.y -= input.y;
			return self;
		}
		if is_numeric(input)
		{	
			self.x -= input;
			self.y -= input;
			return self;
		}
	
		throw ("Unexpected Argument!");
	}
	
	
	//Compound Remainder
	//Same result as `value = value.__mod__(input);`
	static __c_mod__=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			self.x %= input.x;
			self.y %= input.y;
			return self;
		}
		if is_numeric(input)
		{	
			self.x %= input;
			self.y %= input;
			return self;
		}
	
		throw ("Unexpected Argument!");
	}
	
	
	//Compound Negation (kina bullshit, but why not)
	//Same result as `value = value._neg();`
	static _c_neg=function()
	{
		gml_pragma("forceinline");
		
		self.x = -self.x;
		self.y = -self.y;
		return self;
	}
	
	//Compound Absolute Value.
	//Same result as `value = value._abs();`
	static _c_abs=function()
	{
		gml_pragma("forceinline");
		
		self.x = abs(self.x);
		self.y = abs(self.y);
		return self;
	}
	
	#endregion
	
	#region Comparison
	
	//Is Equal To
	static __eq__=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			return new bool2((self.x == input.x), (self.y == input.y));
		}
		if is_numeric(input)
		{
			return new bool2((self.x == input),   (self.y == input));
		}
	
		throw ("Unexpected Argument!");
	}
	
	//Is Not Equal To
	static __ne__=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			return new bool2((self.x != input.x), (self.y != input.y));
		}
		if is_numeric(input)
		{
			return new bool2((self.x != input),   (self.y != input));
		}
	
		throw ("Unexpected Argument!");
	}
	
	
	//Is Less Than
	static __lt__=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			return new bool2((self.x < input.x), (self.y < input.y));
		}
		if is_numeric(input)
		{	
			return new bool2((self.x < input),   (self.y < input));
		}
	
		throw ("Unexpected Argument!");
	}
	
	//Is Greather Than
	static __gt__=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			return new bool2((self.x > input.x), (self.y > input.y));
		}
		if is_numeric(input)
		{	
			return new bool2((self.x > input),   (self.y > input));
		}
	
		throw ("Unexpected Argument!");
	}
	
	
	//Is Less Than Or Equal To
	static __le__=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			return new bool2((self.x <= input.x), (self.y <= input.y));
		}
		if is_numeric(input)
		{	
			return new bool2((self.x <= input),   (self.y <= input));
		}
	
		throw ("Unexpected Argument!");
	}
	
	//Is Greather Than Or Equal To
	static __ge__=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			return new bool2((self.x >= input.x), (self.y >= input.y));
		}
		if is_numeric(input)
		{
			return new bool2((self.x >= input),   (self.y >= input));
		}
	
		throw ("Unexpected Argument!");
	}
	
	#endregion
	
	#endregion
	
	#region Functions
	
	static Length=function()
	{
		gml_pragma("forceinline");
		
		return sqrt(LengthSquared());
	}
	
	static LengthSquared=function()
	{
		gml_pragma("forceinline");
		
		return (self).__dot__(self);
	}
	
	static Sqrt=function()
	{
		gml_pragma("forceinline");
		
		return new vec2(sqrt(self.x), sqrt(self.y));
	}
	
	static Normalized=function()
	{
		gml_pragma("forceinline");
		
		return (self).__mul__(1 / Length());
	}
	
	static Normalize=function()
	{
		gml_pragma("forceinline");
		
		var temp = self.Normalized();
		self.x = temp.x;
		self.y = temp.y;
		return self;
	}
	
	static Distance=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			return ((input).__sub__(self)).Length();
		}
	
		throw ("Unexpected Argument!");
	}
	
	static DistanceSquared=function(input)
	{
		gml_pragma("forceinline");
		
		if is_struct(input) //is vec2
		{
			return ((input).__sub__(self)).LengthSquared();
		}
	
		throw ("Unexpected Argument!");
	}
	
	static AsAngleDegrees=function()
	{
		gml_pragma("forceinline");
		
		//Normalize first.
		var norm_vector = new vec2(self.x, self.y).Normalized();
		
		return radtodeg(-arctan2(norm_vector.y, norm_vector.x));
	}
	
	static AsAngleRadians=function()
	{
		gml_pragma("forceinline");
		
		//Normalize first.
		var norm_vector = new vec2(self.x, self.y).Normalized();
		
		return -arctan2(norm_vector.y, norm_vector.x);
	}
	
	#endregion
}

#region Aliases

#region	Operators/Functions

#macro __equals__     __eq__
#macro __not_equals__ __ne__
	
#macro __lt_or_eq__ __le__
#macro __gt_or_eq__ __ge__
	
#macro __less_or_equals__    __le__
#macro __greater_or_equals__ __ge__
	
#macro __less_than_or_equal_to__    __le__
#macro __greater_than_or_equal_to__ __ge__

#endregion

#endregion

#region Defaults

//I couldn't figure out constants

#macro zero new vec2(0, 0)
#macro one  new vec2(1, 1)

#macro up    new vec2(0, -1)
#macro down  new vec2(0,  1)
#macro left  new vec2(-1, 0)
#macro right new vec2( 1, 0)

#macro vec2_zero new vec2(0, 0)
#macro vec2_one  new vec2(1, 1)

#macro vec2_up    new vec2(0,  1)
#macro vec2_down  new vec2(0, -1)
#macro vec2_left  new vec2(-1, 0)
#macro vec2_right new vec2( 1, 0)

#endregion

#region Functions

function AngleDegreesToVec2(angle) //-> vec2
{
	var angleradians = degtorad(angle);
	
	return new vec2(cos(angleradians), -sin(angleradians));
}

#endregion