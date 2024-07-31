use <Clip.scad>

module connector() {
    withSkew(-1.5)
        cube([28, 30, 4]);
}

module sensorMount() {
    cube([30, 30, 2]);
}

module withSkew(d) {
    skew = [
        [1, 0, 0, 0],
        [d, 1, 0, 0],
        [0, 0, 1, 0],
        [0, 0, 0, 1]
    ];
    multmatrix(skew) children();
}

module piSensorMount() {
    union() {
        clip();
        translate([60, 25, 0]) rotate([0, -90, 0]) connector();
        translate([44, -17, 28]) sensorMount();
    }
}

piSensorMount();
