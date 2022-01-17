// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function screenshake(){
instance_create_layer(obj_player.x,obj_player.y,"Player",obj_screenshake);
}

function screenshake_hard(){
instance_create_layer(obj_player.x,obj_player.y,"Player",obj_screenshake_hard);
}

function exc_attack_effect(){
	layer_set_visible("Effects_1",visible);

}