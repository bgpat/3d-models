include <roundedcube.scad>

width = 88;
height = 18;

step_height = 25.5;
hole_depth = 8;

screw_length = 28.5;
screw_diameter = 5;
screw_head_diameter = 9;
screw_head_height = 2.5;

feet_diameter = 5;
feet_space = 62;

$fn = 100;
t = 4;

module pillar(invert = false) {
  w = screw_head_diameter + t * 2;
  h = step_height + height + t;
  d = h - (screw_length - hole_depth);
  difference() {
    roundedcube([w, w, h], false, t, xmin = !invert, xmax = invert, zmax = false);
    translate([w * 0.5, w * 0.5, 0]) {
      translate([0, 0, d]) {
        cylinder(h = step_height, d = screw_diameter);
        cylinder(h = screw_head_height, d1 = screw_head_diameter, d2 = screw_diameter);
      }
      cylinder(h = d, d = screw_head_diameter);
    }
  }
}

pillar();
translate([width + screw_head_diameter + t * 2, 0, 0]) pillar(true);
translate([screw_head_diameter + t * 2, 0, 0]) {
  translate([-t, 0, 0]) roundedcube([width + t * 2, screw_head_diameter + t * 2, t], false, t, zmax = false, xmin = false, xmax = false);
  translate([0, 0, height + t]) difference() {
    translate([-t, 0, 0]) cube([width + t * 2, screw_head_diameter + t * 2, t]);
    translate([width * 0.5, screw_head_diameter * 0.5 + t, 0]) {
      translate([feet_space * 0.5, 0, 0]) cylinder(h = t, d = feet_diameter);
      translate([-feet_space * 0.5, 0, 0]) cylinder(h = t, d = feet_diameter);
    }
  }
  translate([-t, 0, height + step_height]) cube([width + t * 2, screw_head_diameter + t * 2, t]);
}
