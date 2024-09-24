$fn = 100;

linear_extrude(height = 0.6) {
  difference() {
    union() {
      square([10, 120]);
      translate([-34, 0, 0]) square([64, 10]);
    }
    translate([-29, 5, 0]) circle(1.5);
    translate([25, 5, 0]) circle(1.5);
  }
}
translate([5, 60, 0]) cylinder(h = 5, r = 1.9);
translate([5, 60, 2.5]) cylinder(h = 2.5, r = 3.8);
