$fn = 100;
h = 14;

module part() {
  intersection() {
    difference() {
      union() {
        translate([0, 0, 0]) cube(size = [50, 40, 1], center = true);
        translate([0, 0, h / 2]) linear_extrude(height = h, center = true) {
          difference() {
            square(size = [50, 40], center = true);
            scale([1, 1.25]) circle(r=36/2);
          }
        }
        rotate([90, 0 ,0]) translate([0, 7, 20]) difference() {
          union() {
            translate([0, -0.25, 3.5]) cube(size = [40, h + 0.5, 7], center = true);
            translate([0, -0.25, 20]) cube(size = [30, h + 0.5, 40], center = true);
          }
          cylinder(h = 60, r = 6);
          translate([0, -1.5, 0]) cube(size = [16.5, 10, 5], center = true);
        }
      }
      translate([0, 22, h / 2]) cube(size = [40, 10, h + 2], center = true);
    }

    translate([0, 0, h / 2 - 1]) linear_extrude(height = h + 1, center = true) {
      hull() {
        translate([0, 3, 0]) circle(r = 22);
        translate([0, -15, 0]) circle(r = 10);
        translate([0, -46, 0]) circle(r = 7);
      }
    }
  }
}

part();