use <topWheelsComponent.scad>
use <mountingPulleyComponent.scad>

use <../pieces/simpleSupport1Piece.scad>
use <../pieces/simpleSupport2Piece.scad>
use <../pieces/motorReelWheelPiece.scad>
use <../pieces/supportWheelPiece.scad>


module simpleSupportComponent(support_spacing = 40) {
    translate([support_spacing / 2,0,0])
        rotate([0,0,180])
            simpleSupport1Piece();

    translate([-support_spacing / 2,0,0])
        rotate([0,0,180])
            simpleSupport2Piece();

    translate([0, -6.5, 140])
        topWheelsComponent();

    translate([0, -6.5, 0])
        mountingPulleyComponent();
}

simpleSupportComponent();