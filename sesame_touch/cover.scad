$fn = 100;

module rounded_cube(width, depth, height, r) {
    translate([-width * 0.5 + r, -depth * 0.5 + r, 0]) linear_extrude(height = height) minkowski() {
        square([width - r * 2, depth - r * 2]);
        circle(r = r);
    }
}

r = 11;
difference() {
    union() {
        rounded_cube(33.5, 55.5, 1.25, r - 0.25);
        translate([0, 0, 1.25]) rounded_cube(31, 53, 1.5, r - 1.5);
        translate([0, 0, 2.75]) rounded_cube(33, 55, 1.25, r - 0.5);
        translate([0, 0, -5]) rounded_cube(38, 60, 5, r + 1.5);
    }

    translate([15 * 0.5, -6, 15 * 0.5 + 2]) rotate([0, 90, 90]) {
        cylinder(h = 27, d = 15);
        translate([0, 15, 0]) cylinder(h = 27, d = 15);
    }

    translate([0, -19, 0]) {
        translate([0, 0, 2.5]) cylinder(h = 1.5, d = 6.5);
        translate([0, 0, -5]) cylinder(h = 9, d = 2.5);
        translate([0, 0, -5]) cylinder(h = 3, d = 5);
    }
    translate([0, 23.5, 0]) {
        translate([0, 0, 2.5]) cylinder(h = 1.5, d = 6.5);
        translate([0, 0, -5]) cylinder(h = 9, d = 2.5);
        translate([0, 0, -5]) cylinder(h = 3, d = 5);
    }
    
    translate([0, -13, 0]) {
        translate([8.5, 0, 0]) {
            translate([0, 0, 1.8]) cylinder(h = 2.2, r = 3.25, $fn = 6);
            translate([0, 0, -5]) {
                cylinder(h = 5, d = 17);
                cylinder(h = 9, d = 3.5);
            }
        }
        translate([-8.5, 0, 0]) {
            translate([0, 0, 1.8]) cylinder(h = 2.2, r = 3.25, $fn = 6);
            translate([0, 0, -5]) {
                cylinder(h = 5, d = 17);
                cylinder(h = 9, d = 3.5);
            }
        }
    }
}
