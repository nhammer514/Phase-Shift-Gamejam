/// Button creation script
var room_center_x = room_width / 2;
var room_center_y = room_height / 2;

var b = instance_create_layer(room_center_x, room_center_y - 100, "Instances_1", obj_button);
b.button_text = "Play";
b.button_function = function() {
	room_goto(Level1);
	};

// Example: Quit button
var quit_btn = instance_create_layer(room_center_x, room_center_y + 100, "Instances_1", obj_button);
quit_btn.button_text = "Quit";
quit_btn.button_function = function() {
    game_end();
};