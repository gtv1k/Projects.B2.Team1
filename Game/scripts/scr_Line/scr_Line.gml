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
	
	static Length = function()
	{
		return origin.Distance(ending);
	}
	static LengthSquared = function()
    {
        return origin.DistanceSquared(ending);
    }
	
	static Center = function()
	{
		return ((origin).__add__(ending)).__div__(2);
	}
	
	static DirectionVector = function()
    {
        return ((ending).__sub__(origin)).Normalize();
    }
	
	static Normalized = function()
    {
        var dir = self.DirectionVector();
        var new_ending = (origin).__add__(dir);
        
        return new Line(origin, new_ending);
    }
    static Normalize = function()
    {
        var dir = self.DirectionVector();
        self.ending = (origin).__add__(dir);
        
        return self;
    }
	
	static PerpendicularNormal = function(_clockwise = true)
    {
        var dir = self.DirectionVector();
        
        return (_clockwise) ? new vec2(dir.y, -dir.x) : new vec2(-dir.y, dir.x);
    }
    
	//Perpendicular Normal, scaled to the Line's Length.
    static PerpendicularVector = function(_clockwise = true)
    {
        var norm = self.PerpendicularNormal(_clockwise);
        
        return (norm).__mul__(self.Length());
    }
    
	//Construct a new line from the perpendicular vector.
    static PerpendicularLine = function(_clockwise = true)
    {
        var perp = self.PerpendicularVector(_clockwise);
    
        var new_ending = (origin).__add__(perp);
        
        return new Line(origin, new_ending);
    }
	
	#endregion
}