function Collider(_pointA, _pointB) constructor
{
	#region Constructor
	
	self.surface = new Line(_pointA, _pointB);
	self.normal  = self.surface.PerpendicularNormal();
	self.surfaceLength  = self.surface.Length();
	self.surfaceLengthSquared  = self.surface.LengthSquared();
	
	#endregion
	
	#region Functions
	
	static Draw = function()
    {
		draw_set_color(c_red);
		
		var _origin = surface.origin;
		var _ending = surface.ending;

		//draw_set_color(c_green);
		draw_line_width(_origin.x, _origin.y, _ending.x, _ending.y, 2);
		
		draw_circle(_origin.x, _origin.y, 6, false);
		
		draw_circle(_ending.x, _ending.y, 6, false);

		//---------------------------------------------

		var _center = surface.Center();

		var _norm = normal;

		_norm = (_norm).__mul__(surfaceLength / 10);
		//(_norm).__c_mul__(surfaceLength);
		(_norm).__c_add__(_center);

		draw_set_color(c_aqua);
		draw_line_width(_center.x, _center.y, _norm.x, _norm.y, 2);
	}
	
	#endregion
}