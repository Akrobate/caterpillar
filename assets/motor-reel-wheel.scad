
MotorReelWheel();

module MotorReelWheel() {

    epsilon = 0.1;
    fn = 60;

    wheel_border_diam = 25;
    wheel_central_diam = 25;
    wheel_main_diam = 20;
    wheel_total_size = 24;
    borders_transition_size = 2;
    central_transition_size = 2;

    motor_throw_size = 8;
    axis_throw_size = 15;
    axis_throw_diam = 3.4;

    fixation_throw_diam = 2;

    difference() {
        ReelWheel();

        translate([0, wheel_total_size / 2 - motor_throw_size / 2 + epsilon, 0])
        byj_motor_axis_throw();

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
                halfReel();
                translate([0,0,wheel_total_size])
                mirror([0,0,1])
                halfReel();
            }
        }
    }

    module halfReel() {
        wheel_flat_size = (wheel_total_size / 2 - central_transition_size - borders_transition_size) ;

        cylinder(h = borders_transition_size, r1= wheel_border_diam / 2, r2= wheel_main_diam / 2, $fn = 80);

        translate([0,0,borders_transition_size]) {
            cylinder(h = wheel_flat_size, r = wheel_main_diam / 2, $fn = 80);
            translate([0,0,wheel_flat_size]) {
                cylinder(h = central_transition_size, r1= wheel_main_diam / 2, r2 = wheel_central_diam / 2, $fn = 80);
            }
        }

    }

    module byj_motor_axis_throw(throw_size = 8) {
        // Real dimensions 3.2, 5.2
        rotate([90,0,0])
        cube([3.2, 5.2, throw_size], center=true);
    }
}
