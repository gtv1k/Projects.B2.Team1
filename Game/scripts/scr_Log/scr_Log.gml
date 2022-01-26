function Log(_message) : Action() constructor
{	
	#region Constructor
	
	if(!is_string(_message))
	{
		_message = string(_message);
	}
	
	if(argument_count > 1)
	{
		for(var _index = 1; _index < argument_count; _index += 1)
		{
			var _arg = argument[_index];
						
			if(!is_string(_arg))
			{
				_arg = string(_arg);
			}
						
			_message += _arg;
		}
	}
	
	self.msg = _message;
	
	self.hasLogged = false;
	
	return;
	
	#endregion
	
	#region Functions
	
	static Start = function()
	{
		self.hasLogged = false;
	}
	
	static Update = function()
	{
		if hasLogged return SUCCES;
		
		Debug.Log(msg);
		
		hasLogged = true;
		
		status = SUCCES
		return status;
	}
	
	#endregion
	
	
}