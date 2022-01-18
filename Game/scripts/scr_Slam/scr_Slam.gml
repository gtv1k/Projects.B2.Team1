function Slam(_target, _lerpDuration = 2) : Action() constructor
{
	#region Constructor
	
	if((_target is noone) or (_target is undefined))
	{
		//TODO: pick random spot in range.
		
		throw "InvalidArgumentException";
	}
	
	self.target = _target;
	
	self.lerpDuration = _lerpDuration;
	
	return;
	
	#endregion
	
	#region Methods
	
	static Start = function()
	{
		self.position_target = new vec2(target.x, target.y);
		self.position_user   = new vec2(user.x, user.y);

		
		self.a = position_user;
		self.b = new vec2(a.x, a.y - (12 UNITS));
		
		self.d = position_target;
		self.c = new vec2(d.x, d.y - (12 UNITS));
		
		self.timeElapsed = 0;
		
		Debug.Log("Start");
		
		//face player direction.
		
		//check if can jump to player else return failure
		
		//calculate bezier curve
	}
	
	static Update = function()
	{
		//interpolate further along Bezier curve by time.
		
		//TODO: Use animation curve for believable movement.
		
		if(timeElapsed < lerpDuration)
		{
			timeElapsed += Time.deltaTime; //at start of function because I find the end position more important than the begin position.
			
			var _t = clamp((timeElapsed / lerpDuration), 0, 1);
			
			var _pos = BezierInterpolate(a, b, c, d, _t);
			Debug.DrawBezier(a, b, c, d);
		
			Debug.Log(_t);
			
			//Debug.DrawCircle(/*point */_pos, /*radius*/ 5);
		
			//Debug.Log(_pos.ToString());
		
			user.x = _pos.x;
			user.y = _pos.y;
			
			return CONTINUE;
		}
		else
		{
			return SUCCES;
		}
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