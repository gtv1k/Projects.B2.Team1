function PathCollider(_path) constructor
{
	#region Constructor
	
	//path_set_closed(_path, true);
	
	self.verticesCount = path_get_number(_path);
	self.vertices = array_create(verticesCount, new vec2(0, 0));
	
	for(var _index = 0; _index < verticesCount; _index += 1)
	{
		self.vertices[_index] = new vec2(path_get_point_x(_path, _index), path_get_point_y(_path, _index));
	}

	var _min = new vec2( infinity, -infinity);
	var _max = new vec2(-infinity,  infinity);

	for(var _index = 0; _index < verticesCount; _index += 1)
	{
		var _point = vertices[_index];
	
		_min.x = min(_min.x, _point.x);
		_min.y = max(_min.y, _point.y);
	
		_max.x = max(_max.x, _point.x);
		_max.y = min(_max.y, _point.y);
	}
	
	self.bounds = new Bounds();
	self.bounds.SetMinMax(_min, _max);
	
	return;
	
	#endregion
	
	#region Functions
	
	static Draw = function(additional = false)
	{
		//draw_set_color(c_green);
		
		for(var _index = 1; _index < verticesCount; _index += 1)
		{
			var _a = vertices[_index-1];
			var _b = vertices[_index  ];
			
			var _line = new Line(_a, _b);
			
			Debug.DrawLine(_line, /*thickness: */ 2, /*color: */ c_green);
			Debug.DrawCircle(/*center: */ _a, /*radius: */ 4, , /*color: */ c_green);
			Debug.DrawCircle(/*center: */ _b, /*radius: */ 4, , /*color: */ c_green);
		}
		
		if(additional)
		{
			bounds.Draw();
		}
	}
	
	//TODO: [Walter] Normals
	
	#endregion
}