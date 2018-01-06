// Quarter size perfboard mount.
// 2.5mm holes for machine screws.
// Should drill/tap after print
// Adafruit Perma-Proto Quarter-sized Breadboard PCB 

$fn=30; // Number of facets

mouting_hole = 2.9; // mounting hole diameter
bh=5; // base height
d=35.8;

//Spacer with hole
module spacer(x=0, y=0, z=0){
    difference(){
        translate([x,y,z]){
            cylinder(d=8, h=10);
        }
        translate([x,y,z]){
            cylinder(d=mouting_hole, h=12);
        }
    }
}

spacer(0, 5, bh);
spacer(0, 5+d, bh);

bx = 15;
by = 45;
    
// Draw base
module base() {
    translate([-bx/2,0,0]){
    cube([bx, by, bh]);
    }
}

// Mounting holes
// #6 screw = 3.3mm diameter
difference(){
    base();
    // first hole
    translate([0, by/3, 0]){
    cylinder(d=3.3, h=bh);
    }
    chamfer(0, by/3, bh-2);
    // second hole
    translate([0, 2*by/3, 0]){
    cylinder(d=3.3, h=bh);
    }
    chamfer(0, 2*by/3, bh-2);
}

module chamfer(x,y,z,cd=3.3, cw=2){
    // x, y, z = center coordinates of chamfer
    // cd: chamfer smallest diameter
    // cw: width of chamfer.  
    color("red")
    translate([x, y, z]){
    cylinder(d1=cd, d2=cd+2*cw, h=cw);
    }
}
