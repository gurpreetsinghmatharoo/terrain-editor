///mouse_input();
//input
globalvar mouseX, mouseY, mouseInput;
mouseInput = mouse_check_button(mb_left) - mouse_check_button(mb_right);
mouseX = device_mouse_x_to_gui(0) - panelW;
mouseY = device_mouse_y_to_gui(0) - panelH;

//Mouse input inside view
if (mouseX >= 0 && mouseY >= 0){
    mouseX += viewX;
    mouseY += viewY;
}
