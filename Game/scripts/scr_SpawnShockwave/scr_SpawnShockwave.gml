function SpawnShockwave() : Action() constructor
{	
	#region Functions
	
	static Update = function()
	{
		VFX.SpawnShockWave(new Shockwave(), new vec2(user.x, user.y));
		
		status = SUCCES
		
		return status;
	}
	
	#endregion
	
	
}