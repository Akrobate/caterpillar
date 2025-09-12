include <subpieces/wheel.scad>

PulleyWheel();

module PulleyWheel() {

    include <params/support-wheel.scad>

    components_weel_WireWeelWithThrow(diam1, diam2, diam3, b1_size, b2_size, wheel_size, axis_throw_diam, fn);
}
