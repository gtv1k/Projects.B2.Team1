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
						tan(degtorad(currSlopeAngle)) *
						abs(character.velocity.x);
				}
			}
		}
	}
	
	static AscendSlope = function()
	{
		var _slopeRadians = degtorad(currSlopeAngle);
		
		var _speed = abs(character.velocity.x);
		var _climb = sin(_slopeRadians) * _speed;

		if (character.velocity.y <= _climb) //TODO: neccesary check? move down??
		{
			var _velSign = sign(character.velocity.x);

			character.velocity.x = cos(_slopeRadians) * _speed * _velSign;
			character.velocity.y = _climb;
			
			currSlopeSign   = _velSign;
			
			isAscendingSlope = true;
		}
		else
		{
			isAscendingSlope = false;
		}
	}
	
	#endregion
}