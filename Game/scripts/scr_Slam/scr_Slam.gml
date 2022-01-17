function Slam(_target) : Action() constructor
{
	#region Constructor
	
	if((_target is noone) or (_target is undefined))
	{
		//TODO: pick random spot in range.
		
		throw "InvalidArgumentException";
	}
	
	self.target = _target;
	
	return;
	
	#endregion
	
	#region Methods
	
	static Start = function()
	{
		self.position_target = new vec2(target.x, target.y);
		self.position_user   = new vec2(user.x, user.y);

		
		self.a = position_user;
		self.b = new vec2(a.x, a.y + 12);
		
		self.d = position_target;
		self.c = new vec2(d.x, d.y + 12);
		
		//face player direction.
		
		//check if can jump to player else return failure
		
		//calculate bezier curve
	}
	
	static Update = function()
	{
		//interpolate further along Bezier curve by time.
		
		return HasLanded() ? SUCCES : CONTINUE;
	}
	
	static CanJumpToPlayer = function()
	{
		
	}
	
	static HasLanded = function()
	{
		if (place_meeting(user.x, user.y+1, oWall)) //TODO: Replace oWall
		{
			Debug.Log("HasLanded");
		}
	}
	
	#endregion
	
	
}