//Basic keyboard layout for movement
key_jump = keyboard_check_pressed(ord("W"));
key_crouch = keyboard_check(ord("S"));
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_dash = keyboard_check_pressed(vk_shift)
key_check = true;



var move = key_right - key_left;

velocity.x = move * spd;
velocity.y += grv;

if (key_crouch)
{
	sprite_index = sPlayer_crouch;
	key_check = false;
	
}
else
{
	sprite_index = sPlayer;
	key_check = true;
}


if (key_check == true)
{
	if (place_meeting(x, y+1, oWall)) && (key_jump)
	{
		velocity.y = -7;
	}
}


// colliders
function colliders()
{
	if (place_meeting(x+velocity.x, y, oWall))
	{
		while (!place_meeting(x+sign(velocity.x), y, oWall))
		{
			x = x + sign(velocity.x);
		}	
		velocity.x = 0;
	}

	x += velocity.x;


	if (place_meeting(x, y+velocity.y, oWall))
	{
		while (!place_meeting(x, y+sign(velocity.y), oWall))
		{
			y = y + sign(velocity.y);
		}	
		velocity.y = 0;
	}
	
	y += velocity.y;
}
colliders()

//Dash, uses built in collider
if (key_right) and (key_dash) or (key_left) and (key_dash)
{
	for (xa=0; xa != 6; xa++)
	{
		x += sign(velocity.x) * 4;
		colliders();
	}
}

position.x = x;
position.y = y;




