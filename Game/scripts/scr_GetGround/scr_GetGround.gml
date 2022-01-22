function GetGround(_inPos, _outPos, _maxDistance = infinity) : Action() constructor
{
	#region Constructor
	
	if((_outPos is noone) or (_outPos is undefined))
	{
		throw "InvalidArgumentException";
	}
	
	self.in  = _inPos;
	self.out = _outPos;
	
	self.maxDistance = _maxDistance;
	
	self.hasCheckedGround = false;
	
	return;
	
	#endregion
	
	#region Methods
	
	static Start = function()
	{
		self.hasCheckedGround = false;
	}
	
	static Update = function()
	{
		//if(!hasCheckedGround)
	
		var _ray = new Ray(in, down);
		
		var _hitInfo = _ray.Cast();
		
		if(_hitInfo != null)
		{
			out.Set(_hitInfo.point); //TODO cache result? Maybe based on inPos, we don't have any moving platforms yet anyways..
			
			Debug.Log("Hit", out.Get());
			
			return SUCCES;
		}
		else
		{
			return FAILURE;
		}
	}
	
	#endregion
}