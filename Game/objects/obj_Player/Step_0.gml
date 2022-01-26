if keyboard_check(vk_home)
{
    x += I_HOR * ((5 UNITS) * Time.deltaTime);
    y += I_VER * ((5 UNITS) * Time.deltaTime);
    
    return;
}

vsp=vsp+(grv * Time.deltaTime);
// Verticle collision
if (place_meeting(x, y + vsp, obj_wall)) 
{
	while (!place_meeting(x, y + sign(vsp), obj_wall)) 
	{
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp;

if(instance_exists(obj_textbox)) exit;



	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(ord("W"));
	keyAttack = keyboard_check_pressed(ord("F")) || keyboard_check_pressed(ord("Z"));
	key_transform = keyboard_check_pressed(ord("R"));
	key_Execute = keyboard_check_pressed(ord("F"));
	keyDash = keyboard_check_pressed(ord("P"));
	key_interact = keyboard_check_pressed(ord("E"));

switch(state)
{
	case PLAYERSTATE.FREE: PlayerState_Free(); break;
	
	case PLAYERSTATE.WEAPON_1: PlayerState_Attack_Weapon_1(); break;
	case PLAYERSTATE.WEAPON_2: PlayerState_Attack_Weapon_2(); break;
	case PLAYERSTATE.WEAPON_3: PlayerState_Attack_Weapon_3(); break;

    case PLAYERSTATE.ATTACK_1: PlayerState_Attack_1(); break;
    case PLAYERSTATE.ATTACK_2: PlayerState_Attack_2(); break;
    
	case PLAYERSTATE.CROUCHING: PlayerState_Crouching(); break;
	case PLAYERSTATE.CROUCH: PlayerState_Crouch(); break;
	
	
		

	case PLAYERSTATE.HIT:  PlayerState_Hit(); break;
	case PLAYERSTATE.DEAD: PlayerState_Dead(); break;
	
	case PLAYERSTATE.JUMP: PlayerState_Jump(); break;
	case PLAYERSTATE.FALL: PlayerState_Fall(); break;
	
	default: PlayerState_Free(); break;
	
} 

onground = place_meeting(x, y + 1, obj_wall);

if (onground)
{
	if(state is PLAYERSTATE.CROUCH)
	{
		walksp = (3 UNITS) * Time.deltaTime
		//onground=true;
	}
	else
	{
		//onground=true;
		walksp =  (6.5 UNITS) * Time.deltaTime;
		charge = 1;
	}
}
else
{
	if(vsp < 0)
	{
		state = PLAYERSTATE.JUMP;
	}
	else if(vsp >= 0)
	{
		state=PLAYERSTATE.FALL;
	}
	
	walksp = (6.5  UNITS) * Time.deltaTime;
	//onground=false;
}

if(keyboard_check_pressed(ord("V")))
{
	currentWeapon += 1;
	if(currentWeapon > 5)
	{
		currentWeapon = 1;
	}
	
	Debug.Log(currentWeapon);
}




if((I_LEFT or I_RIGHT) and I_DASH) 
{
	for (xa=0; xa != 6; xa++)
	{
		x += sign(I_HOR) * 4;
		colliders();
	}
}
if (hit)
{
	if (global.hp > 0)
	{
		global.hp -= oEnemy.damage;
	}
	else
	{
		global.is_dead = true;
	}
}

hpBar_x = x;
hpBar_y = y - (2 METRES);