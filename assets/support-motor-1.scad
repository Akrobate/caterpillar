include <components/support.scad>
include <components/motor.scad>

SupportMotor1();

module SupportMotor1() {

    // Common params for all supports
    include <params/support.scad>

    difference() {
        components_support_VerticalHorizontalSupport(support_height, support_width, support_motor_support_height, support_thickness, bars_width, horizontal_support_width, fn=60);
        translate([0,45,32])
        components_motor_BYJMotorThrows();
        components_support_VerticalSupportThrows(support_height, support_throw_diameter, bars_width);
        components_support_HorizontalSupportThrows(horizontal_support_width, support_width, horizontal_support_throw_diameter);
    }
}
