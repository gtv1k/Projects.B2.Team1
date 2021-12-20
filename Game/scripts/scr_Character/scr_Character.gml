function Character(_position = new vec2(0, 0), _velocity = new vec2(0, 0)) constructor
{
	#region Constructor
	
	self.velocity = _position;
	self.position = _velocity;
	
	self.collider = new CharacterCollider(/*position: */ _position);
	
	self.abilities = 
	[
		new MoveAbility( /*character: */ self, /*moveSpeed: */  4 UNITS), 
		new DashAbility( /*character: */ self),
		new JumpAbility( /*character: */ self, /*jumpHeight: */ 3 UNITS, /*jumpDuration: */ 1),
		new SlopeAbility(/*character: */ self)
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

        var _translation = (velocity).__mul__(Time.deltaTime);
        
        position = (position).__add__(_translation);
        
        collider.Translate(_translation);
	}
	
	#endregion
}