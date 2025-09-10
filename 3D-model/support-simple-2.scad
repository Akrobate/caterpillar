/**
 * Support
 * Model parameters
 */
use <support-simple-1.scad>

SupportSimple2();

module SupportSimple2() {
    mirror([1,0,0])
    SupportSimple1();
}
