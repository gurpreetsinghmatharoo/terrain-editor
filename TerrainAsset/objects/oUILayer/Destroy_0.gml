/// @description Destroy children instances
for(var i=0; i<ds_list_size(childButtons); i++){
    var bInst = childButtons[|i];
    instance_destroy(bInst);
}

