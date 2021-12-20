var _center = new vec2(x, y);
var _vec    = new vec2(lengthdir_x(sprite_width, image_angle) / 2, lengthdir_y(sprite_width, image_angle) / 2);

var _start  = (_center).__sub__(_vec);
var _end    = (_center).__add__(_vec);

collider = new Collider(_start, _end);