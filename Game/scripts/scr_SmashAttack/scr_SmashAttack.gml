function SmashAttack() : Action() constructor
{
	#region Constructor
	
	self.hasSlammed = false;
	
	return;
	
	#endregion
	
	#region Methods
	
	static Start = function()
	{
		self.hasSlammed = false;
	}
	
	static Update = function()
	{	
		if(hasSlammed) return SUCCES;
		
		user.sprite_index = sp_golem_smash;
		user.image_index = 0;
		
		hasSlammed = true;
		
		return SUCCES;
	}

	
	#endregion
	
	
}