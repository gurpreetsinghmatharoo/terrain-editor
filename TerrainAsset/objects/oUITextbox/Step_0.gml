/// @description type
//typing on
if (UIClick() && !typing){
    typing = true;
    image_index = 1;
    keyboard_string = text;
}

//typing
if (typing){
    text = keyboard_string;
}

//typing off (submit)
if ((((!position_meeting(mouseX, mouseY, id) && 
    mouse_check_button_pressed(mb_left))  || keyboard_check_pressed(vk_enter))) && typing){
    typing = false;
    image_index = 0;
    
    //change var based on type
    switch(tbType){
        case tb.brushSize: oEditor.brushSize = real(string_digits(text)); break;
        case tb.saveFile: global.saveFile = text; break;
    }
}

