/*
#macro NORMAL_COLOR make_colour_rgb(127, 127, 0)

// name of what you want it to be called in the shader
distortion_stage = shader_get_sampler_index(vfx_Shockwave, "distortion_texture_page");

application_surface_draw_enable(false);
gpu_set_tex_filter(true);
*/

application_surface_draw_enable(false);
gpu_set_tex_filter(true);

shockwave_surface = noone;

#macro SHOCKWAVE_BATCH_MAX_RADIUS 150
#macro SHOCKWAVE_BATCH_MAX_EXPONENT 3

vertex_format_begin();
vertex_format_add_position();
vertex_format_add_colour();
vertex_format_add_texcoord();
global.vft_2d = vertex_format_end();

vbf_shockwave = noone;