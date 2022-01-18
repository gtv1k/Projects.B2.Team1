stateMachine = new StateMachine(/*user*/ id);

stateMachine
	.Add(new Sequence()
		.Add(new Wait(/*seconds*/ 1))
		.Add(new Slam(/*target */ oPlayer))
		//.Add(new Log(/* message*/ "Something"))
		.Add(new Wait(/*seconds*/ 20))
		.Add(new Log(/* message*/ "Something different")));
	
stateMachine.Start();