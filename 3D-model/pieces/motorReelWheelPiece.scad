include <subpieces/motorSubpiece.scad>
include <subpieces/wheelSubpiece.scad>
include <../configurations/motor-reel-wheel.scad>


module motorReelWheelPiece(
    fn = 80
) {

    difference() {
        ReelWheel();
        translate([0, wheel_total_size / 2 - motor_throw_size / 2 + epsilon, 0])
        components_motor_CouplingAxisThrow(motor_throw_size);

        translate([0, - (wheel_total_size / 2 - axis_throw_size / 2 + epsilon), 0])
        rotate([90,0,0])
            cylinder(d = axis_throw_diam, h = axis_throw_size, center=true, $fn = fn);

        translate([(axis_throw_diam + fixation_throw_diam) / 2 , central_transition_size + fixation_throw_diam / 2,0])
            cylinder(d = fixation_throw_diam, h = wheel_border_diam, center=true, $fn = fn);

        translate([(axis_throw_diam + fixation_throw_diam) / 2, -(central_transition_size + fixation_throw_diam / 2), 0])
            cylinder(d = fixation_throw_diam, h = wheel_border_diam, center=true, $fn = fn);

        translate([ -(axis_throw_diam + fixation_throw_diam) / 2, central_transition_size + fixation_throw_diam / 2,0])
            cylinder(d = fixation_throw_diam, h = wheel_border_diam, center=true, $fn = fn);

        translate([ -(axis_throw_diam + fixation_throw_diam) / 2, -(central_transition_size + fixation_throw_diam / 2), 0])
            cylinder(d = fixation_throw_diam, h = wheel_border_diam, center=true, $fn = fn);
    }


    module ReelWheel() {
        rotate([90,0,0]) {
            translate([0,0, - wheel_total_size / 2]) {
                components_weel_WireWeel(wheel_border_diam, wheel_main_diam, wheel_central_diam, borders_transition_size, central_transition_size, wheel_total_size / 2, fn);
                translate([0,0,wheel_total_size])
                mirror([0,0,1])
                components_weel_WireWeel(wheel_border_diam, wheel_main_diam, wheel_central_diam, borders_transition_size, central_transition_size, wheel_total_size / 2, fn);
            }
        }
    }
}

motorReelWheelPiece(
    fn = 120
);
