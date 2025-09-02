if (other.has_key == true) {
    // Optional: Play an unlocking sound
    audio_play_sound(snd_dooropen, 10, false);
    
    // The player has the key, so destroy the door
    instance_destroy();
    
    other.has_key = false;
}
else {
    // Optional: The player doesn't have the key, play a "locked" sound
    // audio_play_sound(snd_door_locked, 10, false);
}