stateMachine = new StateMachine(/*user*/ id);

groundPos = new vec2(0, 0);

var _groundPosRef = new Ref("groundPos");

stateMachine
		.Add(new Sequence()
			.Add(new Wait( /*seconds*/ 0.5) )
			.Add(new Anim(/*sequence*/ seq_God_FallingRocks, /*position */new vec2(x, y), /*layer*/ "Attacks", /*awaitCompletion*/ true))
			//.Add(new GetGround(/*inPos*/new vec2(x, y), /*outPos*/ _groundPosRef) )
			//.Add(new Log(_groundPosRef.Get()) )
			//.Add(new Wait( /*seconds*/ 3.0) )
			);
	
stateMachine.Start();