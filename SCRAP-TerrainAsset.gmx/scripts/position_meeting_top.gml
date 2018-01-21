/// position_meeting_top(x, y, id);
//Returns whether an instance is on the top at a position

var _x = argument0;
var _y = argument1;
var _id = argument2;

var instAtPos = noone;

for(var i=0; i<instance_count; i++){
    var inst = instance_id[i];
    
    if (position_meeting(_x, _y, inst) && (instAtPos==noone || inst.depth < instAtPos.depth)){
        instAtPos = inst;
    }
}

if (instAtPos==_id) return true;
else return false;
