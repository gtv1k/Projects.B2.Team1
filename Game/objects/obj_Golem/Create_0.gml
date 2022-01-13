stateMachine = new StateMachine();

stateMachine.Add(new Sequence()
	//.Add(new Slam(/*target */ oPlayer))
	.Add(new Wait(/*seconds*/ 3))
	.Add(new Log(/* message*/ "Rughaar")));
	
stateMachine.Start();