_player.collider.bounds.Draw();

draw_set_color(c_grey);
draw_circle(_player.collider.bounds.b_l.x, _player.collider.bounds.b_l.y, /*radius: */ 4, /*outline: */ false);
draw_circle(_player.collider.bounds.b_r.x, _player.collider.bounds.b_r.y, /*radius: */ 4, /*outline: */ false);
draw_circle(_player.collider.bounds.t_l.x, _player.collider.bounds.t_l.y, /*radius: */ 4, /*outline: */ false);
draw_circle(_player.collider.bounds.t_r.x, _player.collider.bounds.t_r.y, /*radius: */ 4, /*outline: */ false);


var _results = _player.collider.CheckBelow();
draw_set_color(c_yellow);
for(var _index = 0, _count = array_length(_results); _index < _count; _index += 1)
{
	var _result = _results[_index];
	if(_result != noone)
	{
		draw_circle(_result.x, _result.y, /*radius: */ 4, /*outline: */ false);
	}
}