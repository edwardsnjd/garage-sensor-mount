module guidePanel(size, itemWidth, rail) {
    width = size[0];
    depth = size[1];
    height = size[2];

    padding = (width-itemWidth)/2;
    railSize = [rail, depth, rail];
    itemEdges = [padding, padding+itemWidth];

    union() {
        cube(size);
        translate([itemEdges[0]-rail, 0, height]) cube(railSize);
        translate([itemEdges[1]     , 0, height]) cube(railSize);
    }
}

module withCutouts(width, depthOffsets, size) {
    module cutoutPair(y) {
        translate([0,             y, 0]) cube(size);
        translate([width-size[0], y, 0]) cube(size);
    }

    difference() {
        children();
        for (y = depthOffsets) cutoutPair(y);
    }
}

module piPanel() {
    width = 60;
    depth = 80;
    height = 2;

    panelSize = [width, depth, height];

    cutoutSize = [5, 7, height];
    cutoutOffsets = [5, depth-7-5];

    itemWidth = 40;
    rail = 3.5;

    difference() {
        withCutouts(width=width, size=cutoutSize, depthOffsets=cutoutOffsets) {
            guidePanel(size=panelSize, itemWidth=itemWidth, rail=rail);
        }
        translate([10, 15, 0]) cube([40, 50, height+rail]);
    }
}

module connector() {
    width = 56;
    depth = 40;
    height = 2;

    boltSize = [40, 20, height];

    difference() {
        cube([width, depth, height]);
        translate([10, (depth-boltSize[1])/2, 0]) cube(boltSize);
    }
}

module claspPanel() {
    width = 80;
    depth = 50;
    height = 2;

    panelSize = [width, depth, height];

    cutoutSize = [5, 7, height];
    cutoutOffsets = [7, 36];

    itemWidth = 61;
    rail = 3.5;

    difference() {
        translate([depth, 0, 0]) {
            rotate(90) {
                withCutouts(width=width, size=cutoutSize, depthOffsets=cutoutOffsets) {
                    guidePanel(size=panelSize, itemWidth=itemWidth, rail=rail);
                }
            }
        }
        translate([width-70, 15, 0]) cube([30, 50, height+rail]);
    }
}

module clip() {
    union() {
        piPanel();
        translate([60, 0, 0]) {
            translate([0, 20, 0]) connector();
            translate([56, 0, 0]) claspPanel();
        }
    }
}

clip();
