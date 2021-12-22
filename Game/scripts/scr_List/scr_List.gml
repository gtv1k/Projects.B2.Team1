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
	}
	
	#endregion
}