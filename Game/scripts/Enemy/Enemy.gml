function EnemyState_Free() {
	sprite_index = sp_enemy_dummy;//idle

		if (keyAttack) state = ENEMYSTATE.ATTACK_SLASH;



}
function EnemyState_Dead() {
	if (sprite_index != sp_enemy_death) //death animation
	{
		sprite_index = sp_enemy_death;
		image_index = 0;
	}

	if (animation_end()) instance_change(obj_corpse,true);




}
function EnemyState_Hit() {
	//Just hit
	
	if (hitNow)
	{
		
		sprite_index = sp_enemy_hit;//hit
		image_index = 0;
			
		
		hitNow = false;
		frameCount = 0;
	}

	frameCount++;
	if (frameCount > 10) 
	{
		frameCount = 0;
		state = ENEMYSTATE.FREE;
	}


}
