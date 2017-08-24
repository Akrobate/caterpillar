include <components/wheel.scad>

SupportWheel();

module SupportWheel() {

    //include <params/motor-reel-wheel.scad>

    epsilon = 0.1;

    diam1 = 15;
    diam2 = 13;
    diam3 = diam1;
    b1_size = 2;
    b2_size = b1_size;
    wheel_size = 4;
    fn = 80;

    axis_throw_diam = 3.4;

    wheel_separator_diam = 6;
    wheel_separator_size = 5;

    difference() {
        union() {
            components_weel_WireWeel(diam1, diam2, diam3, b1_size, b2_size, wheel_size, fn);
            translate([0,0,wheel_size])
            cylinder(d = wheel_separator_diam, h = wheel_separator_size, center=true, $fn = fn);
        }
        cylinder(d = axis_throw_diam, h = wheel_size * 4, center=true, $fn = fn);
    }

}
