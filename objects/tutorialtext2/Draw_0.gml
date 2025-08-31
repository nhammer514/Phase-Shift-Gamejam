// font + alignment
draw_set_font(babafont);
draw_set_halign(fa_center);


// compute scales
var x_scale = 1.5;
var y_scale = 1.5;

// draw text
draw_set_alpha(0.5)
draw_text_transformed(x, y, "CTRL to shift moon phase",x_scale, y_scale, 0);

