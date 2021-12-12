function HasControllerInput()
{
	for (i = gp_face1; i < gp_axisrv; i += 1)
	{
		if gamepad_button_check(0, i)
		{
			return true;
        }
    }
	
	return false;
}