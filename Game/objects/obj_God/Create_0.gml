function IsTargetRightSide()
{
	return (obj_player.x > self.x);
}

function GroundPos()
{
	var _ray = new Ray(new vec2(x, y), V_DOWN, obj_wall);
	var _hitInfo = _ray.Cast();
		
	if(_hitInfo != null)
	{
		return  _hitInfo.point;
	}
	
	return new vec2(x, y);
}

stateMachine = new StateMachine(/*user*/ id);
stateMachine
		.Add
		(new Random()
			.Add
			(new Sequence()
				.Add(new Wait( /*seconds*/ 0.2) )
				//.Add(new Log("A") )
				.Add(new Anim(/*sequence*/ seq_God_EnergyCircle, /*position */new vec2(x, y - (1 UNIT)), /*layer*/ "Attacks", /*awaitCompletion*/ false, /*mirror*/ false, /*scale*/0.5) )
				.Add(new Wait( /*seconds*/ 5.0) )
			)
			.Add
			(new Sequence()
				.Add(new Wait( /*seconds*/ 0.2) )
				//.Add(new Log("B") )
				.Add(new Anim(/*sequence*/ seq_God_EnergyCircle, /*position */new vec2(x, y - (1 UNIT)), /*layer*/ "Attacks", /*awaitCompletion*/ false, /*mirror*/ true, /*scale*/0.5) )
				.Add(new Wait( /*seconds*/ 6.0) ) //6.0) )
			)
			
			//Balls
			.Add
			(new Sequence()
				.Add(new Wait( /*seconds*/ 0.1) )
				//.Add(new Log("C") )
				.Add(new Anim(/*sequence*/ seq_God_EnergyBalls, /*position */new vec2(x, y - (1 UNIT)), /*layer*/ "Attacks", /*awaitCompletion*/ false, /*mirror*/ true) )
				.Add(new Wait( /*seconds*/ 0.5) ) //0.5) )
				.Add(new Anim(/*sequence*/ seq_God_EnergyBalls, /*position */new vec2(x, y - (1 UNIT)), /*layer*/ "Attacks", /*awaitCompletion*/ false, /*mirror*/ false) )
				.Add(new Wait( /*seconds*/ 0.7) ) //0.5) )
			)
			.Add
			(new Sequence()
				.Add(new Wait( /*seconds*/ 0.1) )
				//.Add(new Log("D") )
				.Add(new Anim(/*sequence*/ seq_God_EnergyBalls, /*position */new vec2(x, y - (1 UNIT)), /*layer*/ "Attacks", /*awaitCompletion*/ false, /*mirror*/ true) )
				.Add(new Wait( /*seconds*/ 0.5) )
			)
			.Add
			(new Sequence()
				.Add(new Wait( /*seconds*/ 0.1) )
				//.Add(new Log("E") )
				.Add(new Anim(/*sequence*/ seq_God_EnergyBalls, /*position */new vec2(x, y - (1 UNIT)), /*layer*/ "Attacks", /*awaitCompletion*/ false, /*mirror*/ false) )
				.Add(new Wait( /*seconds*/ 0.5) ) //0.5) )
			)
			//End balls
			
			.Add
			(new Sequence()
				.Add(new Wait( /*seconds*/ 0.1) )
				//.Add(new Log("F") )
				.Add(new Anim(/*sequence*/ seq_God_SwordRoll, /*position */new vec2(obj_player.x, obj_player.y), /*layer*/ "Attacks", /*awaitCompletion*/ false, /*mirror*/ false) )
				.Add(new Wait( /*seconds*/ 0.5) ) //1.5) )
			)
			.Add
			(new Sequence()
				.Add(new Wait( /*seconds*/ 0.3) )
				//.Add(new Log("G") )
				.Add(new Anim(/*sequence*/ seq_God_SwordRoll, /*position */new vec2(obj_player.x, obj_player.y), /*layer*/ "Attacks", /*awaitCompletion*/ false, /*mirror*/ true) )
				.Add(new Wait( /*seconds*/ 0.2) ) //1.0) )
			)
			
			//.Add
			//(new Sequence()
			//	.Add(new Wait( /*seconds*/ 0.1) )
			//	//TODO: Shoot in direction of player.
			//	.Add(new Log("C") )
			//	.Add(new Anim(/*sequence*/ seq_God_EnergyBalls, /*position */new vec2(x, y - (1 UNIT)), /*layer*/ "Attacks", /*awaitCompletion*/ false, /*mirror*/ !IsTargetRightSide()))
			//	.Add(new Log("Target is on Right Side?: ", IsTargetRightSide()) )
			//	.Add(new Wait( /*seconds*/ 0.1) ) //0.5) )
			//)
		);
stateMachine.Start();

		//.Add
			//(new Sequence()
			//	.Add(new Anim(/*sequence*/ seq_God_Energyballs, /*position */new vec2(x, y), /*layer*/ "Attacks", /*awaitCompletion*/ true))
			//	.Add(new Wait( /*seconds*/ 1.0) )
			//)
			
			//(new Sequence()
			//	.Add(new Anim(/*sequence*/ seq_God_FallingRocks, /*position */new vec2(x, y - 500), /*layer*/ "Attacks", /*awaitCompletion*/ true))
			//	.Add(new Wait( /*seconds*/ 1.0) )
			//	.Add(new Anim(/*sequence*/ seq_God_FallingRocks, /*position */new vec2(x + 150, y - 600), /*layer*/ "Attacks", /*awaitCompletion*/ true))
			//	.Add(new Wait( /*seconds*/ 1.5) )
			//	.Add(new Anim(/*sequence*/ seq_God_FallingRocks, /*position */new vec2(x - 200, y - 400), /*layer*/ "Attacks", /*awaitCompletion*/ true))
			//	.Add(new Wait( /*seconds*/ 5.0) )
			//)