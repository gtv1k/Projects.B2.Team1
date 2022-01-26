event_inherited(); //so it will inherit from par_speaker
keyAttack = keyboard_check_pressed(ord("H")) || keyboard_check_pressed(ord("Z"));

switch (state)
{
	case ENEMYSTATE.PATROL: EnemyState_Patrol(); break;
	case ENEMYSTATE.CHASE: EnemyState_Chase(); break;
	case ENEMYSTATE.HIT: EnemyState_Hitler(); break;
	case ENEMYSTATE.DEAD: EnemyState_Deadd(); break;

	case ENEMYSTATE.ATTACK_SLASH: EnemyState_Attack_Slash(); break;

}

image_xscale = sign(obj_player.x - x);

function colliders()
{
	if (place_meeting(x+velocity.x, y, obj_wall))
	{
		while (!place_meeting(x+sign(velocity.x), y, obj_wall))
		{
			x = x + sign(velocity.x);
		}	
		dir = -dir;
	}




	if (place_meeting(x, y+velocity.y, obj_wall))
	{
		while (!place_meeting(x, y+sign(velocity.y), obj_wall))
		{
			y = y + sign(velocity.y);
		}	
		dir = -dir;
		velocity.y = 0;
	}
}



colliders();