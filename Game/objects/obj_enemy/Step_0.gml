
event_inherited(); //so it will inherit from par_speaker
keyAttack = keyboard_check_pressed(ord("H")) || keyboard_check_pressed(ord("Z"));

switch (state)
{
	case ENEMYSTATE.FREE: EnemyState_Free(); break;
	case ENEMYSTATE.HIT: EnemyState_Hit(); break;
	case ENEMYSTATE.DEAD: EnemyState_Dead(); break;

	case ENEMYSTATE.ATTACK_SLASH: EnemyState_Attack_Slash(); break;
	case ENEMYSTATE.ATTACK_COMBO: EnemyState_Attack_Combo(); break;
}

image_xscale = sign(obj_player.x - x);