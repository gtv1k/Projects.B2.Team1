stateMachine = new StateMachine(/*user*/ id);

stateMachine
	.Add(new Random()
		.Add(new Sequence()
			.Add(new IsInRange(/*target*/ oPlayer, /*min*/ 2 UNITS, /*max*/ 20 UNITS))
			//.Add(new Log(/*message*/ "Player is in Range."))
			.Add(new JumpTo(   /*target*/ oPlayer))
			//.Add(new Log(/*message*/ "JumpTo Finished"))
			.Add(new Wait(/*seconds */ 5))
			)
		.Add(new Sequence()
			.Add(new Anim(/*sequence */ seq_Golem_Slam, /*position */ new vec2(x, y), /*layer */"Attacks"))
			.Add(new Log( /*message */ "Rughaar"))
			.Add(new Wait(/*seconds */ 4))
			)
		);
	
stateMachine.Start();