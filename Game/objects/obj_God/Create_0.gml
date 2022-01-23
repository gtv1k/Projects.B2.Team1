stateMachine = new StateMachine(/*user*/ id);

groundPos = new vec2(0, 0);

var _groundPosRef = new Ref("groundPos");

stateMachine
		.Add(new Sequence()
			.Add(new Anim(/*sequence*/ seq_God_FallingRocks, /*position */new vec2(x, y - 500), /*layer*/ "Attacks", /*awaitCompletion*/ true))
			.Add(new Wait( /*seconds*/ 1.0) )
			.Add(new Anim(/*sequence*/ seq_God_FallingRocks, /*position */new vec2(x + 150, y - 600), /*layer*/ "Attacks", /*awaitCompletion*/ true))
			.Add(new Wait( /*seconds*/ 1.5) )
			.Add(new Anim(/*sequence*/ seq_God_FallingRocks, /*position */new vec2(x - 200, y - 400), /*layer*/ "Attacks", /*awaitCompletion*/ true))
			//.Add(new GetGround(/*inPos*/new vec2(x, y), /*outPos*/ _groundPosRef) )
			//.Add(new Log(_groundPosRef.Get()) )
			.Add(new Wait( /*seconds*/ 1000.0) )
			);
	
stateMachine.Start();