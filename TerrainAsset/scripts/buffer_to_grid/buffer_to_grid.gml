/// @desc buffer_to_grid
/// @arg buffer
/// @arg grid
/// Converts a buffer surface to a grid

var Buff = argument0;
var Grid = argument1;

buffer_seek(Buff, buffer_seek_start, 0);

for(var h=0; h<ds_grid_height(Grid); h++){
    for(var w=0; w<ds_grid_width(Grid); w++){
        //var alpha = buffer_get_alpha(Buff, w, h);
		//var r = buffer_read(Buff, buffer_u8);
		//var g = buffer_read(Buff, buffer_u8);
		//var b = buffer_read(Buff, buffer_u8);
		buffer_seek(Buff, buffer_seek_relative, 3);
		var a = buffer_read(Buff, buffer_u8);
        
        ds_grid_set(Grid, w, h, a/255);
    }
}