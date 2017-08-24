use <pulley-wheel.scad>
use <pulley.scad>

Pulley();

translate([0, 1.5, 19])
rotate([90,0,0])
PulleyWheel();
