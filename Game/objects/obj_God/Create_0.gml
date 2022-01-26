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
				.Add(new Seq(/*sequence*/ seq_God_EnergyCircle, /*offset */new vec2(0, -(1 UNIT)), /*layer*/ "Attacks", /*awaitCompletion*/ false, new vec2( 0.5, 0.5)) )
				.Add(new Wait( /*seconds*/ 5.0) )
			)
			.Add
			(new Sequence()
				.Add(new Wait( /*seconds*/ 0.2) )
				//.Add(new Log("B") )
				.Add(new Seq(/*sequence*/ seq_God_EnergyCircle, /*offset */new vec2(0, -(1 UNIT)), /*layer*/ "Attacks", /*awaitCompletion*/ false, new vec2(-0.5, 0.5)) )
				.Add(new Wait( /*seconds*/ 6.0) ) //6.0) )
			)
			
			.Add
			(new Sequence()
				.Add(new Seq( /*sequence*/ seq_God_SwordRoll, /*offset */new vec2(0, 0), /*layer*/ "Attacks", /*awaitCompletion*/ true, /*scale*/ new vec2( 0.7, 0.7), /*target*/ obj_player) )
				.Add(new Wait( /*seconds*/ 0.5) )
			)
			
			//Balls
			.Add
			(new Sequence()
				.Add(new Wait( /*seconds*/ 0.1) )
				//.Add(new Log("C") )
				.Add(new Seq( /*sequence*/ seq_God_EnergyBalls, /*offset */new vec2(0, -(1 UNIT)), /*layer*/ "Attacks", /*awaitCompletion*/ false, /*mirror*/ new vec2(-1, 1)) )
				.Add(new Wait( /*seconds*/ 0.5) ) //0.5) )
				.Add(new Seq( /*sequence*/ seq_God_EnergyBalls, /*offset */new vec2(0, -(1 UNIT)), /*layer*/ "Attacks", /*awaitCompletion*/ false, /*mirror*/ new vec2( 1, 1)) )
				.Add(new Wait( /*seconds*/ 0.7) ) //0.5) )
			)
			.Add
			(new Sequence()
				.Add(new Wait( /*seconds*/ 0.1) )
				//.Add(new Log("D") )
				.Add(new Seq( /*sequence*/ seq_God_EnergyBalls, /*offset */new vec2(0, -(1 UNIT)), /*layer*/ "Attacks", /*awaitCompletion*/ false, /*mirror*/ new vec2(-1, 1)) )
				.Add(new Wait( /*seconds*/ 0.5) )
			)
			.Add
			(new Sequence()
				.Add(new Wait( /*seconds*/ 0.1) )
				//.Add(new Log("E") )
				.Add(new Seq( /*sequence*/ seq_God_EnergyBalls, /*offset */new vec2(0, -(1 UNIT)), /*layer*/ "Attacks", /*awaitCompletion*/ true, /*mirror*/ new vec2( 1, 1)) )
				.Add(new Wait( /*seconds*/ 0.5) ) //0.5) )
			)
			//End balls
			
			.Add
			(new Sequence()
				.Add(new Wait( /*seconds*/ 0.1) )
				//.Add(new Log("F") )
				.Add(new Seq( /*sequence*/ seq_God_SwordRoll, /*offset */new vec2(0, 0), /*layer*/ "Attacks", /*awaitCompletion*/ true, /*scale*/ new vec2( 0.7, 0.7), /*target*/ obj_player) )
				.Add(new Wait( /*seconds*/ 0.1) ) //1.5) )
			)
			.Add
			(new Sequence()
				.Add(new Wait( /*seconds*/ 0.3) )
				//.Add(new Log("G") )
				.Add(new Seq( /*sequence*/ seq_God_SwordRoll, /*offset */new vec2(0, 0), /*layer*/ "Attacks", /*awaitCompletion*/ true, /*scale*/ new vec2(-0.7, 0.7), /*target*/ obj_player) )
				.Add(new Wait( /*seconds*/ 0.2) ) //1.0) )
			)
			
			.Add
			(new Sequence()
				.Add(new Seq( /*sequence*/ seq_God_SwordRoll, /*offset */new vec2(0, 0), /*layer*/ "Attacks", /*awaitCompletion*/ true, /*scale*/ new vec2( 0.7, 0.7), /*target*/ obj_player) )
				.Add(new Wait( /*seconds*/ 0.5) )
			)
			.Add
			(new Sequence()
				.Add(new Seq( /*sequence*/ seq_God_SwordRoll, /*offset */new vec2(0, 0), /*layer*/ "Attacks", /*awaitCompletion*/ true, /*scale*/ new vec2(-0.7, 0.7), /*target*/ obj_player) )
				.Add(new Wait( /*seconds*/ 0.7) )
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