function Random() : Action() constructor
{
	static Start = function()
	{
		self.randomIndex = irandom(children.Count() - 1);
		
		Debug.Log("Start Random, INDEX = ", randomIndex);
		
		ResetAllChildren();
	}
	
    static Update = function()
	{
		var _child = children.GetAt(randomIndex);
			
		var _shouldUpdateChild = ((_child.status is OFF) or (_child.status is CONTINUE));
        if(_shouldUpdateChild)
		{
			UpdateChild(randomIndex);
        }
			
		switch(_child.status)
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
        return FAILURE;
    }
}