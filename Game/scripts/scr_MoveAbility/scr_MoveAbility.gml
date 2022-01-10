function MoveAbility(_character, _groundedMaxSpeed = 5 UNITS, _airborneMaxSpeed = 5 UNITS) : Ability(_character) constructor
{
	#region Constructor
	
	self.groundedMaxSpeed = _groundedMaxSpeed;
	self.airborneMaxSpeed = _airborneMaxSpeed;
	
	return;
	
	#endregion
	
	#region Functions
	
	static Update = function()
	{
		var _l = input_check(Inputs.Left)  ? -1 : 0; //-input_check(Inputs.Left)
		var _r = input_check(Inputs.Right) ?  1 : 0; // input_check(Inputs.Right)

        var _input = (_l + _r);

		//TODO: Slow down to _airborneMaxSpeed if in air.
		
		//TODO: Interpolate Speed (using acceleration curve)

		if(_input == 0)
		{
			character.velocity.x = 0;
			return; //TODO: Remove this later.
		}

		if(character.collider.IsOnGround())
		{
			GroundedMovement(_input);
		}
		else
		{
			AirborneMovement(_input);
		}
	}
	
	static GroundedMovement = function(_input)
    {
		//TODO: if current targetSpeed > velocity, use acceleration curve, else use deleceration curve
		var _moveVector = new vec2((_input * groundedMaxSpeed), 0);
		
		//var _groundAngle = character.collider.GroundSlopeAngle();
		
		var _groundAngle = character.collider.GroundSlopeAngle(/*lineLength: */ 32, /*checkRight: */(_input >= 1));
		//var _groundAngle = character.collider.BottomLeft;
		
		Debug.Log(" ");
		Debug.Log("GroundAngle:             " + string(_groundAngle));
		
		Debug.Log("MoveVector Before: " + _moveVector.ToString());
		if(_groundAngle != 0)
		{
			_moveVector.Rotate(_groundAngle);
		}
		Debug.Log("MoveVector After:    " + _moveVector.ToString());
		
		//character.velocity = (character.velocity).__add__(_moveVector);
		character.velocity = _moveVector;
		
		//var (new vec2(_targetSpeed, 0)).Rotate(_groundAngle);
		
		//TODO Raycast to detect ground angle.
		
        //character.velocity.x = targetSpeed;
    }
	
	static AirborneMovement = function(_input)
    {
		//TODO: if current targetSpeed > velocity, use acceleration curve, else use deleceration curve
		
        var _targetSpeed = (_input * airborneMaxSpeed);
		
        //character.velocity.x = targetSpeed;
    }
	
	#endregion
}