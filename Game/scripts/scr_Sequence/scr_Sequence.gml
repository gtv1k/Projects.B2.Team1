function Sequence() : Action() constructor
{
	static Start = function()
	{
		self.childCount = children.Count();
	}
	
    static Update = function()
	{
		var _foundEnabledChildren = false;
		
		var _allSucceeded = true;
		
		for(var _index = 0; _index < childCount; _index += 1)
		{
			var _child = children.GetAt(_index);
			
			if(_child.status == CONTINUE)
			{
				_foundEnabledChildren = true;
				
				var _newChildStatus = UpdateChild(_index);
			
				switch(_newChildStatus)
				{
					case CONTINUE: 
					case FAILURE:  
						_allSucceeded = false;
						status = _newChildStatus; 
						return status;
					break;
			
					case SUCCES:
						_child.Reset();
						Debug.Log("Continue A");
						continue; //update next child if self was success.
					//default: status = SUCCES;
	            }
			}
		}
		
		if(_foundEnabledChildren) return SUCCES;
		
		for(var _index = 0; _index < childCount; _index += 1)
		{
			var _child = children.GetAt(_index);
			
			if(_child.status == OFF)
			{
				var _newChildStatus = UpdateChild(_index);
			
				switch(_newChildStatus)
				{
					case CONTINUE: 
					case FAILURE:  
						status = _newChildStatus;
						return status;
					break;
			
					case SUCCES:
						_child.Reset();
						//Debug.Log("Continue A");
						continue;
	            }
			}
		}
		
		/*
        var _index = 0;
        repeat(children.Count())
		{
			var _childStatus = children.GetAt(_index).status;
			
            if(_childStatus == CONTINUE or _childStatus == OFF)
			{
                switch(UpdateChild(_index))
				{
                    case CONTINUE: return CONTINUE;
                    case FAILURE:  return FAILURE; 
                }
            }
            
            ++_index;
        }
		
		return SUCCES;
		*/
		
		/*
		var _continueIndex = GetFirstIndexOf(CONTINUE);
		
		if(_continueIndex != NULL)
		{
			OnChildUpdated(UpdateChild(_continueIndex));
			
			return status;
		}
		else
		{
			var _offIndex = GetFirstIndexOf(OFF);
		
			if(_offIndex != NULL)
			{
				OnChildUpdated(UpdateChild(_offIndex));
			
				return status;
			}
		}
		*/
		
		
		/*
		//iterate through all children
		for(var _index = 0, _count = children.Count(); _index < _count; _index += 1)
		{
			var _child = children.GetAt(_index);
			
			if(_child.status == CONTINUE)
			
			var _newChildStatus = UpdateChild(_index);
			
			
			switch(_childStatus)
			{
                case CONTINUE: return status = CONTINUE;
                case FAILURE:  return status = FAILURE;
            }
	
			
			//the first child whose status says it should continue is updated.
			//if(children.GetAt(_index).status == CONTINUE)
			//{
				//var _childStatus = UpdateAction(children[_index]);
				
				//switch is done so it doesn't return any state of it's children that isn't CONTINUE or FAILURE.
				//switch(_childStatus)
				//{
                    //case CONTINUE: return status = CONTINUE;
                    //case FAILURE:  return status = FAILURE;
                //}
			//}
		}
		*/
		
		return status = FAILURE;
    }
	
	static OnChildUpdated = function(_childStatus)
	{
		switch (_childStatus)
		{
			case CONTINUE: 
			case FAILURE:  
				status = _childStatus;  
			break;
			
			//default: status = SUCCES;
		}
	}
	
	static ContinueSequence = function()
	{
		for(var _index = 0, _count = children.Count(); _index < _count; _index += 1)
		{
			var _child = children.GetAt(_index);
			
			if(_child.status == CONTINUE)
			{
				var _newChildStatus = UpdateChild(_index);
			
				switch(_newChildStatus)
				{
	                case CONTINUE: return status = CONTINUE;
	                case FAILURE:  return status = FAILURE;
	            }
			}
		}
		
		return NULL;
	}
	
	static GetFirstIndexOf = function(_searchStatus)
	{
		for(var _index = 0, _count = children.Count(); _index < _count; _index += 1)
		{
			var _child = children.GetAt(_index);
			
			if(_child.status == _searchStatus) return _index;
		}
		
		return NULL;
	}
	
	static HasEnabledChildren = function()
	{
		for(var _index = 0; _index < childCount; _index += 1)
		{
			var _child = children.GetAt(_index);
			
			if(_child.status != OFF) return true;
		}
		
		return false;
	}
	
	//static StartFirst
	
	/*
	static OnChildFailure = function(_childIndex)
	{
		
	}
	*/
}