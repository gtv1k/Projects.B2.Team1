function Condition(_predicate) : Action() constructor
{
	#region Constructor
	
	if(!is_method(_predicate))
	{
		throw "InvalidArgumentException";
	}
	
	self.predicate = _predicate;
	
	#endregion	
	
	#region Functions
	
	static Update = function()
	{
		return (predicate()) ? SUCCES : FAILURE;
	}
	
	#endregion
}