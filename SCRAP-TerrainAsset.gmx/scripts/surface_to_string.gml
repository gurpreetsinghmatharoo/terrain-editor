/// surface_to_string(surface);
//Converts a surface into a buffer into a string. Returns the string

var surf = argument0;
var surfW = surface_get_width(surf);
var surfH = surface_get_height(surf);

var buff = buffer_create(4*surfW*surfH, buffer_grow, 1);
buffer_get_surface(buff, surf, 0, 0, 0);

var str = "";

buffer_seek(buff, buffer_seek_start, 0);

for(var j=0; j < surfH; j++){
    for(var i=0; i < surfW; i++){
        var b = buffer_read(buff, buffer_u8);
        var g = buffer_read(buff, buffer_u8);
        var r = buffer_read(buff, buffer_u8);
        var a = buffer_read(buff, buffer_u8);
        
        str = str + d3(b) + d3(g) + d3(r) + d3(a);
    }
}

buffer_delete(buff);

return str;
