/// @description If clicked, set texture for layer
if (UIClick()){
    //no texture
    if (sprite_index==sUITexButton){
        setProp(layerID, pr.tex, -1);
    }
    else{ //texture
        setProp(layerID, pr.tex, sprite_index);
    }
}

//Full alpha for selected
if (getProp(layerID, pr.tex)==sprite_index){
    image_alpha = 1;
}
else{
    image_alpha = 0.7;
}

