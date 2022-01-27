stateMachine = new StateMachine(/*user*/ id);
		
//sprite_index = sp_golem_smash;

//image_speed = 1;

flash = false;
golemHits = new List();

hp = 6;

stateMachine
	.Add
	(new Random()
		.Add
		(new Sequence()
			.Add(new IsInRange(/*target*/ obj_player, /*min*/ 2 UNITS, /*max*/ 20 UNITS) )
			.Add(new JumpTo(   /*target*/ obj_player) )
			.Add(new Seq(seq_Golem_Smash, /*position*/ null , /*layer*/ "Attacks") )
			.Add(new Wait(/*seconds */ 2.0) )
		)
		.Add
		(new Sequence()
			.Add(new IsInRange(/*target*/ obj_player, /*min*/ 2 UNITS, /*max*/ 25 UNITS) )
			.Add(new JumpTo(   /*target*/ obj_player) )
			.Add(new Seq(seq_Golem_Smash, /*position*/ null , /*layer*/ "Attacks") )
			.Add(new Wait(/*seconds */ 3.0) )
		)
		.Add
		(new Sequence()
			//.Add(new Anim(/*sequence */ seq_Golem_Slam, /*position */ new vec2(x, y), /*layer */"Attacks") )
			.Add(new SmashAttack() )
			.Add(new Wait(/*seconds */ 0.5) )
			.Add(new Seq(seq_Golem_Smash, /*position*/ null , /*layer*/ "Attacks") )
			.Add(new Screenshake() )
			.Add(new Wait(/*seconds */ 0.6) )
			.Add(new SetAnim(/*animation */ sp_golem_idle) )
			.Add(new Wait(/*seconds */ 1.5) )
		)
	);
	
stateMachine.Start();