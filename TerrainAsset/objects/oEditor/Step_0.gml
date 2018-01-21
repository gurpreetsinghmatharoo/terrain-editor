/// @description Step functions
mouse_input();

//hotkeys
if (keyboard_check_pressed(ord("R"))){
    room_restart();
}

//pan
if (mouse_check_button(mb_middle) || keyboard_check(panKey)){
    var mouseDX = mouse_xx - mouseX;
    var mouseDY = mouse_yy - mouseY;
    
    viewX = clamp(viewX + (mouseDX*panSpeed), 0, room_width-viewW);
    viewY = clamp(viewY + (mouseDY*panSpeed), 0, room_height-viewH);
}

//play
if (keyboard_check_pressed(playKey) && !global.editing){
    global.playing = !global.playing;
    
    //if playing, create terrain instances
    if (global.playing){
        //create terrains
        for(var i=0; i<ds_list_size(layersDS); i++){
            var _surf = layersDS[| i];
            
            terrainInst[i] = instance_create(0, 0, oTerrainLayer);
            
            var spr = sprite_create_from_surface(_surf, 0, 0,
                surface_get_width(_surf), surface_get_height(_surf),
                false, false, 0, 0);
                
            sprite_collision_mask(spr, false, 0, 0, 0, 0, 0, 0, 0);
            terrainInst[i].sprite_index = spr;
            terrainInst[i].mask_index = spr;
            terrainInst[i].depth = getProp(i, pr.num);
        }
        //create player
        instance_create(mouseX, mouseY, oPlayer);
    }
    //if editing, remove terrain instance
    else{
        instance_destroy(oTerrain);
        instance_destroy(oPlayer);
    }
}

