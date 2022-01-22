function IsInRange(_target, _minDistance = 0 UNITS, _maxDistance = infinity) : Action() constructor
{
	#region Constructor
	
	if((_target is noone) or (_target is undefined))
	{
		throw "InvalidArgumentException";
	}
	
	self.target = _target;
	
	self.minDistance = _minDistance;
	self.maxDistance = _maxDistance;
	
	return;
	
	#endregion
	
	#region Methods
	
	static Start = function()
	{
		self.position_target = new vec2(target.x, target.y);
		self.position_user   = new vec2(user.x, user.y);
	}
	
	static Update = function()
	{
		var _distanceToTarget = position_user.Distance(position_target);
		
		var _isInRange = (_distanceToTarget >= minDistance) and (_distanceToTarget <= maxDistance);
		
		//Debug.DrawCircle(/*center */position_user, /*radius */ minDistance, /*doOutline*/ false, /*color */ c_red,  /*duration */ 1);
		//Debug.DrawCircle(/*center */position_user, /*radius */ maxDistance, /*doOutline*/ false, /*color */ c_blue, /*duration */ 1);

		//Debug.Log("Target is ", _distanceToTarget PIXELS, "m from target: ",  (_isInRange) ? "IN RANGE" : "outside range");
		
		if(_isInRange)
		{
			return SUCCES;
		}
		else
		{
			Debug.Log("Target is outside range. Distance: ", _distanceToTarget PIXELS, "m from target");	
			return FAILURE;
		}
		
		//return (_isInRange) ? SUCCES : FAILURE;
	}
	
	#endregion
}