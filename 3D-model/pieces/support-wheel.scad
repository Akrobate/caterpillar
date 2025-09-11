include <components/wheel.scad>

SupportWheel();

module SupportWheel() {

    include <params/support-wheel.scad>

    difference() {
        union() {
            components_weel_WireWeelWithThrow(diam1, diam2, diam3, b1_size, b2_size, wheel_size, axis_throw_diam, fn);
            translate([0,0,wheel_size])
            cylinder(d = wheel_separator_diam, h = wheel_separator_size, center=false, $fn = fn);
        }
        translate([0,0,-epsilon])
        cylinder(d = axis_throw_diam, h = wheel_size + wheel_separator_size + epsilon * 2, center=false, $fn = fn);
    }
}
