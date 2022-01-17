// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function PlayerState_Attack_Weapon_1() {

if(weapon=1){ // sword
	ProcessAttack(sp_player_sword_attack_first,sp_player_sword_attack_first_HB);
	
		if (keyAttack) && (image_index >= 6)
	{	
		//state = PLAYERSTATE.WEAPON_2;
	}

	if (animation_end())
	{
		//sprite_index = sp_player_idle;
		//state = PLAYERSTATE.FREE;
		state = PLAYERSTATE.WEAPON_2;
	}
}
else if(weapon=2){ // hammer
	
	ProcessAttack(sp_player_hammer_attack,sp_player_hammer_attack_HB);
	
	if(image_index>8){
	if(!instance_exists(hammer_hit_effect)){
	instance_create_layer(x,y,"Player",hammer_hit_effect);
	}
screenshake_hard();
}
	
	if (animation_end())
	{
		sprite_index = sp_player_idle;
		state = PLAYERSTATE.FREE;
	}
}
else if(weapon=3){ // scythe
	
	ProcessAttack(sp_player_scythe_attack_first,sp_player_scythe_attack_first_HB);
	
	if (animation_end())
	{
		//sprite_index = sp_player_idle;
		//state = PLAYERSTATE.FREE;
		state = PLAYERSTATE.WEAPON_2;
	}
}
else if(weapon=4){ // my beloved
	ProcessAttack(sp_player_exc_attack,sp_player_exc_attack_HB);

layer_set_visible("Effect_1",visible);
		
	if(image_index>18){
		layer_set_visible("Effect_1",false);
screenshake_hard();
}
	
	if (animation_end())
	{
		
		sprite_index = sp_player_idle;
		state = PLAYERSTATE.FREE;
	}
}
else if(weapon=5){ // gauntlets
	ProcessAttack(sp_player_gauntlets_attack_first,sp_player_gauntlets_attack_first_HB);
	
	
	
	if (animation_end())
	{
		//sprite_index = sp_player_idle;
		//state = PLAYERSTATE.FREE;
			state = PLAYERSTATE.WEAPON_2;
	}
}


	
}

function PlayerState_Attack_Weapon_2() {

if(weapon=1){ // sword
	ProcessAttack(sp_player_sword_attack_second,sp_player_sword_attack_second_HB);
	
		if (keyAttack) && (image_index >= 3)
	{	
		//state = PLAYERSTATE.WEAPON_3;
	}

	if (animation_end())
	{
		//sprite_index = sp_player_idle;
		//state = PLAYERSTATE.FREE;
		state = PLAYERSTATE.WEAPON_3;	
	}
}
else if(weapon=2){ // hammer
	
	ProcessAttack(sp_player_hammer_attack,sp_player_hammer_attack_HB);
	
	if(image_index>8){
	if(!instance_exists(hammer_hit_effect)){
	instance_create_layer(x,y,"Player",hammer_hit_effect);
	}
screenshake();
}
	
	if (animation_end())
	{
		sprite_index = sp_player_idle;
		state = PLAYERSTATE.FREE;
	}
}
else if(weapon=3){ // scythe
	
	ProcessAttack(sp_player_scythe_attack_second,sp_player_scythe_attack_second_HB);
	
	if (animation_end())
	{
		//sprite_index = sp_player_idle;
		//state = PLAYERSTATE.FREE;
		state = PLAYERSTATE.WEAPON_3;
	}
}
else if(weapon=4){ // my beloved 2
	ProcessAttack(sp_player_exc_attack,sp_player_exc_attack_HB);

layer_set_visible("Effect_1",visible);
		
	if(image_index>18){
		layer_set_visible("Effect_1",false);
screenshake_hard();
}
	
	if (animation_end())
	{
		
		sprite_index = sp_player_idle;
		state = PLAYERSTATE.FREE;
	}
}
else if(weapon=5){ // gauntlets
	ProcessAttack(sp_player_gauntlets_attack_second,sp_player_gauntlets_attack_second_HB);
	

screenshake_hard();

	
	
	if (animation_end())
	{
		//sprite_index = sp_player_idle;
		//state = PLAYERSTATE.FREE;
		state = PLAYERSTATE.WEAPON_3;
	}
}


	
}

function PlayerState_Attack_Weapon_3() {

if(weapon=1){ //sword
	ProcessAttack(sp_player_sword_attack_third,sp_player_sword_attack_third_HB);
	

	if (animation_end())
	{
		sprite_index = sp_player_idle;
		state = PLAYERSTATE.FREE;
	}
}
else if(weapon=2){ // hammer
	
	ProcessAttack(sp_player_hammer_attack,sp_player_hammer_attack_HB);
	
	if(image_index>8){
	if(!instance_exists(hammer_hit_effect)){
	instance_create_layer(x,y,"Player",hammer_hit_effect);
	}
screenshake();
}
	
	if (animation_end())
	{
		sprite_index = sp_player_idle;
		state = PLAYERSTATE.FREE;
	}
}
else if(weapon=3){ // scythe
	
	ProcessAttack(sp_player_scythe_attack_third,sp_player_scythe_attack_third_HB);
	
	if (animation_end())
	{
		sprite_index = sp_player_idle;
		state = PLAYERSTATE.FREE;
	}
}
else if(weapon=4){ // my beloved
	ProcessAttack(sp_player_exc_attack,sp_player_exc_attack_HB);

layer_set_visible("Effect_1",visible);
		
	if(image_index>18){
		layer_set_visible("Effect_1",false);
screenshake_hard();
}
	
	if (animation_end())
	{
		
		sprite_index = sp_player_idle;
		state = PLAYERSTATE.FREE;
	}
}
else if(weapon=5){ // gauntlets
	ProcessAttack(sp_player_gauntlets_attack_third,sp_player_gauntlets_attack_third_HB);
	
	
	
	if (animation_end())
	{
		sprite_index = sp_player_idle;
		state = PLAYERSTATE.FREE;
	}
}


	
}









function ProcessAttack(argument0, argument1) {
	//Start of the attack
	if (sprite_index != argument0)
	{
		sprite_index = argument0
		image_index = 0;	
		ds_list_clear(hitByAttack);
	}

	//Use attack hitbox & check for hits
	mask_index = argument1;
	var hitByAttackNow = ds_list_create()
	var hits = instance_place_list(x,y,obj_enemy,hitByAttackNow,false);
	if (hits > 0)
	{
		for (var i = 0; i < hits; i++)
		{
			//if this instance has not yet been hit by this attack, hit it
			var hitID = hitByAttackNow[| i]
			if (ds_list_find_index(hitByAttack,hitID) == -1)
			{
				ds_list_add(hitByAttack,hitID);
				with (hitID)
				{
					instance_create_layer(obj_enemy.x,obj_enemy.y,"Above",blood_effect);
					
						screenshake();
					EnemyHit(1);
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = sp_player_idle;




}

function EnemyHit(argument0) { //enemy takes damage
	var _damage = argument0;




	hp -= _damage;
	flash = true;
	if (hp > 0)
	{
		state = ENEMYSTATE.HIT;
		hitNow = true;
	}
	else
	{
		state = ENEMYSTATE.DEAD;
	}



}
