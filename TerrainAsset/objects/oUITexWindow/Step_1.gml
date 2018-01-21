/// @description Create tex buttons
if (!firstStep) exit;

var w=0, h=0, m=8, d=48;
for(var i=-1; i<ds_list_size(global.texList); i++){
    if (i==-1){ //create one empty texture button
        var texB = instance_create(x+m, y+m, oUITexButton);
        texB.layerID = layerID;
    }
    else{//create buttons according to tex list
        var _tex = global.texList[|i];
        
        var texB = instance_create((x+m) + (d*w), (y+m) + (d*h), oUITexButton);
        texB.layerID = layerID;
        texB.sprite_index = _tex;
    }
    
    //pos
    w++;
    
    if (w>sprite_width/d){
        w=0;
        h++;
    }
}

firstStep = false;

