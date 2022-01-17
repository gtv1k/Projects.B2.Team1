//Returns the smallest value from its inputs.
function Math_Min()
{
	if(argument_count == 0) throw "Invalid Argument Count";
	
	var _smallest = argument[0];
	for (var i = 1; i < argument_count; i += 1) 
	{
		var _arg = argument[i];
		
		if (is_numeric(_arg))
		{
			if(_arg < _smallest)
			{
				_smallest = _arg;
			}
		}
		else if(is_struct(_arg)) //assume is vec2
		{
			if((_arg).__lt__(_smallest))
			{
				_smallest = _arg;
			}
		}
		
		throw "Invalid Argument!";
		
	}
	return _smallest;
}

//Returns the largest value from its inputs.
function Math_Max()
{
	if(argument_count == 0) throw "Invalid Argument Count";
	
	var _largest = argument[0];
	for (var i = 1; i < argument_count; i += 1) 
	{
		var _arg = argument[i];
		
		if(is_numeric(_arg))
		{
			if(_arg[i] > _largest)
			{
				_largest = _arg;
			}
		}
		else if(is_struct(_arg)) //assume is vec2
		{
			if((_arg).__gt__(_largest))
			{
				_largest = _arg;
			}
		}
		
		throw "Invalid Argument!";
	}
	return _largest;
}

function BezierInterpolate(a, b, c, d, t)
{
    // get intermediate coordinates
    var ix = lerp(a.x, b.x, t);
    var iy = lerp(a.y, b.y, t);
		
    var jx = lerp(b.x, c.x, t);
    var jy = lerp(b.y, c.y, t);
    var kx = lerp(c.x, d.x, t);
    var ky = lerp(c.y, d.y, t);
        
    // get further intermediate coordinates
    var iix = lerp(ix, jx, t);
    var iiy = lerp(iy, jy, t);
    var jjx = lerp(jx, kx, t);
    var jjy = lerp(jy, ky, t);

    // get final curve point
    var bx = lerp(iix, jjx, t);
    var by = lerp(iiy, jjy, t);
		
    return new vec2(bx, by);
}

/// Taken from here: 
/// https://forum.yoyogames.com/index.php?threads/a-free-simple-quadratic-bezier-curve-script-in-gml.42161/
function DrawBezier(a, b, c, d) 
{
    var _step = 0.05;
    draw_primitive_begin(pr_linestrip);
    draw_vertex(a.x, a.y);
	
    for (var i = 0; i <= 1; i += _step) 
	{
		/*
        // get intermediate coordinates
        var ix = lerp(a.x, b.x, i);
        var iy = lerp(a.y, b.y, i);
		
        var jx = lerp(b.x, c.x, i);
        var jy = lerp(b.y, c.y, i);
        var kx = lerp(c.x, d.x, i);
        var ky = lerp(c.y, d.y, i);
        
        // get further intermediate coordinates
        var iix = lerp(ix, jx, i);
        var iiy = lerp(iy, jy, i);
        var jjx = lerp(jx, kx, i);
        var jjy = lerp(jy, ky, i);

        // get final curve point
        var bx = lerp(iix, jjx, i);
        var by = lerp(iiy, jjy, i);
		*/
		
		var _pos = BezierInterpolate(a, b, c, d, i);
		
        draw_vertex(_pos.x, _pos.y);
    }
	
    draw_vertex(d.x, d.y);
    draw_primitive_end();
}

//Returns -1 if input is negative, 0 if input is zero (or within the given threshold), 1 if input is positive.
function sign_with_zero(input, threshold = 0.00001)
{
	return (abs(value) < threshold) ? 0 : sign(value);
}


//Returns blended value between `from` and `to` based on `amount`.
function LerpUnclamped(from, to, amount) //I know there already is a clamp, but this is more explicit.
{
	return ((1 - amount) * from) + (amount * to);
}

//Returns blended `value` between `from` and `to` based on `amount`. 
//`amount` is clamped between [0-1] so it never goes out of bounds.
function LerpClamped(from, to, amount) //Unlike Unity's lerp the one this engine has isn't clamped, i like having it as an option.
{
	return LerpUnclamped(from, to, clamp(amount, 0, 1));
}

//Returns `value`'s `amount` between `from` and `to`.
function InverseLerpUnclamped(from, to, value)
{
	return (value - from) / (to - from);
}

//Returns `value`'s `amount` between `from` and `to`. clampes between [0-1]
function InverseLerpClamped(from, to, value)
{
	return clamp(InverseLerpUnclamped(from, to, value), 0, 1);
}

//TODO: angle_to_dir
//TODO: dir_to_angle

#region Constants

// 15 decimal places in a double

#macro TAU (6.283185307179586)
#macro PI  (3.141592653589793)

#macro PI_HALF (1.570796326794896)

/// Use this to convert from Degrees to Radians.
/// (TAU / 360) or (PI / 180)
#macro DEG_TO_RAD (0.017453292519943)

/// Use this to convert from Radians to Degrees. 
/// (360 / TAU) or (180 / PI)
#macro RAD_TO_DEG (57.295779513082325)

#endregion