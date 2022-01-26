// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ArrayCheckforActive(targetArray, boolArray, object)
{
	for(i = 0; len(targetArray); i++)
	{
		if(target[i] == object)
		{
			return boolArray[i];
		}
	}
	
	return;
	
}

function ArrayIndex(targetArray, object)
{
	for(i = 0; len(targetArray); i++)
	{
		if(target[i] == object)
		{
			return i;
		}
	}
	
	return;
	
}