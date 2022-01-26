stateMachine = new StateMachine(/*user*/ id);

groundPos = new vec2(0, 0);

var _groundPosRef = new Ref("groundPos");

stateMachine
		.Add
		(new Random()
			.Add
			(new Sequence()
				.Add(new Anim(/*sequence*/ seq_God_EnergyCircle, /*position */new vec2(x, y), /*layer*/ "Attacks", /*awaitCompletion*/ true))
				.Add(new Wait( /*seconds*/ 1.0) )
			)
			.Add
			(new Sequence()
				//.Add(new Wait( /*seconds*/ 0.25) )
				//TODO: Shoot in direction of player.
				.Add(new Anim(/*sequence*/ seq_God_EnergyBalls, /*position */new vec2(x, y), /*layer*/ "Attacks", /*awaitCompletion*/ true))
				.Add(new Wait( /*seconds*/ 5.0) )
			)
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