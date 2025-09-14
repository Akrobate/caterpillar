use <pulley-wheel.scad>
use <pulley.scad>

mountingPulley();

module mountingPulley() {
    rotate([0,0,90]) {
        Pulley();
        translate([0, 1.5, 19])
        rotate([90,0,0])
        PulleyWheel();
    }
}
