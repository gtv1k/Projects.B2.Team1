function RaycastHit(_point, _normal, _distance, obj) constructor
{
	self.point    = _point;
	self.normal   = _normal;
	self.distance = _distance;
	self.object   = obj;
}

function Ray(_origin, _direction, _object = all, _maxDistance = 2000) constructor
{
	#region Constructor
	
	self.pos    = _origin;
	self.dir    = _direction;
	self.obj    = _object;
	self.dist   = _maxDistance;
	
	return self;
	
	#endregion
	
	//var map = ds_map_create();
	//ds_map_add(map, "startPosition", argument[0]); //Where the ray started
	//ds_map_add(map, "hitPosition", []); //Where the ray hit something
	//ds_map_add(map, "object", noone); //What object the ray hit (or noone if no object is hit)
	//ds_map_add(map, "direction", 0); //The direction of the ray from start to hit (in degrees)
	//ds_map_add(map, "reflectionAngle", 0); //The angle of reflection (in degrees)
	//ds_map_add(map, "normal", 0); //The normal of the face hit (in degrees)
	//ds_map_add(map, "distance", 0); //The distance from start to end.

	//var startPosition = argument[0];
	
	/*
	if(!is_array(startPosition) || array_length(startPosition) != 2)
	{
		show_error("argument0 in ray_cast (startPosition) must be an array with two values (x and y)", true);
	}
	*/
	
	static Cast = function()
	{
		var __end = (pos).__add__((dir).__mul__(dist)); //remove mul?
		
		//Debug.Log("Pos  = ", pos);
		//Debug.Log("Dir  = ", dir);
		//Debug.Log("End  = ", __end);
		//Debug.Log("Dist = ", dist);
	
		var __altDist = dist;
	
		//If we will not collide with anything
		if(collision_line(pos.x, pos.y, __end.x,__end.y, obj, true, true) is null)
		{
			//Debug.Log("We hit fucking nothing");
			return null;
		}

		//If there is no collision halfway from start-end, skip it. Move start 50% closer to end.
		while((collision_line(pos.x, pos.y, __end.x, __end.y, obj, true, true) is null) and (__altDist > 1))
		{
			__altDist *= 0.5;
			__end = (pos).__add__((dir).__mul__(__altDist));
		
			//could also div the end by 2 or multiply by 0.5
		}
	
		var __distances = array_create(4, null);
	
		var __hitInfo = new RaycastHit(,,,,);

		var __curDist = 0;
		var __hasHitSomething = false;
		while((__hasHitSomething == false) and (__curDist < __altDist)) //Change to OR to escape infinite loop?
		{
			__curDist += 1;
		
			var __currentPos = (pos).__add__((dir).__mul__(__curDist));
		
			//This shouldn't be neccesary, we're doing the same work twice, we should be moving outside the object until we hit the edge.
			var __hitObject = collision_point(__currentPos.x, __currentPos.y, obj, true, true);
		
			if(__hitObject != null)
			{
			
				__hitInfo.point  = __currentPos;
				__hitInfo.object = __hitObject;
			
				var radAngle = degtorad(__hitObject.image_angle);
		
				var _x = __hitObject.x - ((__hitObject.sprite_xoffset * cos(radAngle)) + (__hitObject.sprite_yoffset * sin(radAngle)));
				var _y = __hitObject.y + ((__hitObject.sprite_xoffset * sin(radAngle)) - (__hitObject.sprite_yoffset * cos(radAngle)));

				var __center = new vec2(
					/*x*/_x + ((__hitObject.sprite_width * 0.5 * cos(radAngle)) + (__hitObject.sprite_height * 0.5 * sin(radAngle))),
					/*y*/_y - ((__hitObject.sprite_width * 0.5 * sin(radAngle)) - (__hitObject.sprite_height * 0.5 * cos(radAngle))));

				var angle = radtodeg(arctan2(__hitObject.sprite_height * 0.5, __hitObject.sprite_width * 0.5));
				var distance = sqrt(sqr(__hitObject.sprite_width * 0.5) + sqr(__hitObject.sprite_height * 0.5));
		
				var corners = [__center.x + lengthdir_x(distance, __hitObject.image_angle + angle),
							   __center.y + lengthdir_y(distance, __hitObject.image_angle + angle),
							   __center.x + lengthdir_x(distance, __hitObject.image_angle + 180 - angle),
							   __center.y + lengthdir_y(distance, __hitObject.image_angle + 180 - angle),
							   __center.x + lengthdir_x(distance, __hitObject.image_angle - angle),
							   __center.y + lengthdir_y(distance, __hitObject.image_angle - angle),
							   __center.x + lengthdir_x(distance, __hitObject.image_angle - 180 + angle),
							   __center.y + lengthdir_y(distance, __hitObject.image_angle - 180 + angle)];
							   
				__distances[0] = abs((corners[3] - corners[7]) * __currentPos.x - (corners[2] - corners[6]) * __currentPos.y + (corners[2] * corners[7]) - (corners[3] * corners[6])) / (sqrt(sqr(corners[3] - corners[7]) + sqr(corners[2] - corners[6])));
				__distances[1] = abs((corners[7] - corners[5]) * __currentPos.x - (corners[6] - corners[4]) * __currentPos.y + (corners[6] * corners[5]) - (corners[7] * corners[4])) / (sqrt(sqr(corners[7] - corners[5]) + sqr(corners[6] - corners[4])));
				__distances[2] = abs((corners[1] - corners[5]) * __currentPos.x - (corners[0] - corners[4]) * __currentPos.y + (corners[0] * corners[5]) - (corners[1] * corners[4])) / (sqrt(sqr(corners[1] - corners[5]) + sqr(corners[0] - corners[4])));
				__distances[3] = abs((corners[1] - corners[3]) * __currentPos.x - (corners[0] - corners[2]) * __currentPos.y + (corners[0] * corners[3]) - (corners[1] * corners[2])) / (sqrt(sqr(corners[1] - corners[3]) + sqr(corners[0] - corners[2])));
		
				var lowest = 0;
				for(var _index = 1; _index < 4; _index += 1)
				{
					if(__distances[_index] < __distances[lowest])
					{
						lowest = _index;
					}
				}
			 
				__hitInfo.normal = new vec2(
					/*x*/((lowest % 2 == 0) ? lowest - 1 : 0),
					/*y*/((lowest % 2 == 1) ? lowest - 2 : 0));
			
				return __hitInfo;
			}
		
			//__curDist += 1;
		}
	
		Debug.Log("Ray gone wild");
		return null;
	}
}