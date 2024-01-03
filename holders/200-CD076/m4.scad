width = 10;

screw_length = 16;
screw_diameter = 5;
screw_head_diameter = 9;
screw_head_height = 2.5;

hole_depth = 8;

$fn = 100;
t = 3;

w = screw_head_diameter + t * 2;
h = screw_length - hole_depth;

difference() {
  cube([w, w, h]);
  translate([w * 0.5, w * 0.5, 0]) {
    cylinder(h = h, d = screw_diameter);
    cylinder(h = screw_head_height, d1 = screw_head_diameter, d2 = screw_diameter);
  }
}

translate([w + width, 0, 0]) difference() {
  cube([w, w, h]);
  translate([w * 0.5, w * 0.5, 0]) {
    cylinder(h = h, d = screw_diameter);
    cylinder(h = screw_head_height, d1 = screw_head_diameter, d2 = screw_diameter);
  }
}

translate([w, 0, 0]) cube([width, w, t]);
