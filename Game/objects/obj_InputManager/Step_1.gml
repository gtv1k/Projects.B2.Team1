if(keyboard_check(vk_anykey))
{
	input_player_source_set(INPUT_SOURCE.KEYBOARD_AND_MOUSE);
}
else
{
	input_player_source_set(INPUT_SOURCE.GAMEPAD);
	input_player_gamepad_set(0);
}

input_tick();