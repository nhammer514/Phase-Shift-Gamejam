// Calculate the scales for the sprite
var scale_x = button_width / sprite_width * 1.5;
var scale_y = button_height / sprite_height * 1.5;

// Calculate the top-left corner of the scaled sprite to center
var draw_x = x - (sprite_width * scale_x) / 2;
var draw_y = y - (sprite_height * scale_y) / 2;

// Define the hitbox rectangle (scaled to match the sprite)
var left   = draw_x + (sprite_xoffset * scale_x);
var top    = draw_y + (sprite_yoffset * scale_y);
var right  = left + (sprite_width * scale_x);
var bottom = top  + (sprite_height * scale_y);

draw_sprite_ext(
    sprite_index,
    image_index,
    draw_x + (sprite_xoffset * scale_x),
    draw_y + (sprite_yoffset * scale_y),
    scale_x,
    scale_y,
    0,
    c_white,
    1
);
// Draw the button text
draw_set_color(text_color);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, button_text);