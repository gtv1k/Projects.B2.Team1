function CharacterCollider(_position = new vec2(0, 0), _size = new vec2(1, 2), _lineSpacing = 0.1, _skinWidth = 0.25) constructor
{
	#region Constructor
	
	//var _line = new Line(zero, up);
	
	self.skinWidth = round(_skinWidth UNITS);
	
	//self.Position = _position;
	
	_size = (_size).__mul__(PIXELS_PER_UNIT); //convert to pixels.
	
	_lineSpacing = (_lineSpacing UNITS);
	
	//var _b_l = (_position).__add__(new vec2(-_size.x / 2, 0));
	//var _t_r = (_position).__add__(new vec2( _size.x / 2, _size.y));
	
	//self.bounds = new Bounds2D(_b_l, _t_r);
	
	//var _offset = new vec2(0, _size.y / 2);
	//var _center = (_position).__add__(_offset);
	
	self.bounds = new Bounds(/*center: */_position, /*size:*/_size);
	//self.shrunkBounds = self.bounds.Shrink(skinWidth);
	
	//TODO: Shoot rays (mostly) independently from bounds.
	
	self.horLineCount = round(bounds.Size().y / _lineSpacing);
    self.verLineCount = round(bounds.Size().x / _lineSpacing);
	//self._allLineCount = (horLineCount + verLineCount);
	
    self.horLineSpacing = (bounds.Size().y / (horLineCount - 1));
    self.verLineSpacing = (bounds.Size().x / (verLineCount - 1));
	
	//return;
	
	#endregion
	
	#region Functions
	
	static IsOnGround = function(_lineLength = 0)
	{
		//TODO: Check for jump velocity
		//TODO: Check Ground Angle.
		
		//return HasColBelow();
		
		return (CheckBelow(_lineLength) != noone);
	}
	
	static IsInAir = function(_lineLength = 0)
	{
		return (CheckBelow(_lineLength) == noone);
	}
	
	static HasColLeft = function(_lineLength = 8)
	{
		return (CheckLeft(_lineLength) != noone);
	}
	static HasColRight = function(_lineLength = 8)
	{
		return (CheckRight(_lineLength) != noone);
	}
	static HasColAbove = function(_lineLength = 8)
	{
		return (CheckAbove(_lineLength) != noone);
	}
	static HasColBelow = function(_lineLength = 8)
	{
		return (CheckBelow(_lineLength) != noone);
	}
	
	static SetPosition = function(_position)
	{
		//var _min = (bounds.Min()).__add__(_movement);
		//var _max = (bounds.Max()).__add__(_movement);
		
		//var _offset = new vec2(0, bounds.Size().y / 2);
		//var _center = (_position).__add__(_offset);
		
		bounds.SetCenter(_position);
		//shrunkBounds.SetCenter(_position);
		
		return self;
	}
	
	// Checks in direction of Horizontal movement.
	//
	// ← ┌────┐ →
	// ← │ or │ →
	// ← ╙────╜ →
	//
	static CheckHor = function(_velocity)
	{
		var _lineLength = abs(_velocity.x);

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
		var _rayOrigin = bounds.BottomLeft();
		
		var _hasAnyHit = false;
		
		var _hits = array_create(horLineCount, noone);
		for(var _index = 0; _index < horLineCount; _index += 1)
		{
			_hits[_index] = Raycast(/*origin: */ _rayOrigin, /*direction: */ left, /*distance: */ _lineLength + skinWidth);
			
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
		var _rayOrigin = bounds.BottomRight();
		
		var _hasAnyHit = false;
		
		var _hits = array_create(horLineCount, noone);
		for(var _index = 0; _index < horLineCount; _index += 1)
		{
			_hits[_index] = Raycast(/*origin: */ _rayOrigin, /*direction: */ right, /*distance: */ _lineLength + skinWidth);
			
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
		var _rayOrigin = bounds.TopLeft();
		
		var _hasAnyHit = false;
		
		var _hits = array_create(verLineCount, noone);
		for(var _index = 0; _index < verLineCount; _index += 1)
		{
			_hits[_index] = Raycast(/*origin: */ _rayOrigin, /*direction: */ up, /*distance: */_lineLength + skinWidth);
			
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
		var _rayOrigin = bounds.BottomLeft();
		
		var _hasAnyHit = false;
		
		var _hits = array_create(verLineCount, noone);
		for(var _index = 0; _index < verLineCount; _index += 1)
		{
			_hits[_index] = Raycast(/*origin: */ _rayOrigin, /*direction: */ down, /*distance: */ _lineLength + skinWidth);
			
			if(!_hasAnyHit)
			{
				_hasAnyHit = (_hits[_index] != noone);
			}
			
			_rayOrigin.x += verLineSpacing;
		}

		return (_hasAnyHit) ? _hits : noone;
	}
}