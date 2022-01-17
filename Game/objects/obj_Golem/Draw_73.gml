/// @description Insert description here
// You can write your code in this editor

a = new vec2(x, y);
b = new vec2(x, y-(14 UNITS));

c = new vec2(oPlayer.x, oPlayer.y-(14 UNITS));
d = new vec2(oPlayer.x, oPlayer.y);

DrawBezier(a, b, c, d);