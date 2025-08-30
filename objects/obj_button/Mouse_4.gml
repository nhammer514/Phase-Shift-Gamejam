// Check if mouse is inside the button
if (mouse_x > x - button_width/2 && mouse_x < x + button_width/2 &&
    mouse_y > y - button_height/2 && mouse_y < y + button_height/2) {
    
    if (button_function != noone) {
        button_function(); // Call the assigned click function immediately
    }
}