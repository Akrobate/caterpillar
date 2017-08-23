/**
 * Support
 * Model parameters
 */

SupportMotor2();

module SupportMotor2() {

    support_height = 140;
    support_width = 55;
    support_motor_support_height = 60;
    support_thickness = 3;
    bars_width = 13;
    horizontal_support_width = 20;
    support_throw_diameter = 3.4;
    horizontal_support_throw_diameter = 4;

    difference() {
        support(support_height, support_width, support_motor_support_height, support_thickness, bars_width, horizontal_support_width, fn=60);
        translate([0,45,32])
        byj_axis_throw();

        support_throws(support_height, support_throw_diameter);
        support_horizontal_throws(horizontal_support_width, horizontal_support_throw_diameter);
    }

    // has diff with support-motor-1.scad
    module support(support_height = 140, support_width = 54, support_motor_support_height = 60, support_thickness = 3, bars_width = 13, horizontal_support_width = 30, fn = 20) {

        union() {
            translate([0,0,0])
            cube([support_thickness, bars_width, support_height]);

            translate([0,0,0])
            cube([support_thickness, support_width, support_motor_support_height]);

            translate([-horizontal_support_width + support_thickness,0,0])
            cube([horizontal_support_width, support_width, support_thickness]);

            translate([0, 0, support_height])
            rotate([0,90,0])
            linear_extrude(height = support_thickness, center = false, convexity = 10, twist = 0)
            polygon([
                [0, 0],
                [0, bars_width],
                [support_height - support_motor_support_height, support_width],
                [support_height - support_motor_support_height, support_width - bars_width]
            ]);

            translate([0, bars_width / 2, support_height])
            rotate([0,90,0])
            cylinder(h=support_thickness, d=bars_width, center=false, $fn=fn);

        }

    }


    module support_throws(support_height = 140, support_throw_diameter = 3, fn = 60) {
        translate([0, bars_width / 2, support_height])
        rotate([0,90,0])
        cylinder(h=10, d=support_throw_diameter, center=true, $fn=fn);
    }


    // has diff with support-motor-1.scad
    module support_horizontal_throws(horizontal_support_width = 20, horizontal_support_throw_diameter = 4, support_thickness = 3, horizontal_support_thickness = 3, fn = 60) {

        epsilon = 0.01;
        horizontal_support_throw_radius = horizontal_support_throw_diameter / 2;

        cone_throw_heigh = horizontal_support_throw_radius * 1.1;
        cone_throw_r2 = horizontal_support_throw_radius * 1.75;

        union(){
            translate([ - ((horizontal_support_width - support_thickness) / 2) ,  (horizontal_support_width - support_thickness) / 2, 0]) {
                cylinder(h=10, d=horizontal_support_throw_diameter, center=true, $fn=fn);

                // cylinder(h = 2.2, r1 = 2, r2 = 3.5, center = true, $fn=fn); // Example
                translate([0,0, horizontal_support_thickness - cone_throw_heigh + epsilon])
                cylinder(h = cone_throw_heigh, r1 = horizontal_support_throw_radius, r2 = cone_throw_r2, center = false, $fn=fn);
            }

            translate([ -((horizontal_support_width - support_thickness) / 2), support_width - ((horizontal_support_width - support_thickness) / 2), 0]){
                cylinder(h=10, d=horizontal_support_throw_diameter, center=true, $fn=fn);

                translate([0,0, horizontal_support_thickness - cone_throw_heigh + epsilon])
                cylinder(h = cone_throw_heigh, r1 = horizontal_support_throw_radius, r2 = cone_throw_r2, center = false, $fn=fn);
            }
        }
    }


    module byj_motor_throws(fn = 80) {
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


    module byj_axis_throw(d=3.4, fn = 80) {
        translate([0,-17.5,8])
        rotate([0,90,0])
        cylinder(h=20, d=d, center=true, $fn=fn);
    }
}