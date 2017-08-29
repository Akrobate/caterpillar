
SupportBridge();

module SupportBridge() {

    size_x = 20;
    size_z = 10;
    size_y = 5;
    screws_diameter = 2;
    fn = 120;

    central_holder_ratio = 0.5;

    cylinder(h = size_x, d = size_y, $fn = fn);
    translate([size_z,0,0])
    cylinder(h = size_x, d = size_y, $fn = fn);
    cube([size_z, size_y * central_holder_ratio, size_x], center = false);

}
