include <subpieces/wheelSubpiece.scad>


module pulleyPiece() {

    pulley_thickness = 2;
    pulley_width = 10;
    pulley_height = 20;
    pulley_separation_distance = 10;

    puller_throws = 3.4;

    fn = 120;

    difference(){
        union() {
            cube([pulley_width, pulley_separation_distance, pulley_thickness], center=true);

            translate([0, pulley_separation_distance / 2 - pulley_thickness / 2, - pulley_thickness / 2 + pulley_height / 2]) {
                union() {
                    cube([pulley_width, pulley_thickness, pulley_height], center=true);
                    translate([0,0,pulley_height / 2])
                    rotate([90,0,0])
                    cylinder(h = pulley_thickness, d = pulley_width, center = true, $fn = fn);
                }
            }

            translate([0, - pulley_separation_distance / 2 + pulley_thickness / 2, - pulley_thickness / 2 + pulley_height / 2]) {
                union() {
                    cube([pulley_width, pulley_thickness, pulley_height], center=true);
                    translate([0,0,pulley_height / 2])
                    rotate([90,0,0])
                    cylinder(h = pulley_thickness, d = pulley_width, center = true, $fn = fn);
                }
            }
        }
        translate([0,0,pulley_height - pulley_thickness / 2])
        rotate([90,0,0])
        cylinder(h = pulley_separation_distance * 2, d = puller_throws, center = true, $fn = fn);
    }
}

pulleyPiece();
