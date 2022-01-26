function EnemyState_Free() {
	sprite_index = ENEMY_IDLE;//idle

		if (keyAttack) state = ENEMYSTATE.ATTACK_SLASH;
		var inst;
inst = collision_rectangle(x-10, y-10, x+10, y+10, obj_player, false, true);
if inst != noone
   {
   state=ENEMYSTATE.ATTACK_SLASH;
   }



}
function EnemyState_Dead() {
	if (sprite_index != ENEMY_IDLE) //death animation
	{
		sprite_index = ENEMY_IDLE;
		image_index = 0;
	}

	if (animation_end()) instance_destroy();




}
function EnemyState_Hit() {
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
		state = ENEMYSTATE.FREE;
	}


}
