/// @description Insert description here
// You can write your code in this editor

if (keyboard_check_pressed(vk_tab))
{
	check_press = !check_press;
}


if (check_press)
{
	draw_sprite_stretched
	(
		sInventory,
		0,
		x-6,
		y-6,
		12+row_len*68,
		12+(((inv_slots-1) div row_len)+1)*68
	);

	for (var i = 0; i < inv_slots; i += 1)
	{
		var xx = x + (i mod row_len) * 68 + 2;
		var yy = y + (i div row_len) * 68 + 2;
		draw_sprite(sSlot, 0, xx, yy)
		if (inventory[i] != -1)
		{
			draw_sprite(sItems, inventory[i], xx, yy);
		}
	}
}

//else if ((check_press == true) and (keyboard_check(vk_tab)))
//{
//	check_press = false;
//}