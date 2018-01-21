/// clearLayers();
//Removes all layers

//Clear surfaces from list
for(var i=0; i<ds_list_size(oEditor.layersDS); i++){
    var _surf = oEditor.layersDS[|i];
    
    surface_free(_surf);
    
    global.surfCleared = true;
}

//Empty buffers
for(var i=0; i<array_length_1d(oEditor.bufferArr); i++){
    var _buff = oEditor.bufferArr[i];
    
    buffer_delete(_buff);
}

ds_list_clear(oEditor.layersDS);
ds_list_clear(oEditor.propsDS);
instance_destroy(oUILayer);
