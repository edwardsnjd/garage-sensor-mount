railwidth = 60;

width = 80;
depth = 10;
height = 3;

rail = 2.5;

union() {
    cube([width, depth, height]);
    translate([(width-railwidth)/2 -rail, 0, height]) {
        cube([rail, depth, rail]);
    }
    translate([railwidth+(width-railwidth)/2, 0, height]) {
        cube([rail, depth, rail]);
    }
}
