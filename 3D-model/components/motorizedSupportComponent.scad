use <topWheelsComponent.scad>

use <../pieces/supportMotor1Piece.scad>
use <../pieces/supportMotor2Piece.scad>
use <../pieces/motorReelWheelPiece.scad>
use <../pieces/supportWheelPiece.scad>


// Motorized main support
module motorizedSupportComponent(support_spacing = 40) {
    translate([support_spacing / 2, 0,0])
    supportMotor1Piece();

    translate([-support_spacing / 2, 0,0])
    supportMotor2Piece();

    translate([0, 27,40])
        rotate([0,0,90])
            motorReelWheelPiece();

    translate([0, 6.5, 140])
        topWheelsComponent();
}

motorizedSupportComponent();
