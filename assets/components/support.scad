module components_support_VerticalSupport(support_height = 140, support_width = 54, support_motor_support_height = 60, support_thickness = 3, bars_width = 13, horizontal_support_width = 30, fn = 20) {

    union() {
        translate([0,0,0])
        cube([support_thickness, bars_width, support_height]);

        translate([0,0,0])
        cube([support_thickness, support_width, support_motor_support_height]);

        translate([0,0,0])
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
