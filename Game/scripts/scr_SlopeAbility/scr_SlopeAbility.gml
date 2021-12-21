function SlopeAbility(_character) : Ability(_character) constructor
{
	#region Constructor
	
	self.maxSlopeAngle = 80;

	self.prevSlopeAngle   = 0;
	self.prevSlopeNormal  = new vec2(0, 0);
	self.prevSlopeSign    = 0;
	
	self.currSlopeAngle   = 0;
	self.currSlopeNormal  = new vec2(0, 0);
	self.currSlopeSign    = 0;
	
	self.isAscendingSlope  = false;
	self.isDescendingSlope = false;
	
	return;
	
	#endregion
	
	#region Functions
	
	static Update = function()
	{
		DescendSlope();
		
		var _results = character.collider.CheckHor((character.velocity).__mul__(Time.deltaTime));
		
		if (_results == noone) return;

		var movingDirection = sign(character.velocity.x);

		for(var __index = 0, _count = array_length(_results); __index < _count; __index++)
		{
			var _hit = _results[__index];
			
			if(_hit == noone) continue;

			var _slopeAngle = _hit.normal.AsAngleDegrees() - 90;
			
			show_debug_message(string(_slopeAngle));

			if(__index == 0 and (_slopeAngle <= maxSlopeAngle))
			{
				if(isDescendingSlope)
				{
					isDescendingSlope = false;
				}

				currSlopeAngle  = _slopeAngle;
				currSlopeNormal = _hit.normal;
				
				var distanceToSlopeStart = 0;
				if(currSlopeAngle != prevSlopeAngle)
				{
					distanceToSlopeStart = (_hit.distance - character.collider.SkinWidth);
					character.velocity.x -= distanceToSlopeStart * movingDirection;
				}
				
				currSlopeSign = sign(character.velocity.x);
				
				AscendSlope();
				
				character.velocity.x += distanceToSlopeStart * movingDirection;
			}

			if((_slopeAngle >= maxSlopeAngle))
			{

				distanceToSlopeStart = (_hit.distance - character.collider.SkinWidth);
				character.velocity.x = distanceToSlopeStart * movingDirection;
				
				if (isAscendingSlope)
				{
					character.velocity.y = 
					  -(tan(degtorad(currSlopeAngle)) *
						abs(character.velocity.x));
				}
			}
		}
	}
	
	static AscendSlope = function()
	{
		var _slopeRadians = degtorad(currSlopeAngle);
		
		var _speed = abs(character.velocity.x);
		var _climb = -(sin(_slopeRadians) * _speed);

		if (character.velocity.y <= _climb) //TODO: neccesary check? move down??
		{
			var _velSign = sign(character.velocity.x);

			character.velocity.x = cos(_slopeRadians) * _speed * _velSign;
			character.velocity.y = _climb;
			
			//currSlopeSign   = _velSign;
			
			isAscendingSlope = true;
		}
		else
		{
			isAscendingSlope = false;
		}
	}
	
	static DescendSlope = function()
	{
		if(character.velocity.y <= 0) return;
		
		var _velSign = sign(character.velocity.x);
		
		var _origin = (_velSign == -1) ? character.collider.bounds.b_r : character.collider.bounds.b_l;
		
		var _hit = Raycast(_origin, down, /*distance*/ 1 UNITS);
		if(!_hit) return;

		var _slopeAngle = _hit.normal.AsAngleDegrees() - 90;

		if (_slopeAngle != 0 && _slopeAngle <= maxSlopeAngle)
		{
			var _isMovingInDownDir = (sign(_hit.normal.x) == _velSign);
			
			if (_isMovingInDownDir)
			{
				show_debug_message("Down");
				
				//character.velocity.y -= 100;
				
				if(_hit.distance - character.collider.SkinWidth <=
				   tan(degtorad(_slopeAngle) * abs(character.velocity.x)))
				{
					show_debug_message("DOWN DOWN DOWN");
					
					var __speed = abs(character.velocity.x);
					var __descendVelocityY = sin(degtorad(_slopeAngle)) * __speed;

					character.velocity.x = cos(degtorad(_slopeAngle)) * __speed * sign(character.velocity.x);
					character.velocity.y = __descendVelocityY;

					currSlopeAngle = _slopeAngle;
					currSlopeSign  = -sign(character.velocity.x);

					isDescendingSlope = true;

					//setBelow(true, hit.normal);
				}
			}
			else
			{
				isDescendingSlope = false;
			}
		}
	}
	
	#endregion
}