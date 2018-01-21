/// draw_line_circle(x1, y1, x2, y2, radius, precision);
var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;
var radius = argument4;
var prec = argument5;

var dir = point_direction(x1, y1, x2, y2);
var dist = point_distance(x1, y1, x2, y2);

for(var i=0; i<=dist; i+=prec){
    var xx = x1 + lengthdir_x(i, dir);
    var yy = y1 + lengthdir_y(i, dir);
    
    draw_circle(xx, yy, radius, false);
}
