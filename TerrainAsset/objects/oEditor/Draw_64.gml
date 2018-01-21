/// @description MAIN VIEW SURFACE
var mainSurf = surface_create_clear(portW, portH);
surface_set_target(mainSurf);

//Draw background
draw_background_tiled(sCheck, 0, 0);

//Put objects into priority
var prior = ds_priority_create();

for(var i=0; i<instance_count; i++){
    var inst = instance_id_get( i );
    if (sprite_exists(inst.sprite_index) && object_get_parent(inst.object_index)!=oEditorUI)
        ds_priority_add(prior, inst, inst.depth);
}

//Draw objects
while(ds_priority_size(prior)>0){
    var inst = ds_priority_delete_max(prior);

    with(inst){
		//TerrainLayer
		if (object_index==oTerrainLayer){
			//Surface restore
			if (!surface_exists(surf)){
				surf = oEditor.layersDS[| num];
			}
			
			//Draw
			draw_surface(surf, -viewX, -viewY);
		}
		//Normal objects
		else{
	        draw_sprite_ext(sprite_index, image_index, x-viewX, y-viewY,
	            image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		}
    }
}

ds_priority_destroy(prior);

//Put terrain surfaces into priority
var prior = ds_priority_create();

for(var i=0; i<ds_list_size(layersDS); i++){
    var lrr = layersDS[| i];
    ds_priority_add(prior, lrr, getProp(i, pr.num));
}

//Draw terrain surfaces
if (!global.playing){
    while(ds_priority_size(prior)>0){
        var _surf = ds_priority_delete_max(prior);
        draw_surface_part_ext(_surf, viewX, viewY, viewW, viewH, 0, 0, view_scale, view_scale, -1, 1);
    }
}

ds_priority_destroy(prior);

//Draw debug info
//draw_text(5, 5, "(" + string(window_get_width()) + ", " + string(window_get_height()) + ") / (" + string(winW) + ", " + string(winH) + ")");

surface_reset_target();





///UI SURFACE
var uiSurf = surface_create_clear(winW, winH);
surface_set_target(uiSurf);

//Background
draw_set_color(uiBackC);
draw_rectangle(0, 0, winW, panelH, false);
draw_rectangle(0, 0, panelW, winH, false);
draw_set_color(c_white);

//Color for UI fores
draw_set_color(c_black);
draw_set_font(ftUI);

//Layers separator
draw_line(0, panelH, panelW, panelH);

//Layers text
draw_text(32, panelH+16, string_hash_to_newline("Layers"));

//Reset color
draw_set_color(c_white);

//Put UI objects into priority
var prior = ds_priority_create();

for(var i=0; i<instance_count; i++){
    var inst = instance_id_get( i );
    if (sprite_exists(inst.sprite_index) && object_get_parent(inst.object_index)==oEditorUI)
        ds_priority_add(prior, inst, inst.depth);
}

//UI Objects
while(ds_priority_size(prior)>0){
    var inst = ds_priority_delete_max(prior);

    with(inst){
        draw_sprite_ext(sprite_index, image_index, x+panelW, y+panelH,
            image_xscale, image_yscale, image_angle, image_blend, image_alpha);
            
        //textbox text
        if (object_index==oUITextbox){
            //cursor
            var cursor = "|";
            if (current_time/500 mod 2){
                cursor = "";
            }
            
            var finalText = text;
            if (typing) finalText = text + cursor;
        
            //text
            draw_set_font(ftTextbox);
            draw_set_color(c_black);
            draw_text(x+panelW+2, y+panelH+2, string_hash_to_newline(finalText));
            
            draw_set_color(c_white);
        }
        
        //pop up text
        if (object_index==oUITextpop){
            draw_set_color(c_black);
            draw_set_alpha(image_alpha);
            draw_text(x+panelW+16, y+panelH, string_hash_to_newline(text));
            draw_set_alpha(1);
            draw_set_color(c_white);
        }
        
        //layer buttons text
        if (object_index==oUILayer || object_index==oUISelectLayer || object_index==oUILayerMove || object_index==oUITexSelect){
            draw_set_color(c_black);
            draw_text(x+panelW, y+panelH-8, string_hash_to_newline(layerID));
            draw_set_color(c_white);
        }
		
		//save/load buttons
		if (object_index==oUISave || object_index==oUILoad || object_index==oUIExport){
			draw_set_font(ftUISmall);
			
            draw_set_color(c_black);
            draw_text(x+panelW, y+panelH, text);
            draw_set_color(c_white);
			
			draw_set_font(ftUI);
        }
    }
}

ds_priority_destroy(prior);

surface_reset_target();

///Draw surfaces to screen
draw_surface(mainSurf, panelW, panelH);
draw_surface(uiSurf, 0, 0);

//Free memory
surface_free(mainSurf);
surface_free(uiSurf);

/*/Debug
draw_text(5, 32, string(ds_exists(layersDS, ds_type_list)));
//Draw layer info
draw_set_color(c_black);
for(var i=0; i<ds_list_size(layersDS); i++){
    draw_text(5, 50 + (20*i), getProp(i, pr.num));
}

/* */
/*  */
