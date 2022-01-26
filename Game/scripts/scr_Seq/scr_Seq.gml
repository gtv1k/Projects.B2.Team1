function Seq(_sequence, _offset = new vec2(0, 0), _layer = "Attacks", _awaitCompletion = true, _scale = new vec2(1, 1), _target = null) : Action() constructor
{		
	#region Constructor

	//self.position = new vec2(0, 0);
	
	self.seq = _sequence;
	self.seqLayer = _layer;
	
	self.animation = null;
	
	self.offset = _offset;
	
	self.target = _target;
	
	/*
	if(_position != null and _position != undefined)
	{
		self.animation = layer_sequence_create(_layer, _position.x, _position.y, _sequence);
	}
	else
	{
		self.animation = null;
	}
	*/
	
	self.hasAnimationStarted = false;
	
	self.awaitCompletion = _awaitCompletion;
	
	self.scale = _scale;
	
	#endregion
	
	#region Methods
	
	static Start = function()
	{
		hasAnimationStarted = false;
	}
	
	static Update = function()
	{
		if(not hasAnimationStarted)
		{
			if(target is null)
			{
				position = (new vec2(other.x, other.y)).__add__(offset);
			}
			else
			{
				position = new vec2(target.x, target.y);
			}
				
			animation = layer_sequence_create(seqLayer, position.x, position.y, seq);
			
			//animation = layer_sequence_create(seqLayer, position.x, position.y, seq);
			
			layer_sequence_play(animation);
			
			layer_sequence_xscale(animation, scale.x);
			layer_sequence_yscale(animation, scale.y);
			
			//layer_sequence_xscale(animation, (mirror) ? -scale : scale);
			//layer_sequence_yscale(animation, scale);
			
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
		
		return FAILURE;
	}
	
	#endregion
}