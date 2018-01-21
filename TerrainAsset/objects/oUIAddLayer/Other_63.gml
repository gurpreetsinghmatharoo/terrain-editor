/// @description **UNUSED**
var i_d = async_load[? "id"];

if (i_d==popUp){
    if (async_load[? "status"]){
        var result = async_load[? "result"];
    
        if (result != "" && ds_map_find_value(global.colorMap, result)!=undefined){
           addLayer(global.colorMap[? result]);
        }
    }
}

/* */
/*  */
