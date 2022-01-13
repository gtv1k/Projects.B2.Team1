function Wait(_seconds = 1) : Action() constructor
{
	#region Constructor
	
	self.waitTime  = _seconds;
	
	return;
	
	#endregion
	
	#region Functions
	
	static Start = function()
	{
		var _startTime = Time.time;
		self.endTime   = (_startTime + waitTime);
	}
	
	static Update = function()
	{
		//Debug.Log("Waiting...");
		
		status = (Time.time < endTime) ? CONTINUE : SUCCES;
		
		/*
		if(status == SUCCES)
		{
			Debug.Log("WAITING OVER!! TIME: " + string(Time.time));
		}
		*/
		
		return status;
	}
	
	#endregion
}