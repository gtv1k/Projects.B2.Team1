//Runs children sequentually until all have succeeded or one has failed.
function Sequence() : Action() constructor
{
    static Update = function()
	{
		var _allSucceeded = true;
		
		//TODO: Use activeChildIndex instead of for loop.
		
		for(var _index = 0, _childCount = children.Count(); _index < _childCount; _index += 1)
		{
			var _child = children.GetAt(_index);
			
			var _childStatus = _child.status;
			
			var _shouldUpdateChild = ((_childStatus is OFF) or (_childStatus is CONTINUE));
			
			if(_shouldUpdateChild)
			{				
				_childStatus = UpdateChild(_index);
			}
			
			switch(_childStatus)
			{
				case CONTINUE: 
					_allSucceeded = false;
					
					status = CONTINUE;
					return CONTINUE;
				case FAILURE:
					_allSucceeded = false;
					
					Debug.Log("EPIC FAIL");
										
					//status = FAILURE;
					self.Reset();		
					return FAILURE;
				break;
	        }
			
			/*
			switch(_child.status)
			{
				case CONTINUE: 
				case FAILURE:  
					_allSucceeded = false;
					status = _child.status;
					return status;
				break;
	        }
			*/
		}
		
		if(_allSucceeded) 
		{
			self.Reset();
			
			status = SUCCES;
			return SUCCES;
		}
    }
}