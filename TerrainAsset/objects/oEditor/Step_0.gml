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
			//Get surface
            var _surf = layersDS[| i];
			var _surfW = surface_get_width(_surf);
			var _surfH = surface_get_height(_surf);
            
			//Create layer inst
            var lrr = instance_create(0, 0, oTerrainLayer);
            
            /*var spr = sprite_create_from_surface(_surf, 0, 0,
                surface_get_width(_surf), surface_get_height(_surf),
                false, false, 0, 0);
                
            sprite_collision_mask(spr, false, 0, 0, 0, 0, 0, 0, 0);
            terrainInst[i].sprite_index = spr;
            terrainInst[i].mask_index = spr;*/
			
			//Set surface
			lrr.surf = _surf;
			
			//Surface buffer
			lrr.buff = buffer_create(4*_surfW*_surfH, buffer_fixed, 1);
			buffer_get_surface(lrr.buff, lrr.surf, 0, 0, 0);
			
			//Buffer to grid
			lrr.grid = ds_grid_create(_surfW, _surfH);
			buffer_to_grid(lrr.buff, lrr.grid);
			
			//Properties
			lrr.num = i;
            lrr.depth += getProp(i, pr.num);
			
			//Add to array
			terrainInst[i] = lrr;
        }
        //create player
        instance_create(mouseX, mouseY, oPlayer);
    }
    //if editing, remove terrain instance
    else{
		//Remove layers
		with(oTerrainLayer){
			surface_free(surf);
			ds_grid_destroy(grid);
			buffer_delete(buff);
		}
		//Remove player
        instance_destroy(oPlayer);
    }
}

