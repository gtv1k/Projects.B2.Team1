//if ((boss_instance != noone) and (boss_instance != undefined))
//	{
//		x = boss_instance.x;
//		y = boss_instance.y;
//	}

IsInRange = (self.position.DistanceTo(oPlayer.position) <= range METRES);

if(not started)
{
    if(use_input)
    {
        if(I_USE and IsInRange)
        {
			StartDialogue();   
        }
    }
    else //us range instead
    {
        if(IsInRange)
        {
            StartDialogue();
        }
    }
}
if (started)
{
	if (IsInRange)
	{
		dialogue.isPaused = false;
	}
	else
	{
		dialogue.isPaused = true;
	}
}


function StartDialogue()
{
	started = true;
    instance_create_layer(position.x, position.y, "Dialogue", dialogue);
}
	//if ((boss != noone) and (boss != undefined)) 
	//{
	//	instance_create_layer(position.x, position.y, "Instances", boss);
	//}
	//else
	//{	
	//	ChatterboxJump(chatterbox, start);
	//	refresh_text_elements();
	//}

	
//if (!ChatterboxIsStopped(chatterbox))
//{
//    //Iterate over all of our text elements and draw them
//    //We cache text elements for drawing in refresh_text_elements()
//    var _i = 0;
//    repeat(array_length(text_elements))
//    {
//        //Get our text element and position
//        var _struct = text_elements[_i];
//        var _x       = _struct.x;
//        var _y       = _struct.y;
//        var _element = _struct.element;
//        var _typist  = _struct.typist;
        
//        //Draw the text element
//        _element.draw(_x, _y, _typist);
        
//        //Break out of the loop if this text element hasn't finished fading in
//        if (_typist.get_state() < 1.0) break;
//        //Autotype will only happen when you actually draw the text element
//        //This means if we don't want to fade text in we can just... not draw it
        
//        ++_i;
//    }
//}
