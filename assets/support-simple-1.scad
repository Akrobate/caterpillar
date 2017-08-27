include <components/support.scad>

SupportSimple1();

module SupportSimple1() {
    // Common params for all supports
    include <params/support-simple.scad>

    mirror([1,0,0])
    difference() {
        components_support_VerticalHorizontalSupport(support_height, support_width, support_motor_support_height, support_thickness, bars_width, horizontal_support_width, fn=60);
        components_support_VerticalSupportEconomicPlastic(support_height, support_width, support_motor_support_height, support_thickness, bars_width, horizontal_support_width, fn=60);
        components_support_VerticalSupportThrows(support_height, support_throw_diameter, bars_width);
        components_support_HorizontalSupportThrows(
            horizontal_support_width,
            support_width,
            horizontal_support_throw_diameter,
            support_thickness,
            support_thickness
        );
    }
}
