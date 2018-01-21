/// @description Maintain layer buttons

with(oUILayer){
    //Maintain position
    
    var lrNum = getProp(layerID, pr.num);
    
    UISetPos(id, layerUIX, layerUIY + (layerUIH*lrNum));
}

