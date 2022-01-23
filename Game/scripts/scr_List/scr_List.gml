function List(/*_capacity = 10*/) constructor
{
	#region Constructor
	
    if (argument_count == 0)
	{
		self.list = []; //array_create(10, noone);
		return;
    }
	if (argument_count == 1)
	{
        self.list = argument[0];
		return;
    }
	
	throw ("InvalidArgumentsException!");
	
	#endregion
	
	#region Functions
	
	static Get = function(_item)
	{
		gml_pragma("forceinline");
		
		var _index = GetIndex(_item);
		
		return list[_index];
	}
	
	static GetIndex = function(_item)
	{
        for (var _index = 0, _count = array_length(list); _index < _count; _index += 1) 
		{
            if (list[_index] == _item)
			{
                return _index;
            }
        }
        
        return -1;
	}
	
	static GetAt = function(_index)
	{
		gml_pragma("forceinline");
		
		if(_index < 0) return null;
		
		return list[_index];
	}
	
	static Set = function(_item, _newItem)
	{
		gml_pragma("forceinline");
		
		var _index = GetIndex(_item);
		
		list[_index] = _newItem;
		
		return self;
	}
	
	static SetAt = function(_index, _newItem)
	{
		gml_pragma("forceinline");
		
		list[_index] = _newItem;
		
		return self;
	}
	
	static Add = function(_item)
	{
		gml_pragma("forceinline");
		
		array_push(list, _item);
		
		return self;
	}
	
	/*
	static AddAt = function(_index, _item)
	{
		gml_pragma("forceinline");
		
		ds_list_set(list, _index, _item);
		
		return self;
	}
	*/
	
	static AddRange = function()
	{
		gml_pragma("forceinline");
		
        for (var _index = 0; _index < argument_count; _index += 1) 
		{
            array_push(list, argument[_index]);
        }
		
		return self;
	}
	
	static Remove = function(_item)
	{
		gml_pragma("forceinline");
		
		array_delete(list, GetIndex(_item), 1);
        
        return self;
	}
	
	static RemoveAt = function(_index)
	{
		gml_pragma("forceinline");
		
		array_delete(list, _index, 1);
        
        return self;
	}
	
	static Count = function()
	{
		gml_pragma("forceinline");
		
		return array_length(list);
	}
	
	static For = function(_action)
	{
		gml_pragma("forceinline");
		
		if IsEmpty() return self;
		
		for (var _index = 0, _count = array_length(list); _index < _count; _index += 1)
		{
			var _item = list[_index];
			
			if(_item != null)
			{
				_action(list[_index]);
			}
		}
		
		return self;
	}
	
	static Forr = function(_action)
	{
		gml_pragma("forceinline");
		
		if IsEmpty() return self;
		
		for (var _index = array_length(list) -1; _index >= 0; _index -= 1)
		{
			var _item = list[_index];
			
			if(_item != null)
			{
				_action(list[_index]);
			}
		}
		
		return self;
	}

	static IsEmpty = function()
	{
		gml_pragma("forceinline");
		
		return (array_length(list) == 0);
	}
	
	static Clear = function()
	{
		gml_pragma("forceinline");
		
		if IsEmpty() return self;
		
		array_resize(list, 0);
		
		return self;
	}
	
	#endregion
}