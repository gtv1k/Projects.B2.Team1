function List(/*_capacity = 10*/) constructor
{
	#region Constructor
	
	self.list = ds_list_create();
	
	#endregion
	
	#region Functions
	
	static Add=function(_item)
	{
		gml_pragma("forceinline");
		
		ds_list_add(list, _item);
		
		return self;
	}
	
	static AddRange=function()
	{
		gml_pragma("forceinline");
		
		//TODO: Check if argument*s* has the same effect.
		
		switch (argument_count)
		{
			case  1: ds_list_add(list, argument0); break;
			case  2: ds_list_add(list, argument0, argument1); break;
			case  3: ds_list_add(list, argument0, argument1, argument2); break;
			case  4: ds_list_add(list, argument0, argument1, argument2, argument3); break;
			case  5: ds_list_add(list, argument0, argument1, argument2, argument3, argument4); break;
			case  6: ds_list_add(list, argument0, argument1, argument2, argument3, argument4, argument5); break;
			case  7: ds_list_add(list, argument0, argument1, argument2, argument3, argument4, argument5, argument6); break;
			case  8: ds_list_add(list, argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7); break;
			case  9: ds_list_add(list, argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8); break;
			case 10: ds_list_add(list, argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9); break;
			case 11: ds_list_add(list, argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10); break;
			case 12: ds_list_add(list, argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11); break;
			case 13: ds_list_add(list, argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12); break;
			case 14: ds_list_add(list, argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13); break;
			case 15: ds_list_add(list, argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13, argument14); break;
		}
		
		return self;
	}
	
	#endregion
}