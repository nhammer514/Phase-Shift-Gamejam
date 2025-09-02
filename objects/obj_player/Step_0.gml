// --- INPUT & CACHE VARIABLES ---

// Keyboard input for movement
var _key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));

// Keyboard input for time control
var _key_rewind = keyboard_check(vk_control);
var _key_fast_forward = keyboard_check(vk_shift);

// Room variables
var _room_right = room_width;
var _room_bottom = room_height;

// Reset check
if (keyboard_check_pressed(ord("R"))) {
	room_restart();
	exit;
}

// Cache variables
var _solids = obj_gamerules.solid_objects;
var _gravity = obj_gamerules.y_gravity;


// --- LEVEL COMPLETION ---

// This check overrides everything else.
if (state != PLAYER_STATE.LEVEL_END && instance_exists(instance_position(x, y, obj_level_end))) {
	audio_play_sound(clicksound, 5, false)
	state = PLAYER_STATE.LEVEL_END;
}


// --- STATE MACHINE LOGIC ---

switch (state) {
	
	// == NORMAL STATE ==
	case PLAYER_STATE.NORMAL:
		
		// Time control
		if (_key_rewind) {
			
			// --- Audio Feedback ---
			audio_sound_pitch(global.music_id, 0.5);
			
			if (!audio_is_playing(snd_time_manipulation)) {
				audio_play_sound(snd_time_manipulation, 10, true);
			}
			
			// --- Game Logic ---
			is_manipulating_time = true;
			x_spd = 0;
			y_spd = 0;
			obj_gamerules.time -= time_change_speed;
		}
		else if (_key_fast_forward) {
			
			// --- Audio Feedback ---
			audio_sound_pitch(global.music_id, 1.5);
			
			if (!audio_is_playing(snd_time_manipulation)) {
				audio_play_sound(snd_time_manipulation, 10, true);
			}
			
			// --- Game Logic ---
			is_manipulating_time = true;
			x_spd = 0;
			y_spd = 0;
			obj_gamerules.time += time_change_speed;
		}
		else {
			// --- Normal Time ---
			
			audio_stop_sound(snd_time_manipulation);
			
			if (is_manipulating_time) {
				audio_sound_pitch(global.music_id, 1); // Set pitch back to normal
				is_manipulating_time = false;
			}
			
			// --- Default to Normal Movement ---
			obj_gamerules.time += 0.01;
			
			// Movement
			var _direction = _key_right - _key_left;
			
			if (_direction != 0) {
				x_spd += _direction * x_acceleration;
				x_spd = clamp(x_spd, -x_max_spd, x_max_spd);
			}
			else {
				if (abs(x_spd) > x_acceleration) {
					x_spd -= sign(x_spd) * x_acceleration;
				} else {
					x_spd = 0;
				}
			}

			// Jumping
			var _on_ground = place_meeting(x, y + 1, _solids);
			if (_key_up && _on_ground) {
				y_spd = jump_strength;
			}
		}
		break;
		
	// == LEVEL END STATE ==
	case PLAYER_STATE.LEVEL_END:
		audio_stop_sound(snd_time_manipulation);
		x_spd = 0;
		y_spd = 0;
		break;
}


// --- PHYSICS & COLLISIONS ---

if (state != PLAYER_STATE.LEVEL_END) {
	// Gravity
	if (y_spd < y_max_spd) && !is_manipulating_time{
		y_spd += _gravity;
	}

	// Horizontal Collision
	if (place_meeting(x + x_spd, y, _solids)) {
		while (!place_meeting(x + sign(x_spd), y, _solids)) {
			x += sign(x_spd);
		}
		x_spd = 0;
	}
	x += x_spd;

	// Vertical Collision
	if (place_meeting(x, y + y_spd, _solids)) {
		while (!place_meeting(x, y + sign(y_spd), _solids)) {
			y += sign(y_spd);
		}
		y_spd = 0;
	}
	y += y_spd;
}

// --- OUT OF BOUNDS ---

if (bbox_top > _room_bottom || bbox_bottom < 0 || bbox_right < 0 || bbox_left > _room_right) {
	room_restart();
}