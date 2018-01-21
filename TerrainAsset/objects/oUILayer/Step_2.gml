/// @description Reposition child buttons
if (x!=xprevious || y!=yprevious){
    for(var i=0; i<ds_list_size(childButtons); i++){
        var xmPrev, ymPrev, bInst;
        bInst = childButtons[|i];
        xmPrev = bInst.x - xprevious;
        ymPrev = bInst.y - yprevious;
        
        bInst.x = x + xmPrev;
        bInst.y = y + ymPrev;
    }
}

