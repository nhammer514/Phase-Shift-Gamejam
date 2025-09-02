if array_contains(specialized_phases,obj_moon.phase){
	
	if !array_contains(obj_gamerules.solid_objects,id)
	{
		array_insert(obj_gamerules.solid_objects, -1, id)
	}
	sprite_index = spr_phase_obstacle
	image_speed = 1
	
}
else{
	
	if array_contains(obj_gamerules.solid_objects,id)
	{
		var _obj_index = array_get_index(obj_gamerules.solid_objects, id)
		array_delete(obj_gamerules.solid_objects,_obj_index,1)
	}
	sprite_index = spr_phase_obstacle_inactive
	
}