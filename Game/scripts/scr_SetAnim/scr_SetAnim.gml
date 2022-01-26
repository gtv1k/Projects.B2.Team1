function SetAnim(_animation) : Action() constructor
{	
	#region Constructor
	
	self.animation = _animation;
	
	#endregion
	
	#region Methods
	
	static Update = function()
	{
		if (user.sprite_index != animation)
		{
			user.image_index = 0;
			user.sprite_index = animation;
		}
		
		//user.sprite_index = animation;
		//user.image_index = 0;
		
		return SUCCES;
	}
	
	#endregion
}