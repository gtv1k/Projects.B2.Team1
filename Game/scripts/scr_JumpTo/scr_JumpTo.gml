function JumpTo(_target) : Action() constructor
{
	#region Constructor
	
	if((_target is noone) or (_target is undefined))
	{
		//TODO: pick random spot in range.
		
		throw "InvalidArgumentException";
	}
	
	self.target = _target;
	
	//self.jumpDuration = _jumpDuration;
	
	return;
	
	#endregion
	
	#region Methods
	
	static Start = function()
	{
		self.position_target = new vec2(target.x, target.y + (0.5 UNITS));
		self.position_user   = new vec2(user.x, user.y);
		
		var _ray = new Ray(position_target, V_DOWN, obj_wall);
		var _hitInfo = _ray.Cast();
		if(_hitInfo != null)
		{
			position_target = _hitInfo.point;
		}
		

		self.a = position_user;
		self.b = new vec2(a.x, a.y - (5 UNITS));
		
		self.d = position_target;
		self.c = new vec2(d.x, d.y - (12 UNITS));
		
		//self.timeElapsed = 0;
		self.amount = 0;
		
		Debug.Log("JumpTo Start");
		
		//face player direction.
		
		//check if can jump to player else return failure
		
		//calculate bezier curve
	}
	
	static Update = function()
	{
		//interpolate further along Bezier curve by time.
		
		//TODO: Use speed curve instead.
		
		//Debug.DrawBezier(a, b, c, d);
		
		user.sprite_index = sp_golem_idle;
		
		if(amount < 1)
		{
			var _channel   = animcurve_get_channel(/*curve_struct_or_id */ani_GolemSlamSpeed, /*channel_name_or_index */0);
			var _speedMult = animcurve_channel_evaluate(/*channel_struct */_channel, /*posx */amount);
			
			amount += (1 * Time.deltaTime) * _speedMult; //at start of function because I find the end position more important than the begin position.
			
			amount = clamp(amount, 0, 1);
		
			var _pos = BlerpUnclamped(a, b, c, d, amount);
			
			if(amount >= 1)
			{
				screenshake_hard();
			}
		
			//Debug.Log(amount);
		
			user.x = _pos.x;
			user.y = _pos.y;
			
			return CONTINUE;
		}
		else
		{
			//TODO: Screenshake
			//TODO: Shockwave effect.
			//TODO: Particles
			
			return SUCCES;
		}
		
		//if(timeElapsed < jumpDuration)
		//{
		//	timeElapsed += Time.deltaTime; //at start of function because I find the end position more important than the begin position.
			
		//	var _t = clamp((timeElapsed / jumpDuration), 0, 1);
			
		//	var _channel = animcurve_get_channel(/*curve_struct_or_id */ani_GolemSlam, /*channel_name_or_index */0);
		//	var _tween   = animcurve_channel_evaluate(/*channel_struct */_channel, /*posx */_t);
			
		//	var _pos = BezierInterpolate(a, b, c, d, _tween);
		
		//	Debug.Log(_t);
		
		//	user.x = _pos.x;
		//	user.y = _pos.y;
			
		//	return CONTINUE;
		//}
		//else
		//{
		//	return SUCCES;
		//}
	}
	
	/*
	static CanReachPlayer = function()
	{
		var _distanceToTarget = position_user.DistanceTo(position_target);
		
		var _minDistance = 2 UNITS;
		var _maxDistance = 10 UNITS;
		
		var _isInRange = (_distanceToTarget >= _minDistance) and (_distanceToTarget <= _maxDistance);
		
		if(_isInRange)
		{
			
		}
		
		//TODO: Check for collisions.
		
		//TODO: Place endpoint further if it's in the air.
	}
	*/
	
	/*
	static HasLanded = function()
	{
		if (place_meeting(user.x, user.y+1, oWall)) //TODO: Replace oWall
		{
			Debug.Log("HasLanded");
		}
	}
	*/
	
	#endregion
	
	
}