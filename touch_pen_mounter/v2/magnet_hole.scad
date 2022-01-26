$fn = 100;

magnet_height = 2.2;
magnet_cover_thickness = 0.3;
magnet_diameter = 5.3;
number_of_magnet = 6;

bolt_diameter = 3.5;
bolt_head_height = 2;
bolt_head_diameter = 6;

nut_diameter = 7;

diameter1 = 51.5;
margin_diameter = 3;
radius = (diameter1 + margin_diameter) * 0.5;

height1 = 8;
height2 = 2;
height3 = 1;
height4 = 2;
height = height1 + height2 + height3 + height4;

difference() {
  translate([-radius, (height - margin_diameter) * -0.5, 0])
    cube([radius * 2, height - margin_diameter, magnet_height + magnet_cover_thickness]);

  for (i = [1:number_of_magnet]) {
    translate([magnet_diameter * (i - (number_of_magnet + 1) * 0.5), 0, 0])
      cylinder(h = magnet_height, d = magnet_diameter);
  }

  // bolt
  translate([radius - margin_diameter - nut_diameter * 0.5, 0, 0]) {
    cylinder(h = magnet_height + magnet_cover_thickness, d = bolt_diameter);
    translate([0, 0, magnet_height + magnet_cover_thickness - bolt_head_height])
      cylinder(h = bolt_head_height, d1 = bolt_diameter, d2 = bolt_head_diameter);
  }
  translate([-radius + margin_diameter + nut_diameter * 0.5, 0, 0]) {
    cylinder(h = magnet_height + magnet_cover_thickness, d = bolt_diameter);
    translate([0, 0, magnet_height + magnet_cover_thickness - bolt_head_height])
      cylinder(h = bolt_head_height, d1 = bolt_diameter, d2 = bolt_head_diameter);
  }
}

