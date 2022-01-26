event_inherited(); //so it will inherit from par_speaker

lockedon = false;


hitNow = false;
frameCount = 0;
flash = false;
state = ENEMYSTATE.PATROL;
hp = 1;

attack = false;
hitByAttackEnemy = ds_list_create();

enum ENEMYSTATE
{
	CHASE,
	PATROL,
	HIT,
	DEAD,
		ATTACK_SLASH,

}
image_index = irandom(10);

dir = -1;
//velocity.x = 0;
//velocity.y = 0;
grv = 0.3;
spd = 1;

velocity = new vec2(0, 0);
position = new vec2(x, y);


timeElapsed = 0;