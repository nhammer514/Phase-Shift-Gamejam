var _key_left = keyboard_check(vk_left);
var _key_right = keyboard_check(vk_right);
var _key_up = keyboard_check_pressed(vk_up);
var _key_control = keyboard_check_pressed(vk_control);

var _on_ground = place_meeting(x,y+1,obj_gamerules.solid_objects);

var _direction = _key_right - _key_left;

if changing_phase == true{
	_direction = 0
}


#region CONTROLS & ACTIONS

if _key_up && _on_ground && (!changing_phase)
{
	y_spd += jump_strength
}

if _key_control
{
	changing_phase = !changing_phase
}

if changing_phase
{
	
	if _key_right
	{
		obj_gamerules.time+=5
	}
	if _key_left
	{
		obj_gamerules.time-=5
	}
}
#endregion

#region MOVEMENT

if (_direction != 0) && (x_spd != (_direction*x_max_spd))
{
	x_spd += (x_acceleration * _direction)
}
else if (_direction == 0) && (x_spd != 0) && _on_ground{
	x_spd -= (x_acceleration * sign(x_spd))
}

if (place_meeting(x+x_spd, y, obj_gamerules.solid_objects))
{
	while (!place_meeting(x+sign(x_spd),y,obj_gamerules.solid_objects))
	{
		x += sign(x_spd);
	}
	x_spd = 0;
}


y_spd = y_spd + obj_gamerules.y_gravity
if (place_meeting(x, y+y_spd, obj_gamerules.solid_objects))
{
	if (!place_meeting(x,y+sign(y_spd),obj_gamerules.solid_objects))
	{
		y += sign(y_spd);
	}
	y_spd = 0;
}

#endregion


x += x_spd;
y += y_spd;

