//---You can update variables here!---//
reset_dialogue_defaults();


switch(choice_variable){
	case -1:
	#region First Dialogue
		//Line 0
		var i = 0;
		myText[i]		= "Wooow, I am finally freed.";
		mySpeaker[i]	= id;
		myScripts[i]	= [create_instance_layer, 170,120,"Instances",obj_emote];
		
		//Line 1
		i++;
		myText[i]		= "What are you going to do now?";
		mySpeaker[i]	= id;
		
		//Line 2
		i++;
		myText[i]		= ["[Seduce]", "[Devour]"];
		myTypes[i]		= 1;
		mySpeaker[i]	= obj_player;
		myScripts[i]	= [[create_instance_layer, 170,120,"Instances",obj_enemy], [create_instance_layer, 170,120,"Instances",obj_wall]];
		myNextLine[i]	= [0,0];
		
		//Line 3
		i++;
		myText[i]		= "[It's highly effective!]";
		mySpeaker[i]	= id;
		
		//Line 4
		i++;
		myText[i]		= "[Oops, something went wrong]";
	//	myEffects[i]	= [13,1, 18,0];
		mySpeaker[i]	= id;
		//myTextCol[i]	= [13, c_lime, 18, c_white];

		//Line 5
		i++;
		myText[i]		= "[Horribly wrong, Culture is stunned!]";
		myEmotion[i]	= 1;
		myEmote[i]		= 0;
		mySpeaker[i]	= id;
		//myTextCol[i]	= [14, c_aqua, 18, c_white];
//
		//Line 6
		i++;
		myText[i]		= "[What do you do now?]";
		myTextSpeed[i]	= [1,0.5, 10,0.1];
		myEmotion[i]	= 0;
		myEmote[i]		= 4;
		mySpeaker[i]	= id;
	//	myTextCol[i]	= [11, c_red, 18, c_white];

		//Line 7
		i++;
		myText[i]		= ["[Bury]", "[Harvest culture]"];
		myTypes[i]		= 1;
		myNextLine[i]	= [8,9];
		myScripts[i]	= [[change_variable, id, "choice_variable", "blue"], [change_variable, id, "choice_variable", "green"]];
		mySpeaker[i]	= obj_player;

		//Line 8
		i++;
		myText[i]		= "[You have no shovel]";
		myEmotion[i]	= 0;
		myEmote[i]		= 0;
		myNextLine[i]	= -1;
		mySpeaker[i]	= id;

		//Line 9
		i++;
		myText[i]		= "[Culture X acquired!]";
		myTextSpeed[i]	= [1,1, 6,0.3, 10,1];
		myEmotion[i]	= 2;
		myEmote[i]		= 9;
		mySpeaker[i]	= id;
		#endregion
	break;
	
	case "green":
	#region If you chose green
		var i = 0;
		//Line 0
		myText[i]		= "You seem familiar, do I know you?";
		myTextSpeed[i]	= [1, 0.3];
		myEmotion[i]	= 2;
		myEmote[i]		= 9;
		mySpeaker[i]	= id;
	//	myTextCol[i]	= [26,c_lime, 31,c_white];
		
		//uncommenting this will make the first conversation begin again
		//choice_variable	= -1;
	#endregion
	
	break;
	
	case "blue":
	#region If you chose blue
		var i = 0;
		//Line 0
		myText[i]		= "I know what you tried to do...";
		myTextSpeed[i]	= [1,1, 10,0.5];
		myEmotion[i]	= 1;
		myEmote[i]		= 0;
		mySpeaker[i]	= id;
//		myTextCol[i]	= [19,c_aqua, 23,c_white];
		
		//uncommenting this will make the first conversation begin again
		//choice_variable	= -1;
	#endregion
	break;
}