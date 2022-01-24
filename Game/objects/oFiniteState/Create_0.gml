/// @description Insert description here
// You can write your code in this editor

//if (global.objectArray[0] != 0)
//{
//	global.objectArray[len(global.objectArray)] += id;
//	global.boolArray[len(global.boolArray)] += isActive;
//}
//else
//{
//	global.objectArray[0] = id;
//	global.boolArray[0] = isActive;
//}

//global.objectArray.Add(id);

arrayIndex = global.objectArray.GetIndex(id);
containsSelf = (arrayIndex != -1);

if (containsSelf)
{
	isActive = global.boolArray.GetAt(arrayIndex);
}

else
{
	
	global.objectArray.Add(id);
	global.boolArray.Add(isActive);

}
arrayIndex = global.objectArray.GetIndex(id);
//Debug.Log(global.objectArray.ToString());
//Debug.Log(global.boolArray.ToString());