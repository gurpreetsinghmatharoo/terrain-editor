/// @description surface backup
/*SCRAPPED CODE, WAS STUPID AND USING SPRITES INSTEAD OF BUFFERS/recreate and load surfaces if freed
for(var i=0; i<ds_list_size(layersDS); i++){
    var _surf = layersDS[| i];
    
    if (!surface_exists(_surf)){
        layersDS[| i] = surface_create_clear(room_width, room_height);
        surface_load_sprite(layersDS[| i], spritesDS[| i]);
    }
}

//save surfaces
for(var i=0; i<ds_list_size(layersDS); i++){
    var _surf = layersDS[| i];
    
    spritesDS[| i] = surface_save_sprite(layersDS[| i], spritesDS[| i]);
}*/

//Buffer alternative
//recreate and load surfaces if freed
for(var i=0; i<ds_list_size(layersDS); i++){
    var _surf = layersDS[| i];
    
    if (!surface_exists(_surf) && buffer_exists(bufferArr[i])){
        layersDS[| i] = surface_create_clear(room_width, room_height);
        buffer_set_surface(bufferArr[i], layersDS[| i], 0, 0, 0);
    }
}

//save surfaces
for(var i=0; i<ds_list_size(layersDS); i++){
    var _surf = layersDS[| i];
    
    buffer_get_surface(bufferArr[i], _surf, 0, 0, 0);
}

/* */
/*  */
