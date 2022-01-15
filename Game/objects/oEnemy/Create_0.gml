
dir = -1;
//velocity.x = 0;
//velocity.y = 0;
grv = 0.3;
spd = 3;

velocity = new vec2(0, 0);
position = new vec2(x, y);


timeElapsed = 0;

Patrol = function()
{
	chaserange = 10 METRES;
	if (distance_to_object(oPlayer) <= chaserange)
	{
		State = Chase;
	}
		
	velocity.x = dir * spd;
	x += velocity.x;	
}


Chase = function()
{
	targetX = sign(oPlayer.x - x);
	if (distance_to_object(oPlayer) <= 1.5 METRES)
	{ 
		State = Attack;
	}
	
	else if ((distance_to_object(oPlayer) > chaserange) and (timeElapsed >= 10))
	{
		timeElapsed = 0;
		State = Patrol;
	}
	
	else if ((distance_to_object(oPlayer) > chaserange))
	{
		timeElapsed += Time.deltaTime;
	}
	
	x += targetX * spd;
}


Attack = function()
{
	if (distance_to_object(oPlayer) >= 1.6 METRES)
	{
		State = Chase;
	}
}


State = Patrol;