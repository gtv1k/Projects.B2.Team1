stateMachine = new StateMachine(/*user*/ id);

stateMachine
		.Add(new Random()
			.Add(new Sequence()
				.Add(new IsInRange(/*target*/ oPlayer, /*min*/ 2 UNITS, /*max*/ 20 UNITS))
				.Add(new Log(/*message*/ "Player is in Range."))
				.Add(new JumpTo(   /*target*/ oPlayer))
				.Add(new Log(/*message*/ "JumpTo Finished"))
				.Add(new Wait(/*seconds */ 6))
				)
			.Add(new Sequence()
				.Add(new Log( /*message */ "Rughaar"))
				.Add(new Wait(/*seconds */ 3))
				)
			);
	
	//.Add(new Log(/*message*/ "X"))
	//.Add(new Log(/*message*/ "O"))
	
stateMachine.Start();