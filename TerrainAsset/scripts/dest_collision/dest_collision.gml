/// @description  dest_collision(x, y);
/// @function  dest_collision
/// @param  x
/// @param  y
// Checks for a box collision
var X = argument[0];
var Y = argument[1];

//New bbox positions
var bLeft = X + (bbox_left - x);
var bRight = X + (bbox_right - x);
var bTop = Y + (bbox_top - y);
var bBottom = Y + (bbox_bottom - y);

//Check in grids
for(var i=0; i<instance_number(oTerrainLayer); i++){
	var ID = instance_find(oTerrainLayer, i);
	
	if (ds_grid_value_exists(ID.grid, bLeft, bTop, bRight, bBottom, 1)){
		return 1+ID.num;
	}
}

return false;