/// @description Destroy if being clicked outside of
if (!position_meeting(mouseX, mouseY, id) && mouse_check_button_pressed(mb_left)){
    instance_destroy();
    
    if (instance_exists(oUITexButton)){
        instance_destroy(oUITexButton);
    }
}



