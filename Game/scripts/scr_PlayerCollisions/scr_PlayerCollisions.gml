function PlayerCollisions(_position = new vec2(0, 0)) constructor
{
	self.c_above = false;
	self.c_below = false;
	self.c_left  = false;
	self.c_right = false;
	
	self.isOnGround = false;
	
	self.groundAngle  = 0;
	self.groundVector = up;
	
	self.position = _position;
	
	var _lineSpacing = 0.1;
	
	var _topRight = new vec2(1 * PIXELS_PER_UNIT, 2 * PIXELS_PER_UNIT);
	
	self.bounds = new Bounds(position, (position).__add__(_topRight));
	
	var _horLineCount = round(bounds.size.y / _lineSpacing);
    var _verLineCount = round(bounds.size.x / _lineSpacing);
	
	var _totalLineCount = (_horLineCount + _verLineCount);
	
    var _horLineSpacing = (bounds.size.y / (_horLineCount - 1));
    var _verLineSpacing = (bounds.size.x / (_verLineCount - 1));
	
	var _horLines = array_create(_horLineCount);
	
	static CheckAllDirections = function()
	{
		CheckHorizontal();
		CheckVertical();
	}
	
	static CheckHorizontal = function()
	{
		CheckLeft();
		CheckRight();
	}
	
	static CheckVertical = function()
	{
		CheckTop();
		CheckBottom();
	}
	
	
	// ← ┌─────┐
	// ← ˄     │
	// ← ╙─────┘
	static CheckLeft = function()
	{
		var _rayOrigin = bounds.b_l;
		for(var _index = 0; _index < _horLineCount; _index += 1)
		{
			_rayOrigin.y += _horLineSpacing;
			
		}
	}
	
	//  ↑↑↑↑↑↑↑
	//  ┌══>──┐
	//  │     │
	//  └─────┘
	static CheckTop = function()
    {
		var _rayOrigin = bounds.t_l;
		
		for(var _index = 0; _index < _verLineCount; _index += 1)
		{
			_rayOrigin.x += _verLineSpacing;
			
		}
	}
	
	//  ┌─────╖ →
	//  │     ˅ →
	//  └─────┘ →
	static CheckRight = function()
	{
		var _rayOrigin = bounds.t_r;
		for(var _index = 0; _index < _horLineCount; _index += 1)
		{
			_rayOrigin.y -= _horLineSpacing;
			
		}
	}
	
	//  ┌─────┐
	//  │     │
	//  └──<══┘
	//  ↓↓↓↓↓↓↓
	static CheckBottom = function()
    {
		var _rayOrigin = bounds.b_r;
		
		for(var _index = 0; _index < _verLineCount; _index += 1)
		{
			_rayOrigin.x -= _verLineSpacing;
			
		}
	}
}