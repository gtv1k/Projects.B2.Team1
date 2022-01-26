function Random() : Action() constructor
{
	static Start = function()
	{
		self.randomIndex = irandom(children.Count() - 1);
		
		Debug.Log("Start Random, INDEX = ", randomIndex);
		
		//ResetAllChildren();
	}
	
    static Update = function()
	{
		var _child = children.GetAt(randomIndex);
		
		var _childStatus = _child.status;
			
		var _shouldUpdateChild = ((_childStatus is OFF) or (_childStatus is CONTINUE));
        if(_shouldUpdateChild)
		{
			_childStatus = UpdateChild(randomIndex);
        }
			
		switch(_childStatus)
		{
            case CONTINUE: 
				status = CONTINUE;
			return status;
				
            case SUCCES: 
				status = SUCCES;
				ResetAllChildren();
				self.Reset();
				
			return status;
        }
		
		Debug.Log("Random FAILURE");
		
		self.Reset();
		
        return FAILURE;
    }
}