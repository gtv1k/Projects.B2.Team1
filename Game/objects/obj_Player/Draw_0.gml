//draw_text(x,y-48,global.hp);


var weapon_text = "";

switch(currentWeapon)
{
	case Weapon.Sword:     weapon_text = "sword";     break;
	case Weapon.Hammer:    weapon_text = "hammer";    break;
	case Weapon.Scythe:    weapon_text = "scythe";    break;
	case Weapon.Gauntlets: weapon_text = "gauntlets"; break;
	case Weapon.MyBeloved: weapon_text = "excalibur"; break;
}

draw_text(x-16,y-64, weapon_text);

/*
if(weapon is 1)
{
	draw_text(x-16,y-64,"sword");
}
else if(weapon=2)
{
	draw_text(x-16,y-64,"hammer");
}
else if(weapon=3)
{
	draw_text(x-16,y-64,"scythe");
}
else if(weapon=4)
{
	draw_text(x-16,y-64,"excalibur");
}
else if(weapon=5)
{
	draw_text(x-16,y-64,"gauntlets");
}
*/

if (flash)
{
	if (image_index >= 1) flash = false;
	shader_set(shWhite);
}

draw_self();
shader_reset();