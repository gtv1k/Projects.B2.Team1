/// @description Insert description here
// You can write your code in this editor

//Debug.DrawNewLine(oPlayer.position, position)

if (keyboard_check_pressed(ord("F")) and (oPlayer.position.Distance(position) < 3 METER))
{
	Inventory_Add(oInventory, frame);
	instance_destroy(self, true);	
}
