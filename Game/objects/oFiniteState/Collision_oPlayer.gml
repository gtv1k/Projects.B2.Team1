/// @description Insert description here
// You can write your code in this editor
if (isActive)
{
	if (oPlayer.attack and oPlayer.weapon == activeWeapon)
	{
		Debug.Log("I'm HERE");
		isActive = false;
		
		global.boolArray.SetAt(arrayIndex, isActive);
		//index = ArrayIndex(global.objectArray, id);
		
		//global.boolArray[index] = isActive;
	}
}

//else
//{
//	instance_deactivate_object(self);
//}