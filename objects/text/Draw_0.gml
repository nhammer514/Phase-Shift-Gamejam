// font + alignment
draw_set_font(babafont);
draw_set_halign(fa_center);

var center_x = window_get_width()/2; 
var center_y = window_get_height()/2;
// compute scales
var x_scale = 2;
var y_scale = 2;

// draw text
draw_set_alpha(0.5)
draw_text_transformed(center_x, center_y + 40, displaytext,x_scale, y_scale, 0);

