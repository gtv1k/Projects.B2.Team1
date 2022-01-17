event_inherited(); //so it will inherit from par_speaker

lockedon = false;

//-------DIALOGUE STUFF

myPortrait			= Sprite3867;
myVoice				= snd_voice1;
myName				= "Enemy";

myPortraitTalk		= spr_portrait_examplechar_mouth;
myPortraitTalk_x	= 26;
myPortraitTalk_y	= 44;
myPortraitIdle		= spr_portrait_examplechar_idle;


//-------OTHER

choice_variable		= -1;	//the variable we change depending on the player's choice in dialogue

hitNow = false;
frameCount = 0;
flash = false;
state = ENEMYSTATE.FREE;
hp = 3000//3;

attack = false;
hitByAttackEnemy = ds_list_create();

enum ENEMYSTATE
{
	FREE,
	HIT,
	DEAD,
		ATTACK_SLASH,
	ATTACK_COMBO
}
image_index = irandom(10);