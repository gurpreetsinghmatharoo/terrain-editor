// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // oEditor
global.__objectDepths[1] = 0; // oPlayer
global.__objectDepths[2] = 0; // oTerrain
global.__objectDepths[3] = 0; // oTerrainLayer
global.__objectDepths[4] = 0; // oEditorUI
global.__objectDepths[5] = 0; // oUIAddLayer
global.__objectDepths[6] = 0; // oUILayer
global.__objectDepths[7] = -10; // oUISelectLayer
global.__objectDepths[8] = -10; // oUILayerMove
global.__objectDepths[9] = -10; // oUITexSelect
global.__objectDepths[10] = -20; // oUITexWindow
global.__objectDepths[11] = -30; // oUITexButton
global.__objectDepths[12] = 0; // oUITextbox
global.__objectDepths[13] = 0; // oUISave
global.__objectDepths[14] = 0; // oUILoad
global.__objectDepths[15] = 0; // oUITextpop


global.__objectNames[0] = "oEditor";
global.__objectNames[1] = "oPlayer";
global.__objectNames[2] = "oTerrain";
global.__objectNames[3] = "oTerrainLayer";
global.__objectNames[4] = "oEditorUI";
global.__objectNames[5] = "oUIAddLayer";
global.__objectNames[6] = "oUILayer";
global.__objectNames[7] = "oUISelectLayer";
global.__objectNames[8] = "oUILayerMove";
global.__objectNames[9] = "oUITexSelect";
global.__objectNames[10] = "oUITexWindow";
global.__objectNames[11] = "oUITexButton";
global.__objectNames[12] = "oUITextbox";
global.__objectNames[13] = "oUISave";
global.__objectNames[14] = "oUILoad";
global.__objectNames[15] = "oUITextpop";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for