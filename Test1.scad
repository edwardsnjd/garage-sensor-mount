piwidth = 40;

width = 60;
depth = 15;
height = 3;

cutout = 5;

rail = 2.5;

union() {
    difference() {
        cube([width, depth, height]);
        translate([0,cutout,0]) {
            cube([cutout,cutout,height]);
        }
        translate([width-cutout,cutout,0]) {
            cube([cutout,cutout,height]);
        }
    }
    translate([(width-piwidth)/2 -rail, 0, height]) {
        cube([rail, depth, rail]);
    }
    translate([piwidth+(width-piwidth)/2, 0, height]) {
        cube([rail, depth, rail]);
    }
}
