/// @description Click move layer
if (UIClick()){
    //set moving direction
    var moving;
    if (image_index==0) moving = -1;
    else moving = 1;
    
    //get layer num
    var lrNum = getProp(layerID, pr.num);
    
    //check if in range
    var numMove = lrNum + moving;
    
    if (numMove >= 0 && numMove < ds_list_size(oEditor.layersDS)){
        //move the num at that place to this place
        var lrDatNumID = getLayerAtNum(numMove);
        setProp(lrDatNumID, pr.num, lrNum);
        
        //move to the place
        setProp(layerID, pr.num, numMove);
    }
}

