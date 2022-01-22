linear_extrude(height = 20) {
    line([
        [-31, 8],
        [0, -8],
        [31, 0],
        [0, 56],
        [-31, 0],
        [31, 0],
        [0, -45],
        [10, 15],
        [31, 0],
        [5, -10],
    ]);
}

module line(points) {
    x = points[0][0];
    y = points[0][1];
    dx = points[1][0];
    dy = points[1][1];
    union() {
        hull() {
            translate([x, y, 0]) circle(2.5);
            translate([x+dx, y+dy, 0]) circle(2.5);
        }
    }
    if (len(points) > 2) {
        line([for (i = [1:len(points)-1]) if (i == 1) [x+dx, y+dy] else points[i]]);
    }
}