// Check if mouse is inside the button
if(position_meeting(mouse_x, mouse_y, self))
{
    if (button_function != noone) {
        button_function(); // Call the assigned click function immediately
    }
}