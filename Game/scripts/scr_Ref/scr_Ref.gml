function Ref(_varName) constructor
{
	#region Constructor

	self.varID = other;
	self.varName = _varName;
	
	#endregion
	
	#region Functions
	
	static Get = function()
	{
		return variable_instance_get(/*id */varID, /*name */varName);
	}
	static Set = function(_value)
	{
		       variable_instance_set(/*id */varID, /*name */varName, /*value */_value);
	}
	
	#endregion
}