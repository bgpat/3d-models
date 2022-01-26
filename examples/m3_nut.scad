difference() {
  translate([-4, -4, 0]) cube([8, 8, 2.5]);
  cylinder(h = 2.2, r = 3.25, $fn = 6);
  cylinder(h = 2.5, d = 3.5, $fn = 100);
}
