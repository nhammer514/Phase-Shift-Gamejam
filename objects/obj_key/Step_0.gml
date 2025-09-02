// --- APPLY GRAVITY ---
y_spd += obj_gamerules.y_gravity;

// --- CHECK FOR COLLISION WITH SOLIDS ---
var _solids = obj_gamerules.solid_objects;

if (place_meeting(x, y + y_spd, _solids)) {

    while (!place_meeting(x, y + sign(y_spd), _solids)) {
        y += sign(y_spd);
    }

    y_spd = 0;
}


// --- UPDATE POSITION ---
y += y_spd;