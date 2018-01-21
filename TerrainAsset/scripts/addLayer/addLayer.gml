/// @description  addLayer()
/// @function  addLayer
var layerNum = ds_list_size(oEditor.layersDS);

//add to layersDS
with (oEditor){
    //terrain surface
    var _surf = surface_create_clear(room_width, room_height);
    
    //layers
    ds_list_add(layersDS, _surf);
    
    //ds_list_add(spritesDS, _spr);
    
    //buffer
    bufferArr[layerNum] = buffer_create(4 * room_width * room_height, buffer_grow, 1);
    buffer_get_surface(bufferArr[layerNum], _surf, 0, 0, 0);
    
    //properties
    ds_list_add(propsDS, arrayC(layerNum, c_white, -1));
}

//create button
var lB = createUI(layerUIX, layerUIY + (layerUIH*layerNum), oUILayer);
lB.layerID = layerNum;
