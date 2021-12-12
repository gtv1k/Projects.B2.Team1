//Returns the smallest value from its inputs.
function min()
{
	var smallest = argument[0];
	for (var i = 1; i < argument_count; i += 1) 
	{
		if(argument[i] < smallest)
		{
			smallest = list[i];
		}
	}
	return smallest;
}

//Returns the largest value from its inputs.
function max()
{
	var smallest = argument[0];
	for (var i = 1; i < argument_count; i += 1) 
	{
		if(argument[i] < smallest)
		{
			smallest = list[i];
		}
	}
	return smallest;
}

//Returns -1 if input is negative, 0 if input is zero (or within the given threshold), 1 if input is positive.
function sign_with_zero(input, threshold = 0.00001)
{
	return (abs(value) < threshold) ? 0 : sign(value);
}


//Returns blended value between `from` and `to` based on `amount`.
function lerp_unclamped(from, to, amount) //I know there already is a clamp, but this is more explicit.
{
	return ((1 - amount) * from) + (amount * to);
}

//Returns blended `value` between `from` and `to` based on `amount`. 
//`amount` is clamped between [0-1] so it never goes out of bounds.
function lerp_clamped(from, to, amount) //Unlike Unity's lerp the one this engine has isn't clamped, i like having it as an option.
{
	return lerp_unclamped(from, to, clamp(amount, 0, 1));
}

//Returns `value`'s `amount` between `from` and `to`.
function inverse_lerp_unclamped(from, to, value)
{
	return (value - from) / (to - from);
}

//Returns `value`'s `amount` between `from` and `to`. clampes between [0-1]
function inverse_lerp_clamped(from, to, value)
{
	return clamp(inverse_lerp_unclamped(from, to, value), 0, 1);
}

//TODO: angle_to_dir
//TODO: dir_to_angle