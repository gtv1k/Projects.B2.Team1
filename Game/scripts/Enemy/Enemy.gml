
function EnemyState_Patrol() {
	sprite_index=sp_enemy_walk;
chaserange = 10 METRES;
	if (distance_to_object(obj_player) <= chaserange)
	{
		state= ENEMYSTATE.CHASE;
	}
		
	velocity.x = dir * spd;
	x += velocity.x;	

		if (keyAttack) state = ENEMYSTATE.ATTACK_SLASH;



}

function EnemyState_Chase() {
	targetX = sign(obj_player.x - x);
	if (distance_to_object(obj_player) <= 1.5 METRES)
	{ 
		state = ENEMYSTATE.ATTACK_SLASH;
	}
	
	else if ((distance_to_object(obj_player) > chaserange) and (timeElapsed >= 10))
	{
		timeElapsed = 0;
		state= ENEMYSTATE.PATROL;
	}
	
	else if ((distance_to_object(obj_player) > chaserange))
	{
		timeElapsed += Time.deltaTime;
	}
	
	x += targetX * spd;

		 



}
function EnemyState_Deadd() {
	if (sprite_index != sp_enemy_hitler) //death animation
	{
		sprite_index = sp_enemy_hitler;
		image_index = 0;
	}

	if (animation_end()) instance_change(obj_corpse,true);




}
function EnemyState_Hitler() {
	//Just hit
	
	if (hitNow)
	{
		
		sprite_index = sp_enemy_hitler;//hit
		image_index = 0;
			
		
		hitNow = false;
		frameCount = 0;
	}

	frameCount++;
	if (frameCount > 10) 
	{
		frameCount = 0;
		state = ENEMYSTATE.PATROL;
	}


}
