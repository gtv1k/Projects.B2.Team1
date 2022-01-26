	if(Time.time >= self.endTime)
	{
		if (global.good)
		{room_goto(r_good_ending);}
		else
		{room_goto(r_bad_ending);}
		
	}
