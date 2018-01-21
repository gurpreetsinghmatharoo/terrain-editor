/// @description load on click
/*
Stuff to load:

surfaces in layersDS
their properties in propsDS
*/
if (UIClick() && directory_exists(working_directory + global.saveFile)){
    //refresh layers
    clearLayers();

    //buffer files to surfaces
    ini_open(global.saveFile + "/info");
    
    var lrSize = ini_read_real("main", "layers", 1);
    
    room_width = ini_read_real("main", "room_width", 1024);
    room_height = ini_read_real("main", "room_height", 768);
    
    for(var i=0; i<lrSize; i++){
        addLayer();
        
        //buffer to surface
        var _buff = buffer_load(global.saveFile + "/surf_" + string(i) + ".buff");
        var _surf = oEditor.layersDS[|i];
        Buffer_set_surface(_buff, _surf, 0, 0, 0);
        
        buffer_delete(_buff);
        
        //props
        var section = "layer_" + string(i);
        setProp(i, pr.num, ini_read_real(section, "num", 0));
        setProp(i, pr.color, ini_read_real(section, "color", 0));
        setProp(i, pr.tex, ini_read_real(section, "tex", 0));
    }
    
    ini_close();
    
    //textpop
    textpop("Loaded from " + global.saveFile);
}
else if (UIClick()){
    textpop(global.saveFile + " not found");
}

/* */
/*  */
