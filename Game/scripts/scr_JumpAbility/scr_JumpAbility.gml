function JumpAbility(_character, _jumpHeight, _jumpDuration) : Ability(_character) constructor
{
	#region Constructor
	
	//self.airJumpsMax  = 0;
    //self.airJumpsLeft = 0;
	
	self._gravity  = (2 * _jumpHeight) / power(_jumpDuration, 2); //-(2 * _jumpHeight) / power(_jumpDuration, 2); //SUVAT
	self.jumpSpeed = (_gravity * _jumpDuration) //-(-_gravity * _jumpDuration);
	
	//return;
	
	#endregion
	
	#region Functions
	
	static Update = function()
	{
		HandleGravity();
		
		HandleJump();
	}
	
	static HandleGravity = function()
    {
		//TODO: Double gravity on way down.
		//TODO: Use HasColBelow
		
        if(character.collider.IsOnGround()) //only fall if in air (so we don't fall through the ground)
        {
			character.velocity.y = 0;
			/*
			if(character.velocity.y < _gravity)
			{
			
			}
			*/
		}
		else
		{
			character.velocity.y = -_gravity;
		}
		
		//character.Move();
    }
	
	static HandleJump = function()
    {
        if(input_check(Inputs.Jump))
        {
            if(character.collider.IsOnGround())
            {
                //force not grounded?		
                character.velocity.y = jumpSpeed;
            }
			
			/*
            else
            {
                if(airJumpsLeft == 0) return;
                
                //force not grounded?
                character.velocity.y = _jumpSpeed;
                    
                airJumpsLeft--;
            }
			*/
        }
    }
	
	#endregion
}