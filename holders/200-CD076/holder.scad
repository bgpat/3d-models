include <roundedcube.scad>

$fn = 100;

handle_diameter = 36;
t = 3;
length = 10;
y_ratio = 0.85;

screw_head_diameter = 9;

outer = [
  handle_diameter + t * 2,
  handle_diameter * y_ratio + t,
  length,
];

difference() {
  translate([0, handle_diameter * 0.5 * (1 - y_ratio) + t * 0.5 , 0]) roundedcube(outer, true, t, ymax = false);
  cylinder(h = length, d = handle_diameter, center = true);
  translate([handle_diameter * 0.5, (handle_diameter - t)* 0.5, 0]) cube([screw_head_diameter * 0.5 + t * 2, t, length], center = true);
  translate([-handle_diameter * 0.5, (handle_diameter - t)* 0.5, 0]) cube([screw_head_diameter * 0.5 + t * 2, t, length], center = true);
}
