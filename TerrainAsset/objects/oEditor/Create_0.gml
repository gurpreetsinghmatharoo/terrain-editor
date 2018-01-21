/// @description constants
//colors
global.colorMap = ds_map_create();

global.colorMap[? "yellow"] = c_yellow;
global.colorMap[? "red"] = c_red;
global.colorMap[? "blue"] = c_blue;

//layer properties enum
enum pr{
    num, //Priority of layer
    color, //Color
    tex //Texture
}

//textures list
global.texList = ds_list_create();

ds_list_add(global.texList, sTexDirt, sTexGrass);

///init
//options
    //controls

//properties
    //draw
    brushSize = 16;
    brushColour = c_yellow;
    
    //controls
    panSpeed = 1;
    panKey = vk_space;
    playKey = ord("P");
    
    //ui
    uiBackC = $AABBBB;
    
//other
application_surface_draw_enable(false);

//states
global.playing = false; //testing level or not
global.editing = false; //editing a textbox or not
curLayer = 0;

global.saveFile = "terrain";

global.surfCleared = false; //whether the surfaces were cleared intentionally

//vars
mouse_xx = mouse_x;
mouse_yy = mouse_y;

//properties
room_width = 1024;
room_height = 960;

draw_set_font(ftUI);

//interface
    globalvar panelW, panelH, layerUIX, layerUIY, layerUIH;
    panelH = 128;
    panelW = 128;
    
    //layer buttons
    layerUIX = 16;
    layerUIY = panelH + 48;
    layerUIH = 48;

//view
globalvar view_scale, viewX, viewY, viewW, viewH, portW, portH, winW, winH;
view_scale = 1;

viewX = 0;
viewY = 0;

viewW = 960;
viewH = 540;

portW = viewW*view_scale;
portH = viewH*view_scale;

//window
winW = panelW + portW;
winH = panelH + portH;

window_set_size(winW, winH);
display_set_gui_maximise();
//display_set_gui_size(winW, winH);

//terrain surface
var _surf = surface_create_clear(room_width, room_height);

//layers
layersDS = ds_list_create();

ds_list_add(layersDS, _surf);

//spritesDS = ds_list_create();

//ds_list_add(spritesDS, _spr);

//Buffer
bufferArr[0] = buffer_create(4 * room_width * room_height, buffer_grow, 1);
buffer_get_surface(bufferArr[0], _surf, 0, 0, 0);

//layer properties
propsDS = ds_list_create();

ds_list_add(propsDS, arrayC(0, c_white, sTexDirt));


///create UI
//add layer button
createUI(96, layerUIY-32, oUIAddLayer);

//layer buttons
for(var i=0; i<ds_list_size(layersDS); i++){
    var lrB = createUI(layerUIX, layerUIY + (layerUIH*i), oUILayer);
    lrB.layerID = i;
}

//test textbox for brush size
//Was just for test, will create a slider for this
//var bsTB = createUI(8, 8, oUITextbox);
//bsTB.tbType = tb.brushSize;
//bsTB.text = string(brushSize);

//savefile textbox
var sfTB = createUI(8, 8, oUITextbox);
sfTB.tbType = tb.saveFile;
sfTB.text = global.saveFile;

//save/load buttons
var svB = createUI(80, 8, oUISave);
var ldB = createUI(120, 8, oUILoad);
var exB = createUI(160, 8, oUIExport);
