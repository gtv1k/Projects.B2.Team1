function Sequence() : Action() constructor
{
	static Start = function()
	{
		self.childCount = children.Count();
	}
	
    static Update = function()
	{
		var _allSucceeded = true;
		
		for(var _index = 0; _index < childCount; _index += 1)
		{
			var _child = children.GetAt(_index);
			
			var _shouldUpdateChild = ((_child.status is OFF) or (_child.status is CONTINUE));
			
			if(_shouldUpdateChild)
			{				
				UpdateChild(_index);
			}
			
			switch(_child.status)
			{
				case CONTINUE: 
				case FAILURE:  
					_allSucceeded = false;
					status = _child.status;
					return status;
				break;
	        }
		}
		
		if(_allSucceeded) 
		{
			ResetAllChildren();
			
			status = SUCCES;
			return SUCCES;
		}
    }
	
	static ResetAllChildren = function()
	{
		for(var _index = 0; _index < childCount; _index += 1)
		{
			var _child = children.GetAt(_index);
			
			_child.Reset();
		}
	}
}