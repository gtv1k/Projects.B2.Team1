self.position = new vec2(x,y);
started = false; 


//boss_instance = instance_find(boss, 0);

//filename += ".yarn";
//text_elements = [];

//ChatterboxLoadFromFile(filename);
//chatterbox = ChatterboxCreate(filename, false);
function StartDialogue()
{
	started = true;
    instance_create_layer(position.x, position.y, "Dialogue", dialogue);
	Debug.Log(position.x, position.y);
}