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
		global.gizmos = ds_list_create();
		
        instance = 
		{			
			last_update_time: -1,
			
			Update: function() 
			{    
                if (last_update_time == current_time) return;
                last_update_time = current_time;
				
				for(var _index = 0; _index < ds_list_size(global.gizmos); _index += 1)
				{
					var _gizmo = global.gizmos[| _index];
					
					_gizmo.timeLeft -= (delta_time / 1000000);
					
					if(_gizmo.timeLeft <= 0)
					{
						ds_list_delete(global.gizmos, _index);
					}
				}
            },
			
			#region Logging
			
			Log: function(_message)
			{
				if(!is_string(_message))
				{
					throw ("InvalidArgumentException");
				}
				
				show_debug_message(_message);
			},
			
			#endregion
			
			#region Drawing
			
			DrawAll: function()
			{
				if(ds_list_empty(global.gizmos)) return;
				
				for(var _index = 0, _count = ds_list_size(global.gizmos); _index < _count; _index += 1)
				{
					var _gizmo = global.gizmos[| _index];
					
					draw_set_colour(_gizmo.color);
					
					_gizmo.action();
				}
			},
			
			DrawLine: function(_line, _thickness = 1, _color = c_white, _duration = 0) 
			{    
				var _action = method({line: _line, thickness: _thickness}, function()
				{
					draw_line_width(line.origin.x, line.origin.y, line.ending.x, line.ending.y, thickness);
				});
				
				var _gizmo = new Gizmo(_action, _color, _duration);
				ds_list_add(/*id: */ global.gizmos, /*val: */_gizmo);
				return _gizmo;
			},
			
			#endregion
        };
    }
    
	instance.Update();
	
    return instance;
}