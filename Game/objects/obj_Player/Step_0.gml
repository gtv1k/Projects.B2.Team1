if(isDodging)
{
    if (dodgeTime < dodgeDuration)
    {
        var _t = Tween_CubicIn(dodgeTime / dodgeDuration);
        dodgeTime += Time.deltaTime;
        
        x = lerp(dodgeStartPoint.x, dodgeEndPoint.x, _t);
        //y = lerp(dodgeStartPoint.y, dodgeEndPoint.y, _t);
        
        return;
    }
    else
    {
        dodgeTime = 0;
        isDodging = false;
    }
}


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


if (hitNow)
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
position = new vec2(x, y);
if((I_LEFT or I_RIGHT) and I_DASH) 
{
	if (onground)
	{
		dashCount = 1;
	}
	else if (dashCount > 0)
	{
		dashCount = 0;
	}
	else
	{
		return;
	}
    //var _vector = new vec2(I_HOR * (4 UNITS), 0);
    var _start = new vec2(x, y);
    var _dir  = (new vec2(I_HOR, 0)).Normalized();
    var _dist = (4 UNITS);
        
    var _end   = (_start).__add__((_dir).__mul__(_dist));
    
    var _ray = new Ray(/*origin */ _start, /*direction */ _dir, /*objects*/obj_wall, /*maxDistance*/ _dist);
    var _hit = _ray.Cast();
    
    if(_hit != null)
    {
		
		if(_hit.point != undefined)
		{
			_end = _hit.point;
			_end.x -= (I_HOR * 0.5 UNIT);
 
			Debug.Log(_hit.point);
		}
		
        Debug.Log("DASH HIT WALL!!!");

    }
    
    dodgeStartPoint = _start;
    dodgeEndPoint   = _end;
    
    isDodging = true;
    dodgeTime = 0;
}

position = new vec2(x, y);
