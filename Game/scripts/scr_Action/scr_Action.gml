function Action() constructor
{
	#region Constructor
	
	self.status = OFF;
	self.hasStarted = false;
	
	self.children = new List();
	self.activeChildIndex = -1;
	
	self.user = null;
	
	#endregion
	
	#region Functions
	
	//static OnEnable = function(){}
	//static OnDisable = function(){}
	
	static Reset = function()
	{
		self.status = OFF;
		self.hasStarted = false; //??
	}
	
	static Start = function(){}
	//static OnStop = function(){}
	
	static Update = function(){}
	
	//static OnChildUpdated = function(_childStatus){}
	
	static Add = function(_child)
	{
		//_child.user = self.user;
		
		//Debug.Log("New Child user = " + string(_child.user));
		
		_child.user = other;
		
		children.Add(_child);
		
		return self;
	}
	
	static ActiveChild = function()
	{
		return children.GetAt(activeChildIndex);
	}
	
	static UpdateChild = function(_index)
	{
		var _action = children.GetAt(_index);
		
		if(!_action.hasStarted)
		{
			_action.hasStarted = true;
			
			_action.Start();
		}
		
		var __status = _action.Update();
		
		if     ((__status == CONTINUE) and (ActiveChild() == noone))
		{
			self.activeChildIndex = _index;
		}
		else if((__status != CONTINUE) and (ActiveChild() != noone))
		{
			self.activeChildIndex = -1;
		}
		
		return __status;
	}
	
	#endregion
}