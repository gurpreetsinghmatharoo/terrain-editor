/// @description  overlayTexture(layer);
/// @function  overlayTexture
/// @param layer
//Overlays color, then texture

for(var i=0; i<ds_list_size(layersDS); i++){
    var _surf = layersDS[| i];
    
    surface_set_target(_surf);
    
    var _color = getProp(i, pr.color);
    draw_set_color(_color);
    
    //overlay layer with color
    draw_set_blend_mode_ext(bm_dest_alpha, bm_zero);
    draw_rectangle(0, 0, room_width, room_height, false);
    draw_set_blend_mode(bm_normal);
    
    //draw texture
    var _tex = getProp(i, pr.tex);
    
    if (_tex!=-1){
        draw_set_blend_mode_ext(bm_zero, bm_src_color);
        draw_sprite_tiled(_tex, 0, 0, 0);
        draw_set_blend_mode(bm_normal);
    }
    
    surface_reset_target();
}
