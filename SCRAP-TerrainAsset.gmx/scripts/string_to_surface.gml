/// string_to_surface(string, surface);
//Converts a string into a buffer into a surface

var str = argument0;
var surf = argument1;
var surfW = surface_get_width(surf);
var surfH = surface_get_height(surf);

var buff = buffer_create(4*surfW*surfH, buffer_grow, 1);

buffer_seek(buff, buffer_seek_start, 0);

for(var j=0; j < surfH; j++){
    for(var i=0; i < surfW; i++){
        var pos = 1+(((j*surfW) + i)*12);
        
        var b = string_copy(str, pos, 3);
        var g = string_copy(str, pos+3, 3);
        var r = string_copy(str, pos+6, 3);
        var a = string_copy(str, pos+9, 3);
        
        buffer_write(buff, buffer_u8, b);
        buffer_write(buff, buffer_u8, g);
        buffer_write(buff, buffer_u8, r);
        buffer_write(buff, buffer_u8, a);
    }
}

buffer_set_surface(buff, surf, 0, 0, 0);

buffer_delete(buff);

return str;
