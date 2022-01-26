#macro VFX (GetStaticVFX())

function Shockwave(_size, _duration) constructor
{
	#region Constructor
	
	//TODO: throw errors for invalid arguments.
	
	//self.position = _center;
	self.size     = _size;
	self.timeLeft = _duration;
	
	return;
	
	#endregion
}

function GetStaticVFX()
{
    static instance = undefined;
    
    if (instance == undefined)
	{
		//global.shockwaves = new List();
		
        instance = 
		{		
			/*
			last_update_time: -1,
			
			Update: function() 
			{    
                if (last_update_time == current_time) return;
                last_update_time = current_time;
				
				global.shockwaves.Forr(function(_shockWave)
				{
					_shockWave.timeLeft -= (delta_time / 1000000);
					
					if(_shockWave.timeLeft <= 0)
					{
						global.gizmos.Remove(_shockWave);
					}
				});
            },
			*/
			
			#region Shockwaves
			
			SpawnShockWave: function(_shockwave, _position)
			{
				instance_create_layer(_position.x, _position.y, "VFX", obj_Shockwave);
			},
			
			#endregion
        };
    }
    
	instance.Update();
	
    return instance;
}