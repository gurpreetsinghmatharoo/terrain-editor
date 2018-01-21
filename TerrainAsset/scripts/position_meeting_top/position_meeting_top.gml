/// @description  position_meeting_top(x, y, id);
/// @function  position_meeting_top
/// @param x
/// @param  y
/// @param  id
//Returns whether an instance is on the top at a position

var _x = argument0;
var _y = argument1;
var _id = argument2;

var instAtPos = noone;

for(var i=0; i<instance_count; i++){
    var inst = instance_id_get( i );
    
    if (position_meeting(_x, _y, inst) && (instAtPos==noone || inst.depth < instAtPos.depth)){
        instAtPos = inst;
    }
}

if (instAtPos==_id) return true;
else return false;
