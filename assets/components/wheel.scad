module components_weel_WireWeelWithThrow(diam1, diam2, diam3, wheel_transition_border1, wheel_transition_border2, wheel_size, axis_throw_diam  = 0, fn = 80) {
    epsilon = 0.1;
    difference() {
        components_weel_WireWeel(diam1, diam2, diam3, wheel_transition_border1, wheel_transition_border2, wheel_size, fn);
        translate([0,0,-epsilon])
        cylinder(d = axis_throw_diam, h = wheel_size + epsilon * 2, center=false, $fn = fn);
    }
}


module components_weel_WireWeel(diam1, diam2, diam3, wheel_transition_border1, wheel_transition_border2, wheel_size, fn = 80) {
    epsilon = 0.1;
    difference() {
        union() {
            wheel_flat_size = (wheel_size - wheel_transition_border1 - wheel_transition_border2);
            cylinder(h = wheel_transition_border1, r1= diam1 / 2, r2= diam2 / 2, $fn = fn);

            translate([0,0,wheel_transition_border1]) {
                cylinder(h = wheel_flat_size, r = diam2 / 2, $fn = fn);
                translate([0,0,wheel_flat_size]) {
                    cylinder(h = wheel_transition_border2, r1= diam2 / 2, r2 = diam3 / 2, $fn = fn);
                }
            }
        }
        translate([0,0,-epsilon])
        cylinder(d = axis_throw_diam, h = wheel_size + epsilon * 2, center=false, $fn = fn);
    }
}
