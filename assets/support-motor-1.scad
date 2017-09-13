include <components/support.scad>
include <components/motor.scad>

SupportMotor1();

module SupportMotor1(center = false) {

    // Common params for all supports
    include <params/support.scad>

    y_decal = 0;
    if (center) {
        y_decal = -support_width/2;
    }

    translate([0, y_decal, 0])
    difference() {
        components_support_VerticalHorizontalSupport(support_height, support_width, support_motor_support_height, support_thickness, bars_width, horizontal_support_width, fn=60);
        translate([0,45,32])
        components_motor_BYJMotorThrows();
        components_support_VerticalSupportThrows(support_height, support_throw_diameter, bars_width);
        components_support_HorizontalSupportThrows(
            horizontal_support_width,
            support_width,
            horizontal_support_throw_diameter,
            support_thickness,
            support_thickness
        );
    }
}
