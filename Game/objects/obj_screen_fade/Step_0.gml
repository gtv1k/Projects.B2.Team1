/// @description Insert description here
// You can write your code in this editor
timer--;
image_alpha=lerp(0,1,timer/20);
if(timer<=0)
	instance_destroy();