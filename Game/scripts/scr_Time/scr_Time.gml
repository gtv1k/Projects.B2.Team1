#macro Time (GetStaticTime())

function GetStaticTime()
{
    static instance = undefined;
    
    if (instance == undefined)
	{
        instance = 
		{
            deltaTime: delta_time / 1000000,
            frameCount: 0,
            time: current_time / 1000,
            
            last_update_time: -1,
            
            Update: function() 
			{    
                if (last_update_time == current_time) return;
                
                deltaTime = delta_time / 1000000;
                frameCount += 1;
                time = current_time / 1000;
                
                last_update_time = current_time;
            },
        };
    }
    
    instance.Update();
    
    return instance;
}