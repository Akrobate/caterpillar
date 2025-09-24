use <subpieces/supportSubpiece.scad>
use <subpieces/motorSubpiece.scad>
include <../configurations/support-simple.scad>

module supportMotor2Piece() {
    // Common params for all supports
    mirror([1,0,0])
    difference() {
        components_support_VerticalHorizontalSupport(support_height, support_width, support_motor_support_height, support_thickness, bars_width, horizontal_support_width, fn=60);
        translate([0,45,32])
        components_motor_JYJAxisThrow();
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

supportMotor2Piece();