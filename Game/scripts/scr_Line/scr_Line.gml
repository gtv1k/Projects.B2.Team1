function Line(_origin, _ending) constructor
{
	#region Constructor
	
	if (is_struct(_origin) and is_struct(_ending)) //are vec2
	{
		self.origin = _origin;
		self.ending = _ending;
		return;
	}
	
	throw ("[ERROR] INVALID INPUT");
	
	#endregion
	
	#region Functions
	
	function Length()
	{
		return origin.Distance(ending);
	}
	function LengthSquared()
    {
        return origin.DistanceSquared(ending);
    }
	
	
	function Normalized()
    {
        var dir = ((ending).__sub__(origin)).Normalize();
        var new_ending = (origin).__add__(dir);
        
        return new Line(origin, new_ending);
    }
	
	#endregion
}