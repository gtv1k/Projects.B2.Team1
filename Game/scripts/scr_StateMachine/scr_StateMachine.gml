function StateMachine(_user) : Action() constructor
{
	#region Constructor
	
	if(_user == noone) throw "InvalidArgumentsException";
	
	self.user = _user;
	
	#endregion
	
	#region Functions
	
	static Start = function()
	{
		hasStarted = true;
		
		status = CONTINUE;
	}
	
	static Update = function()
	{
		if(ActiveChild() != NULL)
		{
			UpdateChild(activeChildIndex);
		}
		else if(status == CONTINUE)
		{
			var _firstChild = children.GetAt(0);
			
			if(_firstChild != NULL)
			{	
				UpdateChild(0);
			}
		}
	}
	
	#endregion
}