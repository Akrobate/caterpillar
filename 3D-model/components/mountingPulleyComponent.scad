use <../pieces/pulleyWheelPiece.scad>
use <../pieces/pulleyPiece.scad>


module mountingPulleyComponent() {
    rotate([0,0,90]) {
        pulleyPiece();
        translate([0, 1.5, 19])
            rotate([90,0,0])
                pulleyWheelPiece();
    }
}

mountingPulleyComponent();