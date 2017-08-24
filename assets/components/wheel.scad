module components_weel_WireWeel(diam1, diam2, diam3, wheel_transition_border1, wheel_transition_border2, wheel_size, fn = 80) {
    wheel_flat_size = (wheel_size - wheel_transition_border1 - wheel_transition_border2);
    cylinder(h = wheel_transition_border1, r1= diam1 / 2, r2= diam2 / 2, $fn = fn);

    translate([0,0,wheel_transition_border1]) {
        cylinder(h = wheel_flat_size, r = diam2 / 2, $fn = fn);
        translate([0,0,wheel_flat_size]) {
            cylinder(h = wheel_transition_border2, r1= diam2 / 2, r2 = diam3 / 2, $fn = fn);
        }
    }
}
