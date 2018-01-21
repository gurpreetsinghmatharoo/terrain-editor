/// Buffer_get_surface(buffer, surface, bla, bla, bla);
var buff = argument[0];
var surf = argument[1];
buffer_seek(buff, buffer_seek_start, 0);

surface_set_target(surf);
    draw_clear_alpha(c_white, 0);

    for( var j=0; j < surface_get_width(surf); j++ ){
        for( var i=0; i < surface_get_width(height); i++ ){
            var b = buffer_read(buff, buffer_u8);
            var g = buffer_read(buff, buffer_u8);
            var r = buffer_read(buff, buffer_u8);
            var a = buffer_read(buff, buffer_u8);
            
            buffer_write(buff, buffer_u8, r);
            buffer_write(buff, buffer_u8, g);
            buffer_write(buff, buffer_u8, b);
            buffer_write(buff, buffer_u8, a);
            draw_set_color(make_colour_rgb(r, g, b));
            draw_set_alpha(a);
            draw_point(i, j);
        }
    }
surface_reset_target();

draw_set_color(c_white);
draw_set_alpha(1);
