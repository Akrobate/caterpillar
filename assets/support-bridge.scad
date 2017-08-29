
SupportBridge();

module SupportBridge() {

    size_x = 20;
    size_z = 10;
    size_y = 5;
    screws_diameter = 2;
    screws_scrow_dephs = 5;
    fn = 120;

    epsilon = 0.01;

    central_holder_ratio = 0.5;


    FullWithTrows();

    module FullWithTrows() {
        translate([size_x / 2,0,size_y/2])
        rotate([0,-90,0])
        difference(){
            filled_zone();
            throws();
        }
    }

    module throws() {

        translate([0,0,-epsilon])
        cylinder(h = screws_scrow_dephs + epsilon, d = screws_diameter, $fn = fn);

        translate([size_z,0,-epsilon])
        cylinder(h = screws_scrow_dephs + epsilon, d = screws_diameter, $fn = fn);

        translate([0,0, size_x - screws_scrow_dephs])
        cylinder(h = screws_scrow_dephs + epsilon, d = screws_diameter, $fn = fn);

        translate([size_z,0, size_x - screws_scrow_dephs])
        cylinder(h = screws_scrow_dephs + epsilon, d = screws_diameter, $fn = fn);
    }

    module filled_zone() {
        union() {
            cylinder(h = size_x, d = size_y, $fn = fn);
            translate([size_z,0,0])
            cylinder(h = size_x, d = size_y, $fn = fn);

            translate([0,  - 0.5 * size_y * central_holder_ratio,0])
            cube([size_z, size_y * central_holder_ratio, size_x], center = false);
        }
    }

}
