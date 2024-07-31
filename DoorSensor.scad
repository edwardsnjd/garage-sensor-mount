module doorSensorMount() {
    socketHeight = 35;
    lidHeight = 2;

    points_orig = [
        [0,        0],
        [0+37,     0+6],
        [0+37+3,   0+6+2],
        [0+37+3+3, 0+6+2+3],
        [0+37+3+3, 0+6+2+3+10],
        [0+37+3,   0+6+2+3+10+3],
        [0+37,     0+6+2+3+10+3+2],
        [0,        0+6+2+3+10+3+2+6],
    ];
    points_wide = [
        [0,        0],
        [0+41,     0+7],
        [0+41,     0+7+18],
        [0,        0+7+18+7],
    ];
    points_narrow = [
        [0,        0],
        [0+41,     0+7],
        [0+41,     0+7+14],
        [0,        0+7+14+7],
    ];
    points_bit_wide = [
        [0,        0],
        [0+41,     0+6],
        [0+41,     0+6+18],
        [0,        0+6+18+6],
    ];
    points = [
        [0,        0],
        [0+41,     0+7],
        [0+41,     0+7+16],
        [0,        0+7+16+7],
    ];

    module asSheath(height) {
        difference() {
            linear_extrude(height+lidHeight)
                offset(delta=2) children();
            linear_extrude(height)
                children();
        }
    }

    translate([0, 0+6+2+3+10+3+2+6, lidHeight+socketHeight])
    rotate([0, 180, 180])
    difference() {
        union() {
            asSheath(socketHeight)
                offset(r=1)
                asOutline([-1,0,0])
                polygon(points);
            translate([0, 0, socketHeight])
                linear_extrude(lidHeight)
                polygon(points);
        }
        translate([-5,-5,-5])
            cube([5,70,50]);
    }
}

module asOutline(dx) {
    difference() {
        children();
        translate(dx) children();
    }
}

doorSensorMount();
