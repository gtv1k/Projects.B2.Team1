// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Crouching(){
if(sprite_index!=sp_player_crouching){
	image_index=0;
sprite_index=sp_player_crouching;
}
if(animation_end()){
state=PLAYERSTATE.CROUCH;
}
}

function PlayerState_Crouch(){

if (keyboard_check_pressed(ord("S"))){
		state=PLAYERSTATE.FREE;
}
	// Calculate movement
var move = key_right - key_left;

hsp = move * walksp;

//vsp = vsp + grv;

// Jumping
if (place_meeting(x, y + 1, obj_wall)) and key_jump {
	vsp = -6;//-7

}




// Horizontal collision
if (place_meeting(x + hsp, y, obj_wall)) {
	while (!place_meeting(x + sign(hsp), y, obj_wall)) {
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

// Verticle collision
//if (place_meeting(x, y + vsp, obj_wall)) {
//	while (!place_meeting(x, y + sign(vsp), obj_wall)) {
//		y += sign(vsp);
//	}
//	vsp = 0;
//}
//y += vsp;


// Animation
if (!place_meeting(x, y + 1, obj_wall)) {
	//image_speed = 0;
	if(vsp<=0)
{
	if(charge!=1)
	{


	}
	else
	{
	sprite_index = sp_player_jump;

	}
}
else if(vsp>0)
{
	sprite_index = sp_player_fall;
}
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
} else {
	//image_speed = 0.6;
	if (hsp == 0) {
		sprite_index = sp_player_crouch_idle;
	} else {
		sprite_index = sp_player_crouch_run;
	}
}





if (hsp !=0) image_xscale = sign(hsp);




}

function PlayerState_Hit() {
	//Just hit
	if (hitNow)
	{
		sprite_index = sp_player_hit;
		image_index = 0;
		hitNow = false;
		frameCount = 0;
	}

	frameCount++;
	if (frameCount > 20) 
	{
		frameCount = 0;
		state = PLAYERSTATE.FREE;
	}


}

function PlayerState_Dead() {
	if (sprite_index != sp_player_death)
	{
		sprite_index = sp_player_death;
		image_index = 0;
	}
if(animation_end()) image_speed=0;
//	if (animation_end()) instance_change(obj_player_corpse,true);




}


function PlayerState_Free(){


if (keyboard_check_pressed(ord("S"))){
		state=PLAYERSTATE.CROUCHING;
}

if(key_Execute) state=PLAYERSTATE.WEAPON_1;
//if (keyAttack) state = PLAYERSTATE.ATTACK_1;
if (keyDash) state = PLAYERSTATE.DASH;

// Calculate movement
var move = key_right - key_left;

hsp = move * walksp;

//vsp = vsp + grv;

// Jumping
if (place_meeting(x, y + 1, obj_wall)) and key_jump {
	vsp = -7;//-7

}




// Horizontal collision
if (place_meeting(x + hsp, y, obj_wall)) {
	while (!place_meeting(x + sign(hsp), y, obj_wall)) {
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

// Verticle collision
//if (place_meeting(x, y + vsp, obj_wall)) {
//	while (!place_meeting(x, y + sign(vsp), obj_wall)) {
//		y += sign(vsp);
//	}
//	vsp = 0;
//}
//y += vsp;


// Animation
if (!place_meeting(x, y + 1, obj_wall)) {
	//image_speed = 0;
	if(vsp<=0)
{
	if(charge!=1)
	{


	}
	else
	{
	sprite_index = sp_player_jump;

	}
}
else if(vsp>0)
{
	sprite_index = sp_player_fall;
}
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
} else {
	//image_speed = 0.6;
	if (hsp == 0) {
		sprite_index = sp_player_idle;
	} else {
		sprite_index = sp_player_run;
	}
}





if (hsp !=0) image_xscale = sign(hsp);



}

function PlayerState_Jump(){
	sprite_index=sp_player_jump;
	
	var move = key_right - key_left;

hsp = move * walksp;

if (place_meeting(x + hsp, y, obj_wall)) {
	while (!place_meeting(x + sign(hsp), y, obj_wall)) {
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

if (hsp !=0) image_xscale = sign(hsp);

}


function PlayerState_Fall(){
	sprite_index=sp_player_fall;
	
		var move = key_right - key_left;

hsp = move * walksp;

if (place_meeting(x + hsp, y, obj_wall)) {
	while (!place_meeting(x + sign(hsp), y, obj_wall)) {
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp;

if (hsp !=0) image_xscale = sign(hsp);

	
	if (place_meeting(x, y + 1, obj_wall)){
		state=PLAYERSTATE.FREE;
	}
}





	




