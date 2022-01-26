function EnemyState_Attack_Slash() {


	ProcessAttackEnemy(sp_enemy_attack,sp_enemy_attack_HB);

	if (keyAttack) && (image_index > 2)
	{	
		state = ENEMYSTATE.ATTACK_COMBO;	
	}

	if (animation_end())
	{
		sprite_index = ENEMY_IDLE;
		state = ENEMYSTATE.FREE;
	}
}
function EnemyState_Attack_Combo() {


	ProcessAttackEnemy(sp_enemy_attack,sp_enemy_attack_HB);

	if (keyAttack) && (image_index > 2)
	{	
		state = ENEMYSTATE.ATTACK_SLASH;	
	}

	if (animation_end())
	{
		sprite_index = ENEMY_IDLE;
		state = ENEMYSTATE.FREE;
	}




}
function ProcessAttackEnemy(argument0, argument1) {
	//Start of the attack
	if (sprite_index != argument0)
	{
		sprite_index = argument0
		image_index = 0;	
		ds_list_clear(hitByAttackEnemy);
	}

	//Use attack hitbox & check for hits
	mask_index = argument1;
	var hitByAttackNow = ds_list_create()
	var hits = instance_place_list(x,y,obj_player,hitByAttackNow,false);
	if (hits > 0)
	{
		for (var i = 0; i < hits; i++)
		{
			//if this instance has not yet been hit by this attack, hit it
			var hitID = hitByAttackNow[| i]
			if (ds_list_find_index(hitByAttackEnemy,hitID) == -1)
			{
				ds_list_add(hitByAttackEnemy,hitID);
				with (hitID)
				{
					PlayerHit(1);
					screenshake();
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = ENEMY_IDLE;




}

function PlayerHit(argument0) {
	var _damage = argument0;

	hp -= _damage;
	flash = true;
	if (hp > 0)
	{
		state = PLAYERSTATE.HIT;
		hitNow = true;
	}
	else
	{
		state = PLAYERSTATE.DEAD;
	}


}

