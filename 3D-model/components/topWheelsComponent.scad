use <../pieces/supportWheelPiece.scad>

module topWheelsComponent() {
    rotate([0, 90, 0])
       supportWheelPiece();
    rotate([0, -90, 0])
        supportWheelPiece();
}

topWheelsComponent();
