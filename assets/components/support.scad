module components_support_VerticalHorizontalSupport(support_height = 140, support_width = 54, support_motor_support_height = 60, support_thickness = 3, bars_width = 13, horizontal_support_width = 30, fn = 20) {
    union() {
        components_support_VerticalSupport(support_height, support_width, support_motor_support_height, support_thickness, bars_width, horizontal_support_width, fn);
        components_support_HorizontalSupport(support_width, support_thickness, horizontal_support_width);
    }
}


module components_support_VerticalSupport(support_height = 140, support_width = 54, support_motor_support_height = 60, support_thickness = 3, bars_width = 13, horizontal_support_width = 30, fn = 20) {
    union() {
        translate([0,0,0])
        cube([support_thickness, bars_width, support_height]);

        translate([0,0,0])
        cube([support_thickness, support_width, support_motor_support_height]);

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


module components_support_VerticalSupportThrows(support_height = 140, support_throw_diameter = 3, bars_width = 13, fn = 60) {
    translate([0, bars_width / 2, support_height])
    rotate([0,90,0])
    cylinder(h=10, d=support_throw_diameter, center=true, $fn=fn);
}


module components_support_HorizontalSupport(support_width = 54, support_thickness = 3, horizontal_support_width = 30) {
    translate([0,0,0])
    cube([horizontal_support_width, support_width, support_thickness]);
}



module components_support_HorizontalSupportThrows(horizontal_support_width = 20, support_width = 54, horizontal_support_throw_diameter = 4, support_thickness = 3, horizontal_support_thickness = 3, fn = 60) {

    epsilon = 0.01;
    horizontal_support_throw_radius = horizontal_support_throw_diameter / 2;

    cone_throw_heigh = horizontal_support_throw_radius * 1.1;
    cone_throw_r2 = horizontal_support_throw_radius * 1.75;

    union(){
        translate([support_thickness + (horizontal_support_width - support_thickness) / 2,  (horizontal_support_width - support_thickness) / 2, 0]) {
            cylinder(h=10, d=horizontal_support_throw_diameter, center=true, $fn=fn);

            // cylinder(h = 2.2, r1 = 2, r2 = 3.5, center = true, $fn=fn); // Example
            translate([0,0, horizontal_support_thickness - cone_throw_heigh + epsilon])
            cylinder(h = cone_throw_heigh, r1 = horizontal_support_throw_radius, r2 = cone_throw_r2, center = false, $fn=fn);
        }

        translate([support_thickness + (horizontal_support_width - support_thickness) / 2, support_width - ((horizontal_support_width - support_thickness) / 2), 0]){
            cylinder(h=10, d=horizontal_support_throw_diameter, center=true, $fn=fn);

            translate([0,0, horizontal_support_thickness - cone_throw_heigh + epsilon])
            cylinder(h = cone_throw_heigh, r1 = horizontal_support_throw_radius, r2 = cone_throw_r2, center = false, $fn=fn);
        }
    }
}
