#macro PIXELS_PER_UNIT 32

#macro UNIT   * PIXELS_PER_UNIT
#macro UNITS  * PIXELS_PER_UNIT

#macro METER  * PIXELS_PER_UNIT 
#macro METRES * PIXELS_PER_UNIT

#macro PIXEL  / PIXELS_PER_UNIT
#macro PIXELS / PIXELS_PER_UNIT

#macro PER_FRAME  * (delta_time / 1000000)
#macro PER_SECOND / (delta_time / 1000000)

#macro RADIANS * DEG_TO_RAD;
#macro DEGREES * RAD_TO_DEG;

//#macro NULL noone
#macro null noone

#macro elif else if

#macro is ==
#macro newVec2 new vec2