module components_motor_BYJMotorThrows(fn = 80) {
    union() {
        translate([0,-17.5,8])
        rotate([0,90,0])
        cylinder(h=20, d=14, center=true, $fn=fn);

        translate([0,0,0])
        rotate([0,90,0])
        cylinder(h=20, d=3.4, center=true, $fn=fn);

        translate([0,-35,0])
        rotate([0,90,0])
        cylinder(h=20, d=3.4, center=true, $fn=fn);
    }
}


module components_motor_JYJAxisThrow(d=3, fn = 80) {
    translate([0,-17.5,8])
    rotate([0,90,0])
    cylinder(h=20, d=3.6, center=true, $fn=fn);
}


module components_motor_CouplingAxisThrow(throw_size = 8) {
    // Real dimensions 3.2, 5.2
    rotate([90,0,0])
    cube([3.2, 5.2, throw_size], center=true);
}
