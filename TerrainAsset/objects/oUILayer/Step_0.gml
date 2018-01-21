/// @description Color for layer
image_blend = getProp(layerID, pr.color);

///Delayed create (create child buttons)
if (createTime>0) exit;

//select layer
var selB = instance_create(x-8, y+8, oUISelectLayer);
selB.layerID = layerID;

//move arrows
var lastColX = x + sprite_width - 16;

var upAB = instance_create(lastColX, y, oUILayerMove);
var downAB = instance_create(lastColX, y+16, oUILayerMove);
upAB.layerID = layerID;
downAB.layerID = layerID;
downAB.image_index = 1;

//tex select button
var texSelect = instance_create(x+16, y+8, oUITexSelect);
texSelect.layerID = layerID;

//add to list
ds_list_add(childButtons, selB, upAB, downAB, texSelect);

//create time
createTime++;

