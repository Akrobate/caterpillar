use <simpleSupport1Piece.scad>

module simpleSupport2Piece() {
    mirror([1,0,0])
        simpleSupport1Piece();
}

simpleSupport2Piece();
