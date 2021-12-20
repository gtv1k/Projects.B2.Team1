function MoveAbility(_character, _maxSpeed = 5 UNITS) : Ability(_character) constructor
{
	#region Constructor
	
	self.maxSpeed = _maxSpeed;
	
	return;
	
	#endregion
	
	#region Functions
	
	static Update = function()
	{
		//If grounded
		OnGroundMovement();
	}
	
	static OnGroundMovement = function()
    {
		var l = input_check(Inputs.Left)  ? -1 : 0;
		var r = input_check(Inputs.Right) ?  1 : 0;

        var hor = (l + r);

        var targetSpeed = hor * maxSpeed;

		//TODO: Interpolate (using curve)
        character.velocity.x = targetSpeed;
    }
	
	#endregion
}