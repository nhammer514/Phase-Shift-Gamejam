// font + alignment
draw_set_font(babafont);
draw_set_halign(fa_center);


// compute scales
var x_scale = 2;
var y_scale = 2;

// draw text
draw_set_alpha(0.5)
draw_text_transformed(x, y, "arrow keys or wasd to move",x_scale, y_scale, 0);

