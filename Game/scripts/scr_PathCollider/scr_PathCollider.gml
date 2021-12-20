function PathCollider(_path) constructor
{
	#region Constructor
	
	//path_set_closed(_path, true);
	
	self.vertices = array_create(path_get_number(_path), new vec2(0, 0));
	
	for(var _index = 0; _index < path_get_number(_path); _index += 1)
	{
		self.vertices[_index] = new vec2(path_get_point_x(_path, _index), path_get_point_y(_path, _index));
	}
	
	#endregion
	
	#region Functions
	
	static Draw = function(additional = false)
	{
		draw_set_color(c_green);
		
		for(var _index = 1; _index < array_length(vertices); _index += 1)
		{
			var _point_a = vertices[_index-1];
			var _point_b = vertices[_index  ];
			
			draw_line_width(_point_a.x, _point_a.y, _point_b.x, _point_b.y, 2);
		
			draw_circle(_point_a.x, _point_a.y, 4, false);
			draw_circle(_point_b.x, _point_b.y, 4, false);
		}
		
		if(additional)
		{
			GetBounds().Draw();
		}
	}
	
	static GetBounds = function()
	{
		var _min = new vec2( infinity);
		var _max = new vec2(-infinity);
	
		for(var _index = 0; _index < array_length(vertices); _index += 1)
		{
			var _point = vertices[_index];
		
			_min.x = min(_min.x, _point.x);
			_min.y = min(_min.y, _point.y);
		
			_max.x = max(_max.x, _point.x);
			_max.y = max(_max.y, _point.y);
		}
		
		return new Bounds2D(_min, _max);
	}
	
	//TODO: [Walter] Normals
	
	#endregion
}