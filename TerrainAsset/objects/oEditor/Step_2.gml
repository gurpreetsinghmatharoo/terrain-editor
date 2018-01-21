/// @description Set editing state
global.editing = false;

with(oUITextbox){
    if (typing){
        global.editing = true;
    }
}

