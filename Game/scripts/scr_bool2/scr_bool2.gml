function bool2(x = false, y = false) constructor
{
    self.x = x;
	self.y = y;
	
	#region Operators
	
	//Is Equal To
	static __eq__=function(input)
	{
		var result = new bool2();
		
		if is_struct(input) //is bool2
		{
			result.x = (self.x == input.x);
			result.y = (self.y == input.y);
		}
		else //is bool
		{	
			result.x = (self.x == input);
			result.y = (self.y == input);
		}
	
		return result;
	}
	
	//Is Not Equal To
	static __ne__=function(input)
	{
		var result = new bool2();
		
		if is_struct(input) //is bool2
		{
			result.x = (self.x != input.x);
			result.y = (self.y != input.y);
		}
		else //is bool
		{	
			result.x = (self.x != input);
			result.y = (self.y != input);
		}
	
		return result;
	}
	
	
	//Component-wise NOT operation
	static __not__=function()
	{
		return new bool2(!self.x, !self.y);
	}
	
	#endregion
	
	#region Functions
	
	//Returns true if any component is true, false otherwise.
	static _any=function()
	{
		return (self.x || self.y);
	}
	
	//Returns true if all components are true, false otherwise.
	static _all=function()
	{
		return (self.x && self.y);
	}
	
	#endregion
}