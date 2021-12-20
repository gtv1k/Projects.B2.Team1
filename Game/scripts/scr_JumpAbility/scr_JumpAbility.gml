function JumpAbility(_character, _jumpHeight, _jumpDuration) : Ability(_character) constructor
{
	#region Constructor
	
	//self.airJumpsMax  = 0;
    //self.airJumpsLeft = 0;
	
	self._gravity  = -(2 * _jumpHeight) / power(_jumpDuration, 2); //SUVAT
	self.jumpSpeed = -(-_gravity * _jumpDuration);
	
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
		character.velocity.y -= _gravity * Time.deltaTime;
		
		//TODO: Double gravity on way down.
		
        if(character.collider.IsOnGround())
        {
            character.velocity.y = 0;   
        }
        else
        {
            character.velocity.y -= _gravity * Time.deltaTime;
        }
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