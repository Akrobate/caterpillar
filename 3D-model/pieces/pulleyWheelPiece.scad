include <./subpieces/wheel.scad>
include <../params/support-wheel.scad>

module pulleyWheelPiece() {
    components_weel_WireWeelWithThrow(diam1, diam2, diam3, b1_size, b2_size, wheel_size, axis_throw_diam, fn);
}

pulleyWheelPiece();
