//Basic keyboard layout for movement
key_jump   = input_check_pressed(Inputs.Up);
key_crouch = input_check(Inputs.Down);
key_left   = input_check(Inputs.Left);
key_right  = input_check(Inputs.Right);
key_dash   = keyboard_check_pressed(vk_shift);



var move = key_right - key_left;

hspd = move * movspd;
vspd = vspd + grv;

if (place_meeting(x, y+1, oStr)) && (key_jump)
{
	vspd = -7;
}



// colliders
function colliders()
{
	if (place_meeting(x+hspd, y, oStr))
	{
		while (!place_meeting(x+sign(hspd), y, oStr))
		{
			x = x + sign(hspd);
		}
		hspd = 0;
	}

	x = x + hspd;


	if (place_meeting(x, y+vspd, oStr))
	{
		while (!place_meeting(x, y+sign(vspd), oStr))
		{
			y = y + sign(vspd);
		}	
		vspd = 0;
	}
	
	y = y + vspd;
}
colliders()

//Dash, uses built in collider
if (key_right) and (key_dash) or (key_left) and (key_dash)
{
	for (xa=0; xa != 6; xa++)
	{
		x += 4;
		colliders()
	}
}