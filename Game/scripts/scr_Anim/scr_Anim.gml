function Anim(_sequence, _position = new vec2(0, 0), _layer = "Attacks", _awaitCompletion = true) : Action() constructor
{		
	#region Constructor
	
	self.animation = layer_sequence_create(_layer, _position.x, _position.y, _sequence);
	
	self.hasAnimationStarted = false;
	
	self.awaitCompletion = _awaitCompletion;
	
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
			hasAnimationStarted = true;
		}
		
		if(awaitCompletion)
		{
			return layer_sequence_is_finished(animation) ? SUCCES : CONTINUE;
		}
		else
		{
			return SUCCES;
		}
	}
	
	#endregion
}