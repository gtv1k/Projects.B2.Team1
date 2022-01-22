//We want to discard the shockwave vertex buffer every frame
if (vbf_shockwave != noone)
{
    vertex_delete_buffer(vbf_shockwave);
    vbf_shockwave = noone;
}

//Build a vertex buffer out of the shockwave instances
if (instance_number(obj_Shockwave) > 0)
{
    vbf_shockwave = vertex_create_buffer_ext(instance_number(obj_Shockwave) * 6 * (8+1+8));
	
    vertex_begin(vbf_shockwave, global.vft_2d);
	
    var _vbuff = vbf_shockwave;
    
    var _shockwaves = array_create(instance_number(obj_Shockwave));
    var _i = 0;
    with(obj_Shockwave) _shockwaves[_i++] = id;
    
    for(var _i = instance_number(obj_Shockwave)-1; _i >= 0; _i-- )
    {
        with( _shockwaves[_i] )
        {
            var _colour = make_colour_rgb(255*( max_radius/SHOCKWAVE_BATCH_MAX_RADIUS),
                                          255*( min_radius/SHOCKWAVE_BATCH_MAX_RADIUS),
                                          255*( exponent  /SHOCKWAVE_BATCH_MAX_EXPONENT));
            
            vertex_position(_vbuff, x - max_radius, y - max_radius ); vertex_color( _vbuff, _colour, alpha ); vertex_texcoord( _vbuff, x, y );
            vertex_position(_vbuff, x + max_radius, y - max_radius ); vertex_color( _vbuff, _colour, alpha ); vertex_texcoord( _vbuff, x, y );
            vertex_position(_vbuff, x - max_radius, y + max_radius ); vertex_color( _vbuff, _colour, alpha ); vertex_texcoord( _vbuff, x, y );
            
            vertex_position(_vbuff, x + max_radius, y - max_radius ); vertex_color( _vbuff, _colour, alpha ); vertex_texcoord( _vbuff, x, y );
            vertex_position(_vbuff, x + max_radius, y + max_radius ); vertex_color( _vbuff, _colour, alpha ); vertex_texcoord( _vbuff, x, y );
            vertex_position(_vbuff, x - max_radius, y + max_radius ); vertex_color( _vbuff, _colour, alpha ); vertex_texcoord( _vbuff, x, y );
        }
    }
    
    vertex_end( vbf_shockwave );
}