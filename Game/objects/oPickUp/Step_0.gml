/// @description Insert description here
// You can write your code in this editor

//Debug.DrawNewLine(oPlayer.position, position)


if (keyboard_check_pressed(ord("F")) and (oPlayer.position.Distance(position) < 3 METER))
{
	Inventory_Add(oInventory, frame);
	var rel = ChatterboxVariableGet(relic, 0) + 1;
	ChatterboxVariableSet(relic, rel);
	Debug.Log(rel);
	instance_destroy(self, true);	
}
