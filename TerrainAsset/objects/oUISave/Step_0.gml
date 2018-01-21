/// @description save on click
/*
Stuff to save:

surfaces in layersDS
size of layersDS
their properties in propsDS
*/
if (UIClick()){
    //surfaces to buffer files
    for(var i=0; i<ds_list_size(oEditor.layersDS); i++){
        var _surf = oEditor.layersDS[|i];
        
        var _buff = buffer_create(4 * room_width * room_height, buffer_grow, 1);
        buffer_get_surface(_buff, _surf, 0, 0, 0);
        
        buffer_save(_buff, global.saveFile + "/surf_" + string(i) + ".buff");
    
        buffer_delete(_buff);
    }
    
    //info to ini
    ini_open(global.saveFile + "/info");
    
    ini_write_real("main", "layers", ds_list_size(oEditor.layersDS));
    ini_write_real("main", "room_width", room_width);
    ini_write_real("main", "room_height", room_height);
    
    for(var i=0; i<ds_list_size(oEditor.propsDS); i++){
        var section = "layer_" + string(i);
        ini_write_real(section, "num", getProp(i, pr.num));
        ini_write_real(section, "color", getProp(i, pr.color));
        ini_write_real(section, "tex", getProp(i, pr.tex));
    }
    
    //test string save
    ini_write_string("surfs", global.saveFile, surface_to_string(oEditor.layersDS[|0]));
    
    ini_close();
    
    //textpop
    textpop("Saved to " + global.saveFile);
}

/* */
/*  */
