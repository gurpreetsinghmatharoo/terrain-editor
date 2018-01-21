/// @description  d3(number);
/// @function  d3
/// @param number
//Returns a string with a 3 digit number

var str = string(argument0);
var strLen = string_length(str);

if (strLen==1){
    return "00" + str;
}
else if (strLen==2){
    return "0" + str;
}
else return str;
