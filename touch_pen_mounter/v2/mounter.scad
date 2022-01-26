$fn = 100;

diameter1 = 51.5;
diameter2 = 47;
diameter3 = 40;
diameter4 = 38;
margin_diameter = 3;

height1 = 8;
height2 = 2;
height3 = 1;
height4 = 2;

cabe_box_width = 16.5;

nut_height = 2.2;
nut_diameter = 7;
nut_cover_thickness = 1;
bolt_diameter = 3.5;

reel_height = 9.5;
reel_diameter = 21.5;
reel_hook_position = 5;
reel_hook_diameter = 9;
reel_hook_over = 4.5;
reel_hole_diameter = 7;

union() {
  height = height1 + height2 + height3 + height4;
  radius = (diameter1 + margin_diameter) * 0.5;

  difference() {
    union() {
      cylinder(h = height, r = radius);

      translate([0, 0, margin_diameter]) linear_extrude(height = height - margin_diameter) {
        hull() {
          // magnet holder
          translate([-radius, 0, 0]) {
            square([radius * 2, radius]);
          }

          // reel
          translate([-radius - reel_diameter * 0.3, radius - (reel_diameter + margin_diameter) * 0.5, 0]) {
            circle(d = reel_diameter + margin_diameter);
            translate([0, reel_hook_over - (reel_hook_diameter + reel_diameter) * 0.5, 0])
              circle(d = reel_hole_diameter + margin_diameter);
          }
        }
      }
    }

    difference() {
      cylinder(h = margin_diameter, d = diameter1 + margin_diameter);
      cylinder(h = margin_diameter, d1 = diameter1, d2 = diameter1 + margin_diameter);
    }
    cylinder(h = height1, d = diameter1);
    translate([0, 0, height1]) cylinder(h = height2, d1 = diameter1, d2 = diameter2);
    translate([0, 0, height1 + height2]) cylinder(h = height3, d1 = diameter3, d2 = diameter4);
    translate([0, 0, height1 + height2 + height3]) {
      cylinder(h = height4, d = diameter4);
      translate([0, -cabe_box_width * 0.5, 0]) cube([diameter1 + margin_diameter, cabe_box_width, height4]);
    }

    // nut
    translate([0, 0, margin_diameter * 0.5 + height * 0.5]) rotate([-90, 0, 0]) {
      x = radius - margin_diameter - nut_diameter * 0.5;
      translate([x, 0, cabe_box_width * 0.5]) {
        rotate([0, 0, 30])
          cylinder(h = radius - nut_cover_thickness - cabe_box_width * 0.5, d = nut_diameter, $fn = 6);
        cylinder(h = radius, d = bolt_diameter);
      }
      translate([-x, 0, cabe_box_width * 0.5]) {
        rotate([0, 0, 30])
          cylinder(h = radius - nut_cover_thickness - cabe_box_width * 0.5, d = nut_diameter, $fn = 6);
        cylinder(h = radius, d = bolt_diameter);
      }
    }

    // reel
    translate([-radius - reel_diameter * 0.3, radius - (reel_diameter + margin_diameter) * 0.5, height - reel_height,]) {
      cylinder(h = reel_height, d = reel_diameter);
      translate([0, reel_hook_over - (reel_hook_diameter + reel_diameter) * 0.5, reel_height - reel_hook_position])
        cylinder(h = reel_hook_position, d = reel_hook_diameter);
      rotate([-90, 0, 0]) translate([0, -reel_height * 0.5, 0]) {
        cylinder(h = reel_diameter, d = reel_hole_diameter);
        translate([0, -reel_hole_diameter * 0.5, reel_diameter * 0.5]) cube([reel_hole_diameter, reel_hole_diameter, reel_diameter], center = true);
      }
    }
  }
}

