if (Time.time >= end_time) instance_destroy();

var t = clamp((Time.time - create_time) / lifespan, 0, 1);

max_radius = t * 150;
min_radius = t *  20;
exponent = lerp( 3, 0.5, t );
alpha = sqr( 1 - t );