time = 270
x_gravity = 0
y_gravity = 0.25
solid_objects = [obj_obstacle]

// Play music
if (!variable_global_exists("music_id")) {
	// If it doesn't exist, this is the first time running.
	// Play the music and store its ID in the global variable.
	global.music_id = audio_play_sound(clairdelune, 1, true);
}