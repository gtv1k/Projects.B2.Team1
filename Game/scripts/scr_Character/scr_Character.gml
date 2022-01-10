function Character(_position = new vec2(0, 0)) constructor
{
	#region Constructor
	
	self.position = _position;
	self.velocity = new vec2(0, 0);
	//self.rotation = 0;
	//in degrees
	self.maxSlopeAngle = 40;
	
	self.collider = new CharacterCollider(/*position: */ position);
	
	self.abilities = 
	[
		new JumpAbility(/*character: */self, /*jumpHeight: */3 UNITS, /*jumpDuration: */1),
		new MoveAbility(/*character: */self, /*moveSpeed:  */4 UNITS), 
		//new DashAbility(/*character: */ self),
		//new SlopeAbility(/*character: */ self)
	];
	
	return;
	
	#endregion
	
	#region Methods
	
	static Update = function()
	{
		for (var _index = 0, _count = array_length(abilities); _index < _count; _index += 1)
        {
            abilities[_index].Update();
        }
		
		Move();
		//collider.bounds
	}
	
	static Move = function()
	{
		var _translation = (velocity).__mul__(Time.deltaTime);
		
		_translation.y = -_translation.y;
		
		position = (position).__add__(_translation);
	
		collider.SetPosition(position);
	}
	
	#endregion
}