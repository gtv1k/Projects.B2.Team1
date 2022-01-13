function Wait(_waitTime = 1) : Action() constructor
{
	#region Constructor
	
	self.waitTime  = _waitTime;
	self.startTime = Time.time;
	self.endTime   = (startTime + waitTime);
	
	#endregion
	
	#region Functions
	
	static OnStep = function()
	{
		return (Time.time > endTime) ? SUCCES : CONTINUE;
	}
	
	#endregion
}