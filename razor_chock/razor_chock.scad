// Chock Body
back_offset_y=70;
module body () {
    union(){
        //bottom
        cube([40, 110, 34]);
        //back
        translate ([0, back_offset_y, 0]){
            cube([40, 40, 100]);
        }
    }
}

wheeld = 95;

// cutout wheel 
difference(){
    body();
    translate([7, wheeld/2, wheeld/2+10]){
        rotate(a=90, v=[0,1,0]){
            cylinder(h=26, d1=wheeld, d2=wheeld);
        }
    }
}

wing_x=15;
wing_y=20;
wing_z=5;
// Add wings (right)
translate([40, 0]){
    cube([wing_x, wing_y, wing_z]);
}
translate([40, back_offset_y+wing_y, 0]){
    cube([wing_x, wing_y, wing_z]);
}

// Add wings (left)
translate([-wing_x, 0]){
    cube([wing_x, wing_y, wing_z]);
}
translate([-wing_x, back_offset_y+wing_y]){
    cube([wing_x, wing_y, wing_z]);
}