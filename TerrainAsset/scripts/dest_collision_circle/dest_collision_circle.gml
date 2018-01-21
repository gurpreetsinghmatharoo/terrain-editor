/// @description  dest_collision_circle(x, y, r);
/// @function  dest_collision_circle
/// @param  x
/// @param  y
/// @param  r 
// Checks for a circular collision
var X = argument[0];
var Y = argument[1];
var R = argument[2];

//Check in grids
for(var i=0; i<instance_number(oTerrainLayer); i++){
	var ID = instance_find(oTerrainLayer, i);
	
	if (ds_grid_value_disk_exists(ID.grid, X, Y, R, 1)){
		return 1+ID.num;
	}
}

return false;