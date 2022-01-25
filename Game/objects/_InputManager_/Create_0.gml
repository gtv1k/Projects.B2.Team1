enum Inputs
{
    Up,
    Down,
	
    Left,
    Right,
    
	Jump,
    Dash,
	Crouch,
	
	Use,
	Inv,
	Talk,
    
    Attack
}

input_default_key(         /*key  */ord("A"),                      /*verb */Inputs.Left);
input_default_gamepad_axis(/*axis */gp_axislh, /*negative */true,  /*verb */Inputs.Left);
input_default_key(         /*key  */ord("D"),                      /*verb */Inputs.Right);
input_default_gamepad_axis(/*axis */gp_axislh, /*negative */false, /*verb */Inputs.Right);

input_default_key(         /*key  */ord("S"),                      /*verb */Inputs.Down);
input_default_gamepad_axis(/*axis */gp_axislv, /*negative */false, /*verb */Inputs.Down);
input_default_key(         /*key  */ord("W"),                      /*verb */Inputs.Up);
input_default_gamepad_axis(/*axis */gp_axislv, /*negative */true,  /*verb */Inputs.Up);

input_default_key(         /*key  */vk_space,                      /*verb */Inputs.Jump);
input_default_key(         /*key  */vk_shift,                      /*verb */Inputs.Dash);
input_default_key(         /*key  */vk_control,                    /*verb */Inputs.Crouch);

input_default_key(         /*key  */ord("E"),                      /*verb */Inputs.Use);
input_default_key(         /*key  */ord("Q"),                      /*verb */Inputs.Inv);
input_default_key(         /*key  */ord("F"),                      /*verb */Inputs.Attack);
input_default_key(         /*key  */ord("T"),                      /*verb */Inputs.Talk);

#macro I_LEFT   global.input_left
#macro I_RIGHT  global.input_right
#macro I_DOWN   global.input_down
#macro I_UP     global.input_up

#macro I_HOR    global.input_hor
#macro I_VER    global.input_ver

#macro I_JUMP   global.input_jump
#macro I_DASH   global.input_dash

#macro I_CROUCH global.input_crouch

#macro I_USE    global.input_use

#macro I_ATTACK global.input_attack