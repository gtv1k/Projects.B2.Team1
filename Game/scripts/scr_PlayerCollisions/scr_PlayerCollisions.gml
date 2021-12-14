function PlayerCollisions()
{
	c_above = false;
	c_below = false;
	c_left  = false;
	c_right = false;
	
	isOnGround = false;
	
	groundAngle  = 0;
	groundVector = up;
	
	
	var _lineSpacing = 0.1;
	
	bounds = new Bounds(new vec2(0, 0), new vec2(1, 2));
	
	var _horLineCount = round(bounds.size.y / _lineSpacing);
    var _verLineCount = round(bounds.size.x / _lineSpacing);
	
	var _totalLineCount = (_horLineCount + _verLineCount);
	
    var _horLineSpacing = (bounds.size.y / (_horLineCount - 1));
    var _verLineSpacing = (bounds.size.x / (_verLineCount - 1));
	
	static CheckGround = function(_isGoingRight)
    {
		for(var _index = 0; _index < _horLineCount; _index += 1)
		{
			var _origin = (_isGoingRight) ? bounds.b_r : bounds.b_l;
			
			_origin = (_origin).__add__(_hor)
		}
	}
	
}