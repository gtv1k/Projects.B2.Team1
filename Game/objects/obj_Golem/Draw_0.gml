if (flash)
{
	//if (image_index >= 1) flash = false;
	shader_set(shWhite);
	flash = false;
}

draw_self();
shader_reset();