// temporary thingy. idk how you guys wanna set up the interface stuff, but you can delete this later (nathan)
var _key_enter = keyboard_check_pressed(vk_enter)
if _key_enter 
{
	room_goto(Level1)
}

// delta_time is in microseconds, so divide by 1,000,000 to get seconds
breathe_timer += (delta_time / 1000000) * breathe_speed;


