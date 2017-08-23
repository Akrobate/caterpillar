use <support-motor-1.scad>
use <support-motor-2.scad>

use <support-simple-2.scad>
use <support-simple-1.scad>
use <motor-reel-wheel.scad>


translate([20,-150,0])
SupportMotor1();

translate([-20,-150,0])
SupportMotor2();

translate([20,100,0])
rotate([0,0,180])
SupportSimple1();

translate([-20,100,0])
rotate([0,0,180])
SupportSimple2();

translate([0,-123,40])
rotate([0,0,90])
MotorReelWheel();
