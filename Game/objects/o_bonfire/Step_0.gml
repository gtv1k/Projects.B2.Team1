/// @description Insert description here
// You can write your code in this editor
if(activated and !was_activated)
{
	instance_create_depth(x, y, depth - 1, o_effect_bonfire);
}