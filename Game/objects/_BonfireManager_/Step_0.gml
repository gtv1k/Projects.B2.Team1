

if (bonito)
{
	//if(obj_player != null)
	//{
		obj_player.x = global.bonfire_x;
		obj_player.y = global.bonfire_y-32;
	//}
	
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
	
	if (global.bonfire_room != null)
	{
	
		if (room != global.bonfire_room)
		{
			//Debug.Log("room_goto(global.bonfire_room)")
			room_goto(global.bonfire_room);
		}
		
	}
	
	bonito = true;
}