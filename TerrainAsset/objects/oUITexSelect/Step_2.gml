/// @description Open tex window on click
if (UIClick() && !instance_exists(oUITexWindow)){
    var tWin = instance_create(x, y, oUITexWindow);
    tWin.layerID = layerID;
}

