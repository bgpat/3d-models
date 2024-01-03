module roundedcube(size, center = false, r = 0.5,
                   xmin = true, xmax = true,
                   ymin = true, ymax = true,
                   zmin = true, zmax = true) {
  // If single value, convert to [x, y, z] vector
  size = (size[0] == undef) ? [size, size, size] : size;

  x = size[0];
  y = size[1];
  z = size[2];

  rx = x + (xmin ? -r : 0) + (xmax ? -r : 0);
  ry = y + (ymin ? -r : 0) + (ymax ? -r : 0);
  rz = z + (zmin ? -r : 0) + (zmax ? -r : 0);

  translate([center ? -x * 0.5 : 0, center ? -y * 0.5 : 0, center ? -z * 0.5 : 0]) intersection(){
    cube(size);
    translate([xmin ? r : 0, ymin ? r : 0, zmin ? r : 0]) {
      hull() {
        translate([0, 0, 0]) sphere(r);
        translate([rx, 0, 0]) sphere(r);
        translate([rx, ry, 0]) sphere(r);
        translate([rx, ry, rz]) sphere(r);
        translate([rx, 0, rz]) sphere(r);
        translate([0, ry, 0]) sphere(r);
        translate([0, ry, rz]) sphere(r);
        translate([0, 0, rz]) sphere(r);
      }
    }
  }
}
