function Seq(_sequence, _position = new vec2(0, 0), _layer = "Attacks", _awaitCompletion = true, _mirror = false, _scale = 1) : Action() constructor
{		
	#region Constructor
	
	self.animation = layer_sequence_create(_layer, _position.x, _position.y, _sequence);
	
	self.hasAnimationStarted = false;
	
	self.awaitCompletion = _awaitCompletion;
	
	self.mirror = _mirror;
	
	self.scale = _scale;
	
	#endregion
	
	#region Methods
	
	static Start = function()
	{
		//layer_sequence_play(animation);
		
		hasAnimationStarted = false;
	}
	
	static Update = function()
	{
		if(not hasAnimationStarted)
		{
			layer_sequence_play(animation);
			
			layer_sequence_xscale(animation, (mirror) ? -scale : scale);
			layer_sequence_yscale(animation, scale);
			
			hasAnimationStarted = true;
		}
		
		//if(hasAnimationStarted)
		//{
			if(awaitCompletion)
			{
				return layer_sequence_is_finished(animation) ? SUCCES : CONTINUE;
			}
			else
			{
				return SUCCES;
			}
		//}
		
		return FAILURE;
	}
	
	#endregion
}