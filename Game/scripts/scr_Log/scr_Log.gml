function Log(_message) : Action() constructor
{	
	#region Constructor
	
	self.msg = _message;
	
	return;
	
	#endregion
	
	#region Functions
	
	static Update = function()
	{
		Debug.Log(msg);
		
		status = SUCCES
		
		return status;
	}
	
	#endregion
	
	
}