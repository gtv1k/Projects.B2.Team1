function StateMachine(_user) : Action(_user) constructor
{
	#region Constructor
	
	if(_user is NULL) throw "InvalidArgumentsException";
	
	//self.user = _user;
	
	return;
	
	#endregion
	
	#region Functions
	
	static Start = function()
	{
		hasStarted = true;
		
		status = CONTINUE;
		
		Debug.Log(user);
	}
	
	static Update = function()
	{
		//if(ActiveChild() is not NULL)
		//if((ActiveChild() != undefined) and (ActiveChild() != noone))
		if((ActiveChild() is not undefined) and (ActiveChild() is not noone))
		{
			Debug.Log("UPDATE CHILD, index = " + string(activeChildIndex));
			//Debug.Log(ActiveChild());
			
			UpdateChild(activeChildIndex);
		}
		//else if(status is CONTINUE)
		else if(status == CONTINUE)
		{
			var _firstChild = children.GetAt(0);
			
			//if(_firstChild is not NULL)
			if((_firstChild != undefined) or (_firstChild != noone))
			{	
				UpdateChild(0);
			}
		}
	}
	
	#endregion
}