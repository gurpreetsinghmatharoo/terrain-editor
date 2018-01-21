/// @description  surface_save_sprite(surface, sprite);
/// @function  surface_save_sprite
/// @param surface
/// @param  sprite
if (sprite_exists(argument1)){
    sprite_delete(argument1);
}

var spr = sprite_create_from_surface(argument0, 0, 0,
    surface_get_width(argument0), surface_get_height(argument0),
    false, false, 0, 0);
    
return spr;
