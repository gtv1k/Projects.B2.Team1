#macro Debug (GetStaticDebug())

function GetStaticDebug()
{
    static instance = undefined;
    
    if (instance == undefined)
	{
        instance = 
		{
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
			
			Update: function()
			{
				//Log("Something");
			},
			
			DrawGizmo: function()
			{
				
			},
			
			DrawLine: function(_start, _end) 
			{    
				
	        },
	        
	        DrawRay: function(_origin, _direction) 
			{    
				
	        },
	        
	        DrawRect: function(_position, _size)
			{    
				
	        },
	        
	        DrawBounds: function(_bounds)
	        {
	        	
	        	
	        },
			
			#endregion
        };
    }
    
    return instance;
	
	/*
    static instance = undefined;
    
    if (instance != undefined) return instance;
	
    return instance = 
	{
		#region Logging
		
		Log: function(_message)
		{
			//if(is_string(_message))
			//{
				//throw ("InvalidArgumentException");
			//}
			
			show_debug_message(_message);
		},
		
		#endregion
		
		#region Drawing
		
		Update: function()
		{
			Log("Rugharen zijn vies");
		},
		
		DrawGizmo: function()
		{
		
		},
		
		DrawLine: function(_start, _end) 
		{    
			
        },
		
		#endregion
    };
    */
}