$fn = 100;

fan_distance = 32;
fan_width = 40;

base_width = 47;
base_height = 3;

spacer_diameter = 7.5;
spacer_height = 10;

depth = 10.5;
h = 10;

difference() {
    union() {
        translate([0, -depth * 0.5, -base_height]) cube([base_width, depth, base_height]);
        translate([-1.5, -depth * 0.5, 0]) cube([fan_width + 1.5, depth, spacer_height + 1]);
        translate([-1.5, -depth * 0.5 - 2, spacer_height + 1]) cube([fan_width + 1.5, depth + 2, 3]);
    }
    
    translate([4, 0, 6]) rotate([90, 0, 0]) cylinder(h = depth, d = spacer_diameter, center = true);
    translate([fan_width - 5, 0, 6]) rotate([90, 0, 0]) cylinder(h = depth, d = spacer_diameter, center = true);

    translate([0, depth * 0.5, 0]) rotate([0, 0, 45]) translate([0, 0, -1.5]) cube([2, 2, 3], center = true);
    translate([base_width, depth * 0.5, 0]) rotate([0, 0, 45]) translate([0, 0, -1.5]) cube([2, 2, 3], center = true);
}

translate([-12 * 0.5 - 1.5, depth * 0.5 - 24, 11]) difference() {
    union() {
        translate([-6, 0, 0]) cube([16, 24, 3]);
        translate([-6, 0, -7])cube([12, 24, 7]);
    }
    translate([0, 24 * 0.5, 0]) {
        translate([0, 9, 0]) {
            translate([0, 0, -7]) cylinder(h = 7 + 2, d = 3);
            translate([0, 0, 1]) cylinder(h = 2, d = 6.5, $fn = 6);
        }
        translate([0, -9, 0]) {
            translate([0, 0, -7]) cylinder(h = 7 + 2, d = 3);
            translate([0, 0, 1]) cylinder(h = 2, d = 6.5, $fn = 6);
        }
    }
}
