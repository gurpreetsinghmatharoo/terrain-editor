/// @description Draw to selected terrain surface (layer)
/// @function Draw to selected terrain surface 
/// @param layer
if (!global.playing && !UIOpen() && mouseX>0 && mouseY>0){ //Only if not playing and no UI windows open
    //surface (layer) to draw on
    var _surf = layersDS[| curLayer];
    surface_set_target(_surf);
    
    //left button (draw)
    if (mouseInput > 0){
        var _color = getProp(curLayer, pr.color);
        draw_set_color(_color);
    
        //draw line
        draw_line_circle(mouse_xx, mouse_yy, mouseX, mouseY, brushSize, 4);
        draw_set_color(c_white);
    }
    //right button (erase)
    else if (mouseInput < 0){
        //erase
        draw_set_blend_mode(bm_subtract);
        draw_line_circle(mouse_xx, mouse_yy, mouseX, mouseY, brushSize, 4);
        draw_set_blend_mode(bm_normal);
    }
    
    //reset
    surface_reset_target();
}
 
//texture
overlayTexture();

