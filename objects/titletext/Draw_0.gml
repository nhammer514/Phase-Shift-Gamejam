// font + alignment
draw_set_font(babafont);
draw_set_halign(fa_center);

// sine oscillator
var osc = sin(breathe_timer * 2 * pi); // [-1, 1]

// compute scales
var scale_x = base_scale_x * (1 + osc * breathe_amp);
var scale_y = base_scale_y * (1 + osc * breathe_amp);

// vertical bobbing
var y_offset = osc * vertical_amp_px;

// compute alpha (fade with breathing)
var alpha = lerp(fade_min_alpha, fade_max_alpha, (osc + 1) * 0.5);

// draw text
draw_set_alpha(alpha);
draw_text_transformed(x, y - 350 + y_offset, "untitled moon game", scale_x, scale_y, 0);
draw_set_alpha(1); // reset alpha
