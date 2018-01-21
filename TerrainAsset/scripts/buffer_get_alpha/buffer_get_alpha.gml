/// @description  buffer_get_alpha(buffer, x, y);
/// @function  buffer_get_alpha
/// @param buffer
/// @param  x
/// @param  y

var buff = argument0;
var X = argument1;
var Y = argument2;

buffer_seek(buff, buffer_seek_start, 4*((room_width*Y)+X));

var arr;
arr[0] = buffer_read(buff, buffer_u8);
arr[1] = buffer_read(buff, buffer_u8);
arr[2] = buffer_read(buff, buffer_u8);
arr[3] = buffer_read(buff, buffer_u8);

//return make_color_rgb(arr[0], arr[1], arr[2]);
return arr[3]/255;
