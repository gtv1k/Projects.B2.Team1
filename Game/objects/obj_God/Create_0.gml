stateMachine = new StateMachine(/*user*/ id);

groundPos = new vec2(0, 0);

var _groundPosRef = new Ref("groundPos");

stateMachine
		.Add
		(new Random()
			.Add
			(new Sequence()
				.Add(new Anim(/*sequence*/ seq_God_FallingRocks, /*position */new vec2(x, y - 500), /*layer*/ "Attacks", /*awaitCompletion*/ true))
				.Add(new Wait( /*seconds*/ 1.0) )
				.Add(new Anim(/*sequence*/ seq_God_FallingRocks, /*position */new vec2(x + 150, y - 600), /*layer*/ "Attacks", /*awaitCompletion*/ true))
				.Add(new Wait( /*seconds*/ 1.5) )
				.Add(new Anim(/*sequence*/ seq_God_FallingRocks, /*position */new vec2(x - 200, y - 400), /*layer*/ "Attacks", /*awaitCompletion*/ true))
				.Add(new Wait( /*seconds*/ 5.0) )
			)
			.Add
			(new Sequence()
				.Add(new Wait( /*seconds*/ 0.25) )
				.Add(new Anim(/*sequence*/ seq_God_OrbitalLaser, /*position */new vec2(x, y), /*layer*/ "Attacks", /*awaitCompletion*/ true))
				.Add(new Wait( /*seconds*/ 3.0) )
			)
		);
	
stateMachine.Start();