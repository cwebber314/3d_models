// Screwless mount for the relay.
// mounting holes: 2.9mm diameter
// center-center hole distance X=20.3 mm
// center-center hole distance Y=28.15mm

$fn=30; // Number of facets
bh=5; // base height
bx=26; // base x
by=34; // base y
dx=20.3; // post distance x
dy=28.15; // post distance y 

module spacer(x=0, y=0, z=0){
    translate([x,y,z]){
        cylinder(d=5, h=10);
        cylinder(d=2.9, h=12);
    }
    }

sx0 = dx/2;
y0 = (by-dy)/2;
y1 = (by-dy)/2+dy;
spacer(dx/2, y0, bh);
spacer(-dx/2, y0, bh);
spacer(dx/2, y1, bh);
spacer(-dx/2, y1, bh);
   
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
    translate([0, by/4, 0]){
    cylinder(d=2.9, h=bh);
    }
    chamfer(0, by/4, bh-2);
    // second hole
    translate([0, 3*by/4, 0]){
    cylinder(d=2.9, h=bh);
    }
    chamfer(0, 3*by/4, bh-2);
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
