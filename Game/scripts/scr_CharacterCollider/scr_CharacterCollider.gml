function CharacterCollider(_position = new vec2(0, 0), _size = new vec2(1, 2), _lineSpacing = 0.1) constructor
{
	#region Constructor
	
	//var _line = new Line(zero, up);
	
	self.SkinWidth = 0.2 UNITS;
	
	//self.Position = _position;
	
	_size = (_size).__mul__(PIXELS_PER_UNIT); //convert to pixels.
	
	_lineSpacing = _lineSpacing UNITS;
	
	var _b_l = (_position).__add__(new vec2(-_size.x / 2, 0));
	var _t_r = (_position).__add__(new vec2( _size.x / 2, _size.y));
	
	self.bounds = new Bounds2D(_b_l, _t_r);
	
	self.horLineCount = round(bounds.Size.y / _lineSpacing);
    self.verLineCount = round(bounds.Size.x / _lineSpacing);
	self._allLineCount = (horLineCount + verLineCount);
	
    self.horLineSpacing = (bounds.Size.y / (horLineCount - 1));
    self.verLineSpacing = (bounds.Size.x / (verLineCount - 1));
	
	//return;
	
	#endregion
	
	static IsOnGround = function()
	{
		return HasColBelow();
	}
	
	static IsInAir = function()
	{
		return !HasColBelow();
	}
	
	static HasColLeft = function()
	{
		return (CheckLeft() != noone);
	}
	static HasColRight = function()
	{
		return (CheckRight() != noone);
	}
	static HasColAbove = function()
	{
		return (CheckAbove() != noone);
	}
	static HasColBelow = function()
	{
		return (CheckBelow() != noone);
	}
	
	static Translate = function(_movement)
	{
		var _min = (bounds.Min).__add__(_movement);
		var _max = (bounds.Max).__add__(_movement);
		
		bounds = new Bounds2D(_min, _max);
	}
	
	// Checks in direction of Horizontal movement.
	//
	// ← ┌────┐ →
	// ← │ or │ →
	// ← ╙────╜ →
	//
	static CheckHor = function(_velocity)
	{
		var _lineLength = abs(_velocity.x) + SkinWidth;

		var _isGoingRight = (_velocity.x > 0);

		return (_isGoingRight) ? CheckRight(_lineLength) : CheckLeft(_lineLength);
	}
	
	//
	// ← ┌────┐
	// ← │    │
	// ← ╙────┘
	//
	static CheckLeft = function(_lineLength = 8)
	{
		var _rayOrigin = bounds.b_l;
		
		var _hasAnyHit = false;
		
		var _hits = array_create(horLineCount, noone);
		for(var _index = 0; _index < horLineCount; _index += 1)
		{
			_hits[_index] = Raycast(/*origin: */ _rayOrigin, /*direction: */ left, /*distance: */ _lineLength);
			
			if(!_hasAnyHit)
			{
				_hasAnyHit = (_hits[_index] != noone);
			}
			
			_rayOrigin.y -= horLineSpacing;
		}

		return (_hasAnyHit) ? _hits : noone;
	}
	
	//
	//   ┌────┐ →
	//   │    │ →
	//   └────╜ →
	//
	static CheckRight = function(_lineLength = 8)
	{
		var _rayOrigin = bounds.b_r;
		
		var _hasAnyHit = false;
		
		var _hits = array_create(horLineCount, noone);
		for(var _index = 0; _index < horLineCount; _index += 1)
		{
			_hits[_index] = Raycast(/*origin: */ _rayOrigin, /*direction: */ right, /*distance: */ _lineLength);
			
			if(!_hasAnyHit)
			{
				_hasAnyHit = (_hits[_index] != noone);
			}
			
			_rayOrigin.y -= horLineSpacing;
		}

		return (_hasAnyHit) ? _hits : noone;
	}
	
	//   ↑↑↑↑↑↑
	//   ╒────┐
	//   │    │ 
	//   └────┘ 
	//
	static CheckAbove = function(_lineLength = 8)
    {
		var _rayOrigin = bounds.t_l;
		
		var _hasAnyHit = false;
		
		var _hits = array_create(verLineCount, noone);
		for(var _index = 0; _index < verLineCount; _index += 1)
		{
			_hits[_index] = Raycast(/*origin: */ _rayOrigin, /*direction: */ up, /*distance: */_lineLength);
			
			if(!_hasAnyHit)
			{
				_hasAnyHit = (_hits[_index] != noone);
			}
			
			_rayOrigin.x += verLineSpacing;
		}

		return (_hasAnyHit) ? _hits : noone;
	}
	
	//
	//   ┌────┐
	//   │    │ 
	//   ╘────┘ 
	//   ↓↓↓↓↓↓
	static CheckBelow = function(_lineLength = 8)
    {
		var _rayOrigin = bounds.b_l;
		
		var _hasAnyHit = false;
		
		var _hits = array_create(verLineCount, noone);
		for(var _index = 0; _index < verLineCount; _index += 1)
		{
			_hits[_index] = Raycast(/*origin: */ _rayOrigin, /*direction: */ down, /*distance: */ _lineLength);
			
			if(!_hasAnyHit)
			{
				_hasAnyHit = (_hits[_index] != noone);
			}
			
			_rayOrigin.x += verLineSpacing;
		}

		return (_hasAnyHit) ? _hits : noone;
	}
}