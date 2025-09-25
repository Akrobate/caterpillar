
module caterpillarElementPiece(
    fn = 120
) {
    throw_diam = 2;

    cut_height = 2.5;
    diameter_element = 10;

    //r_spehere = 5.66;
    r_spehere = (((diameter_element / 2) * (diameter_element/2)) +(cut_height * cut_height)) / (2 * cut_height);

    difference() {
        translate([0,0, -(r_spehere - cut_height)])
        sphere(r = r_spehere, $fn = fn);

        cylinder(d = throw_diam, h = r_spehere * 2, $fn = fn, center = true);

        translate([0,0, -r_spehere])
        cube([r_spehere * 2, r_spehere *2, r_spehere *2], center=true);
    }
}

caterpillarElementPiece();
