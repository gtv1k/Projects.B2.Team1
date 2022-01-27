
//Debug.Log("Bonfire created");

global.bonfire_x = x;
global.bonfire_y = y;
global.bonfire_room = null;
global.bonfire = null;

global.is_dead = false;
global.timeOfDeath = null;

respawnTime = 1;

timeSpentDead = 0;

bonito = false;

//room_goto_next();

room_goto(/*numb*/ first_level);