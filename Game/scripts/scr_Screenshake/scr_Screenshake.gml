function Screenshake() : Action() constructor
{
	#region Constructor
	
	self.hasShaken = false;
	
	return;
	
	#endregion
	
	#region Methods
	
	static Start = function()
	{
		self.hasShaken = false;
	}
	
	static Update = function()
	{	
		if(hasShaken) return SUCCES;
		
		screenshake();
		
		hasShaken = true;
		state = SUCCES;
		return state;
	}

	
	#endregion
	
	
}