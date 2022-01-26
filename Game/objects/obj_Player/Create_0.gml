
enum Weapon
{
	Nothing,
	Sword,
	Hammer,
	Scythe,
	Gauntlets,
	MyBeloved
}

//weapon=1;
currentWeapon = Weapon.Sword;

targetEnter=0;

attack = false;
hitByAttack = ds_list_create();


//--------Dialogue Stuff
reset_dialogue_defaults();
myPortrait			= spr_portrait_player;
myVoice				= snd_voice2;
myFont				= fnt_dialogue;
myName				= "MC";

myPortraitTalk		= spr_portrait_examplechar_mouth;
myPortraitTalk_x	= 26;
myPortraitTalk_y	= 44;
myPortraitIdle		= spr_portrait_examplechar_idle;

enum PLAYERSTATE
{
	FREE,
	WEAPON_1,
	WEAPON_2,
	WEAPON_3,
	JUMP,
	FALL,
	ATTACK_1,
	ATTACK_2,
	ATTACK_3,
	EXECUTE,
	DASH,
	HIT,
	DEAD,
	CROUCH,
	CROUCHING
}
state = PLAYERSTATE.FREE;


hitNow = false;
frameCount = 0;
flash = false;

hsp = 0;
vsp = 0;
grv = 1.2 UNITS;
walksp = (6.5  UNITS);//4;
onground=false;
charge=0;

hit = false;

hpWidth = 120;
hpHeight = 20;

