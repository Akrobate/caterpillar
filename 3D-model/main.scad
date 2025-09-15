use <components/motorizedSupportComponent.scad>
use <components/simpleSupportComponent.scad>

// main Configuration
support_spacing = 26;
support_distance = 300;


module main(support_spacing, support_distance) {
    translate([0, -support_distance / 2, 0])
        motorizedSupportComponent(support_spacing);

    translate([0, support_distance / 2, 0])
        simpleSupportComponent(support_spacing);
}

main(support_spacing, support_distance);