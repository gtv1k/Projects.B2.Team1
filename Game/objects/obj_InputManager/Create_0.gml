enum Inputs
{
    Up,
    Down,
    Left,
    Right,
    
    Dash,
    
    Attack
}

input_default_key(ord("W"),                  Inputs.Up);
input_default_gamepad_axis(gp_axislv, true,  Inputs.Up);

input_default_key(ord("S"),                  Inputs.Down);
input_default_gamepad_axis(gp_axislv, false, Inputs.Down);

input_default_key(ord("A"),                  Inputs.Left);
input_default_gamepad_axis(gp_axislh, true,  Inputs.Left);

input_default_key(ord("D"),                  Inputs.Right);
input_default_gamepad_axis(gp_axislh, false, Inputs.Right);