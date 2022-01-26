stateMachine = new StateMachine(/*user*/ id);

stateMachine
	.Add(new Random()
		.Add(new Sequence()
			.Add(new IsInRange(/*target*/ obj_player, /*min*/ 2 UNITS, /*max*/ 20 UNITS) )
			.Add(new JumpTo(   /*target*/ obj_player) )
			.Add(new Wait(/*seconds */ 3.0) )
			)
		.Add(new Sequence()
			.Add(new Anim(/*sequence */ seq_Golem_Slam, /*position */ new vec2(x, y), /*layer */"Attacks") )
			.Add(new Wait(/*seconds */ 0.2) )
			)
		);
	
stateMachine.Start();