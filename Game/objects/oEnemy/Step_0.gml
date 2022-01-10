/// @description Insert description here
// You can write your code in this editor
function colliders()
{
	if (place_meeting(x+velocity.x, y, oWall))
	{
		while (!place_meeting(x+sign(velocity.x), y, oWall))
		{
			x = x + sign(velocity.x);
		}	
		dir = -dir;
	}




	if (place_meeting(x, y+velocity.y, oWall))
	{
		while (!place_meeting(x, y+sign(velocity.y), oWall))
		{
			y = y + sign(velocity.y);
		}	
		dir = -dir;
		velocity.y = 0;
	}
}


State();
colliders();

