use <components/motorizedSupportComponent.scad>
use <components/simpleSupportComponent.scad>

use <motor-reel-wheel.scad>

use <mounting-pulley.scad>
use <support-wheel.scad>

// main Configuration
support_spacing = 26;
support_distance = 300;
main(support_spacing, support_distance);

module main(support_spacing, support_distance) {
    translate([0,-support_distance / 2, 0])
        motorizedSupportComponent(support_spacing);

    translate([0, support_distance / 2, 0])
        simpleSupportComponent(support_spacing);
}

// Motorized main support
module SupportA(support_spacing = 40) {
    translate([support_spacing / 2, 0,0])
    SupportMotor1();

    translate([-support_spacing / 2, 0,0])
    SupportMotor2();

    translate([0, 27,40])
    rotate([0,0,90])
    MotorReelWheelPiece();

    translate([0, 6.5, 140])
    TopWheels();
}

// Pulley main support
module SupportB(support_spacing = 40) {
    translate([support_spacing / 2,0,0])
    rotate([0,0,180])
    SupportSimple1();

    translate([-support_spacing / 2,0,0])
    rotate([0,0,180])
    SupportSimple2();

    translate([0, -6.5, 140])
    TopWheels();

    translate([0, -6.5, 0])
    mountingPulley();
}

module TopWheels() {
    rotate([0, 90, 0])
    SupportWheel();
    rotate([0, -90, 0])
    SupportWheel();
}