//Input
var hor, jump;
hor = (keyboard_check(ord("D")) || keyboard_check(vk_right))-(keyboard_check(ord("A")) || keyboard_check(vk_left));
jump = keyboard_check_pressed(ord("W")) || keyboard_check_pressed(vk_up);

hsp = hor * moveSpeed;

//Gravity
if (vsp < 10) vsp += gravSpeed;

//Jump
if (jump){
    vsp = -jumpSpeed;
}

//Collisions
if (dest_collision(x+hsp, y)){
    //Slope
    var slope = false;
    var dir = point_direction(0, 0, hsp, vsp);
    var dist = point_distance(0, 0, hsp, vsp);
    
    for(var i=0; i<maxSlope; i+=0.1){
        var Hsp, Vsp, Dir;
        Dir = dir - (angle_difference(dir, 90)*i);
        Hsp = lengthdir_x(dist, Dir);
        Vsp = lengthdir_y(dist, Dir);
        
        if (!dest_collision(x+Hsp, y+Vsp)){
            slope = true;
            hsp = Hsp;
            vsp = Vsp;
            break;
        }
    }

    if (!slope) hsp = 0;
}

if (dest_collision(x, y+vsp)){
    vsp = 0;
}

if (dest_collision(x+hsp, y+vsp)){
    hsp = 0;
    vsp = 0;
}

//Apply
x += hsp;
y += vsp;

