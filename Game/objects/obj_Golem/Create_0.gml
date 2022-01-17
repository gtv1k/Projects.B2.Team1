stateMachine = new StateMachine(/*user*/ self);

stateMachine
	.Add(new Sequence()
		//.Add(new Slam(/*target */ oPlayer))
		.Add(new Wait(/*seconds*/ 1))
		.Add(new Log(/* message*/ "Something"))
		.Add(new Wait(/*seconds*/ 1))
		.Add(new Log(/* message*/ "Something different")));
	
stateMachine.Start();