stateMachine = new StateMachine(/*user*/ id);

stateMachine
		.Add(new Sequence()
			.Add(new Anim(/*sequence*/ seq_God_FallingRocks, /*position */new vec2(x, y), /*layer*/ "Attacks", /*awaitCompletion*/ true))
			.Add(new Log("HELLUP"))
			.Add(new Wait( /*seconds*/ 1.0))
			);
	
stateMachine.Start();