// Player States
enum PLAYER_STATE {
	NORMAL,
	LEVEL_END
}

state = PLAYER_STATE.NORMAL;

// Other variables
x_spd = 0;
y_spd = 0;
x_max_spd = 4;
y_max_spd = 10;
x_acceleration = 0.5;
jump_strength = -10; // Must be a negative value!
time_change_speed = 5;
is_manipulating_time = false;
has_key = false;