/*
if(keyboard_check(vk_anykey))
{
	input_player_source_set(INPUT_SOURCE.KEYBOARD_AND_MOUSE);
}
else
{
	input_player_source_set(INPUT_SOURCE.GAMEPAD);
	input_player_gamepad_set(0);
}
*/

input_source_hotswap_tick();

input_tick();

I_LEFT   = input_check(Inputs.Left);
I_RIGHT  = input_check(Inputs.Right);
I_UP     = input_check(Inputs.Up);
I_DOWN   = input_check(Inputs.Down);

I_HOR    = (I_RIGHT ? 1 : 0) - (I_LEFT ? 1 : 0);
I_VER    = (I_UP    ? 1 : 0) - (I_DOWN ? 1 : 0);

I_JUMP   = input_check_pressed(Inputs.Jump);
I_DASH   = input_check_pressed(Inputs.Dash);

I_CROUCH = input_check(Inputs.Crouch);

I_USE    = input_check_pressed(Inputs.Use);

I_ATTACK = input_check(Inputs.Attack);