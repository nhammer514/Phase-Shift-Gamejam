
    var scale_x = button_width / sprite_width * 1.5;
    var scale_y = button_height / sprite_height * 1.5;
   
   // Draw the sprite centered at (x, y)
    draw_sprite_ext(
        sprite_index,
        image_index,
        x - (sprite_width * scale_x) / 2, // offset X
        y - (sprite_height * scale_y) / 2, // offset Y
        scale_x,
        scale_y,
        0,    // rotation
        c_white,
        1     // alpha
    );


// Draw button text
draw_set_color(text_color);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(x, y, button_text);
