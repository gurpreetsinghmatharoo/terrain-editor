/// @description  dest_collision_precise(x, y);
/// @function  dest_collision_precise
/// @param  x
/// @param  y
// Checks for a precise collision
var X = argument[0];
var Y = argument[1];

//Sprite -> surface -> buffer
var sprW = abs(sprite_width);
var sprH = abs(sprite_height);
var sprX = abs(sprite_xoffset);
var sprY = abs(sprite_yoffset);

var surf = surface_create(sprW, sprH);
var buff = buffer_create(4 * sprW * sprH, buffer_grow, 1);

surface_set_target(surf);
draw_sprite(sprite_index, image_index, sprX, sprY);
surface_reset_target();

buffer_get_surface(buff, surf, 0, 0, 0);

//Check in grids
for(var i=0; i<instance_number(oTerrainLayer); i++){
	var ID = instance_find(oTerrainLayer, i);
	
	buffer_seek(buff, buffer_seek_start, 0);
	
	for(var h=0; h<sprH; h++){
	    for(var w=0; w<sprW; w++){
			buffer_seek(buff, buffer_seek_relative, 3);
			var a = buffer_read(buff, buffer_u8)/255;
		
			var xx = (X-sprX)+w;
			var yy = (Y-sprY)+h;
        
			if (a!=0 && ID.grid[# xx, yy]==1){
				return 1+ID.num;
			}
	    }
	}
}

//Clean up
buffer_delete(buff);
surface_free(surf);

return false;