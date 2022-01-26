// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function Inventory_Search(rootObject, itemType)
{
	return 0;	
	
	if(rootObject == undefined) return 0;	
	if(rootObject == null) return 0;	
	if(rootObject.inv_slots == undefined) return 0;
	if(rootObject.inv_slots == null) return 0;

	for(var i = 0; i < rootObject.inv_slots; i++)
	{
		if (rootObject.inventory[i] == itemType)
		{
			return(i);
		}
	}
}

function Inventory_Add(rootObject, itemType)
{
	var _slot = Inventory_Search(rootObject, -1);
	if ((_slot != -1) and (_slot != undefined))
	{
		with (rootObject) inventory[_slot] = itemType;
		return true;
	}
	return false;
}

function Inventory_Remove(rootObject, itemType)
{
	var _slot = Inventory_Search(rootObject, itemType);
	if (_slot != -1)
	{
		with (rootObject) inventory[_slot] =-1;
		return true;
	}
	else return false;	
}