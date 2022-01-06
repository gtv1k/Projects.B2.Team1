#macro Debug (GetStaticDebug())

function Gizmo(_action, _color = c_white, _duration = 0) constructor
{
	#region Constructor
	
	if(!is_method(_action)) throw ("InvalidArgumentException!");
	
	self.action   = _action;
	self.color    = _color;
	self.timeLeft = _duration;
	
	return;
	
	#endregion
	
	#region Methods
	
	SetColor = function(_color)
	{
		self.color = _color;
		return self;
	}
	
	SetDuration = function(_duration)
	{
		self.timeLeft = duration;
		return self;
	}
	
	#endregion
}

function GetStaticDebug()
{
    static instance = undefined;
    
    if (instance == undefined)
	{
		global.gizmos = new List();
		
        instance = 
		{			
			last_update_time: -1,
			
			Update: function() 
			{    
                if (last_update_time == current_time) return;
                last_update_time = current_time;
				
				global.gizmos.Forr(function(_gizmo)
				{
					_gizmo.timeLeft -= (delta_time / 1000000);
					
					if(_gizmo.timeLeft <= 0)
					{
						global.gizmos.Remove(_gizmo);
					}
				});
				
				/*
				for(var _index = 0; _index < ds_list_size(global.gizmos); _index += 1)
				{
					var _gizmo = global.gizmos[| _index];
					
					_gizmo.timeLeft -= (delta_time / 1000000);
					
					if(_gizmo.timeLeft <= 0)
					{
						ds_list_delete(global.gizmos, _index);
					}
				}
				*/
            },
			
			#region Logging
			
			Log: function(_message)
			{
				if(!is_string(_message))
				{
					_message = string(_message);
				}
				
				show_debug_message(_message);
			},
			
			#endregion
			
			#region Drawing
			
			DrawAll: function()
			{
				if(global.gizmos.IsEmpty()) return;
				
				global.gizmos.For(function(_gizmo)
				{
					draw_set_colour(_gizmo.color);
					_gizmo.action();
				});
				
				/*
				for(var _index = 0, _count = global.gizmos.Count(); _index < _count; _index += 1)
				{
					var _gizmo = global.gizmos.GetAt(_index);
					
					draw_set_colour(_gizmo.color);
					
					_gizmo.action();
				}
				*/
			},
			
			DrawLine: function(_line, _thickness = 1, _color = c_white, _duration = 0) 
			{    
				var _action = method({line: _line, thickness: _thickness}, function()
				{
					draw_line_width(line.origin.x, line.origin.y, line.ending.x, line.ending.y, thickness);
				});
				
				var _gizmo = new Gizmo(_action, _color, _duration);
				//ds_list_add(/*id: */ global.gizmos, /*val: */_gizmo);
				global.gizmos.Add(_gizmo);
				return _gizmo;
			},
			
			DrawNewLine: function(_origin, _ending, _thickness = 1, _color = c_white, _duration = 0) 
			{
				var _action = method({origin: _origin, ending: _ending, thickness: _thickness}, function()
				{
					draw_line_width(origin.x, origin.y, ending.x, ending.y, thickness);
				});
				
				var _gizmo = new Gizmo(_action, _color, _duration);
				//ds_list_add(/*id: */ global.gizmos, /*val: */_gizmo);
				global.gizmos.Add(_gizmo);
				return _gizmo;
	        },
	        
			/*
			DrawRay: function(_ray, _thickness = 1, _color = c_white, _duration = 0)
			{
	        },
			*/
			
	        DrawNewRay: function(_origin, _direction, _length = 10000, _thickness = 1, _color = c_white, _duration = 0) 
			{    
				var _ending = (_origin).__add__((_direction).__mul__(_length));
				
				var _action = method({origin: _origin, ending: _ending, thickness: _thickness}, function()
				{
					draw_line_width(origin.x, origin.y, ending.x, ending.y, thickness);
				});
				
				var _gizmo = new Gizmo(_action, _color, _duration);
				//ds_list_add(/*id: */ global.gizmos, /*val: */_gizmo);
				global.gizmos.Add(_gizmo);
				return _gizmo;	
	        },
			
			DrawCircle: function(_center, _radius = 1, _doOutline = false, _color = c_white, _duration = 0)
			{    
				var _action = method({center: _center, radius: _radius, doOutline: _doOutline}, function()
				{
					draw_circle(center.x, center.y, radius, doOutline);
				});
				
				var _gizmo = new Gizmo(_action, _color, _duration);
				//ds_list_add(/*id: */ global.gizmos, /*val: */_gizmo);
				global.gizmos.Add(_gizmo);
				return _gizmo;
	        },
			
	        
	        DrawRect: function(_position, _size, _doOutline = true, _color = c_white, _duration = 0)
			{    
				var _action = method({position: _position, extents: (_size).__div__(2), doOutline: _doOutline}, function()
				{
					var _min = (position).__sub__(extents);
					var _max = (position).__add__(extents);
					
					draw_rectangle(_min.x, _min.y, _max.x, _max.y, doOutline);
				});
				
				var _gizmo = new Gizmo(_action, c_white, _duration);
				//ds_list_add(/*id: */ global.gizmos, /*val: */_gizmo);
				global.gizmos.Add(_gizmo);
				return _gizmo;
	        },
	        
	        DrawBounds: function(_bounds, _thickness = 1, _color = c_white, _duration = 0)
	        {
				var _action = method({bounds: _bounds, thickness: _thickness}, function()
				{
					draw_set_color(c_aqua);
					draw_line_width(bounds.b_l.x, bounds.b_l.y, bounds.b_r.x, bounds.b_r.y, thickness);
		
					draw_line_width(bounds.b_r.x, bounds.b_r.y, bounds.t_r.x, bounds.t_r.y, thickness);
		
					draw_line_width(bounds.t_r.x, bounds.t_r.y, bounds.t_l.x, bounds.t_l.y, thickness);
		
					draw_line_width(bounds.t_l.x, bounds.t_l.y, bounds.b_l.x, bounds.b_l.y, thickness);
	
					draw_set_color(c_gray);
					draw_circle(bounds.Center.x, bounds.Center.y, 2, false);
		
					draw_set_color(c_red);
					draw_circle(bounds.Min.x, bounds.Min.y, 4, false);
		
					draw_set_color(c_blue);
					draw_circle(bounds.Max.x, bounds.Max.y, 4, false);
				});
				
				var _gizmo = new Gizmo(_action, _color, _duration);
				//ds_list_add(/*id: */ global.gizmos, /*val: */_gizmo);
				global.gizmos.Add(_gizmo);
				return _gizmo;
	        },
			
			#endregion
        };
    }
    
	instance.Update();
	
    return instance;
}