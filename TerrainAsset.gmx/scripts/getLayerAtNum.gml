/// getLayerAtNum(num);

for(var i=0; i<ds_list_size(oEditor.layersDS); i++){
    var _num = getProp(i, pr.num);
    
    if (_num==argument0){
        return i;
    }
}
