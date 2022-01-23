/// @description Insert description here
// You can write your code in this editor

if (bonito)
{
	oPlayer.x = global.bonfire_x;
	oPlayer.y = global.bonfire_y;
	
	if (global.bonfire != null)
	{
		global.bonfire.activated = true;
	}
	
	bonito = false;
	//Debug.Log("loaded room:", room);
	//Debug.Log("x: ",global.bonfire_x, " y: ", global.bonfire_y, " room: ", global.bonfire_room);
}

if (global.is_dead)
{
	global.is_dead = false;
	//Debug.Log("current room:", room);
	
	if (global.bonfire_room != undefined)
	{
	
		if (room != global.bonfire_room)
		{
			//Debug.Log("room_goto(global.bonfire_room)")
			room_goto(global.bonfire_room);
		}
		
	}
	
	bonito = true;
	
}