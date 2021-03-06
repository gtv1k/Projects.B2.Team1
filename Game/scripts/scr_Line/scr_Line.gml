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
	
	static Cast = function(_ctx)
	{
		var uA = 
			((_ctx.ending.x - _ctx.origin.x) * (self.origin.y - _ctx.origin.y) - (_ctx.ending.y - _ctx.origin.y) * (self.origin.x - _ctx.origin.x)) / 
			((_ctx.ending.y - _ctx.origin.y) * (self.ending.x - self.origin.x) - (_ctx.ending.x - _ctx.origin.x) * (self.ending.y - self.origin.y));
		
		var uB = 
			((self.ending.x - self.origin.x) * (self.origin.y - _ctx.origin.y) - (self.ending.y - self.origin.y) * (self.origin.x - _ctx.origin.x)) /
			((_ctx.ending.y - _ctx.origin.y) * (self.ending.x - self.origin.x) - (_ctx.ending.x - _ctx.origin.x) * (self.ending.y - self.origin.y));

		var areLinesIntersecting = (uA >= 0 and uA <= 1) and (uB >= 0 and uB <= 1);
		
		if (!areLinesIntersecting) return noone;
		
		return (origin).__add__(((ending).__sub__(origin)).__mul__(uA));
	}
	
	static CastAgainstLine = function(_ctx)
	{
		var uA = 
			((_ctx.ending.x - _ctx.origin.x) * (self.origin.y - _ctx.origin.y) - (_ctx.ending.y - _ctx.origin.y) * (self.origin.x - _ctx.origin.x)) / 
			((_ctx.ending.y - _ctx.origin.y) * (self.ending.x - self.origin.x) - (_ctx.ending.x - _ctx.origin.x) * (self.ending.y - self.origin.y));
		
		var uB = 
			((self.ending.x - self.origin.x) * (self.origin.y - _ctx.origin.y) - (self.ending.y - self.origin.y) * (self.origin.x - _ctx.origin.x)) /
			((_ctx.ending.y - _ctx.origin.y) * (self.ending.x - self.origin.x) - (_ctx.ending.x - _ctx.origin.x) * (self.ending.y - self.origin.y));

		var areLinesIntersecting = (uA >= 0 and uA <= 1) and (uB >= 0 and uB <= 1);
		
		if (!areLinesIntersecting) return noone;
		
		return (origin).__add__(((ending).__sub__(origin)).__mul__(uA));
	}
	
	static CastAgainstPathCollider = function(_ctx)
	{
		//TODO
	}
		
	#endregion
}

function HitInfo(_point, _normal, _distance) constructor
{
	self.point    = _point;
	self.normal   = _normal;
	self.distance = _distance;
}

function Raycast(_origin, _direction, _length = 10000)
{
	//TODO: Removed hardcoded collider!!!
	var _collider = new PathCollider(Path2);
	//_collider.Draw();
	
	var _end = (_origin).__add__((_direction).__mul__(_length));
	
	var _line = new Line(_origin, _end);
	
	var _count = array_length(_collider.vertices);

	var _closestDistance = infinity;
	var _closestResult   = noone;
	
	for(var _index = 1; _index < _count; _index += 1)
	{
		var _a = _collider.vertices[_index-1];
		var _b = _collider.vertices[_index  ];
	
		var _collider_line = new Line(_a, _b);
	
		var _result = _line.Cast(_collider_line);
	
		if(_result == noone) continue;
		
		var _distance = _origin.DistanceSquared(_result);
		if(_distance < _closestDistance) //only return the closest result.
		{
			_closestDistance = _distance;
			_closestResult = new HitInfo(/*point: */ _result, /*normal: */ _collider_line.PerpendicularNormal(), /*distance: */_closestDistance);
			//TODO: Closest normal
		}
	}
	
	if(_closestResult != noone)
	{
		_closestResult.distance = sqrt(_closestDistance);
		
		//Draw
		
		var _resultOrigin = _closestResult.point;
		var _resultNormal = _closestResult.normal;
		//var _resultEnding = (_closestResult.point).__add__((_closestResult.normal).__mul__(1 UNITS));
		
		Debug.DrawCircle(/*center: */ _resultOrigin, /*radius: */ 4, ,                                                       /*color: */ c_yellow, /*duration: */ 0.2);
		Debug.DrawNewRay(/*origin: */ _resultOrigin, /*direction: */ _resultNormal, /*length: */ 1 UNITS, /*thickness: */ 2, /*color: */ c_yellow, /*duration: */ 0.2);
		
		//Debug.DrawCircle(/*center: */ _closestResult.point, /*radius: */ 4, /*outline: */ false);
		//Debug.DrawLine(/*origin: */ _closestResult.point, /*ending: */ (_closestResult.normal).__mul__(1 UNITS));
		
		//draw_circle(_closestResult.point.x, _closestResult.point.y, /*radius: */ 4, /*outline: */ false);
		//var _normal = (_closestResult.normal).__mul__(1 UNITS);
		//draw_line_width(_closestResult.point.x, _closestResult.point.y, _closestResult.point.x + _normal.x, _closestResult.point.y + _normal.y, 2);
	}
	
	return _closestResult;
}