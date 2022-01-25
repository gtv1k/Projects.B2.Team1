//Reconstruct our shockwave surface if it doesn't exist
if(!surface_exists(shockwave_surface)) shockwave_surface = surface_create(surface_get_width(application_surface), surface_get_height(application_surface));

//Build our shockwave surface
surface_set_target(shockwave_surface);

//Clear the entire surface
draw_clear(make_colour_rgb(127, 127, 0));

if (instance_number(oShockwave) > 0)
{
	if (vbf_shockwave != noone)
    {
		//Submit the shockwave vertex buffer as a single batch
		shader_set(shdShockwaveBatch);
        shader_set_uniform_f( shader_get_uniform( shader_current(), "u_fGlobalMaxRadius"  ), SHOCKWAVE_BATCH_MAX_RADIUS);
        shader_set_uniform_f( shader_get_uniform( shader_current(), "u_fGlobalMaxExponent"), SHOCKWAVE_BATCH_MAX_EXPONENT);
        vertex_submit(vbf_shockwave, pr_trianglelist, -1 );
        shader_reset();
    }
}

surface_reset_target();