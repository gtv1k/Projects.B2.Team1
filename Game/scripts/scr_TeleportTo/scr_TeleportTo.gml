function TeleportTo(_targetPos) : Action() constructor
{
	#region Constructor
	
	if((_targetPos is noone))
	{
		throw "InvalidArgumentException";
	}
	
	self.targetPos = _targetPos;
	
	self.hasTeleported = false;
	
	return;
	
	#endregion
	
	#region Methods
	
	static Start = function()
	{
		hasTeleported = false;
	}
	
	static Update = function()
	{	
		if(hasTeleported) return SUCCES;
		
		user.x = targetPos.x;
		user.y = targetPos.y;
		
		hasTeleported = true;
		
		return SUCCES;
	}

	
	#endregion
	
	
}