


Patrol = function()
{
	
}


Chase = function()
{
	
}


Attack = function()
{
	if (distance_to_object(oPlayer) >= 1.6 METRES)
	{
		State = Chase;
	}
}


State = Patrol;

hp = 50;
damage = 10;