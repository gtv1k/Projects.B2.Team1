draw_text(x,y-48,hp);
if(weapon=1){
draw_text(x-16,y-64,"sword");
}
else if(weapon=2){
	draw_text(x-16,y-64,"hammer");
}
else if(weapon=3){
	draw_text(x-16,y-64,"scythe");
}
else if(weapon=4){
	draw_text(x-16,y-64,"excalibur");
}
else if(weapon=5){
	draw_text(x-16,y-64,"gauntlets");
}

if (flash)
{
	if (image_index >= 1) flash = false;
	shader_set(shWhite);
}

draw_self();
shader_reset();



