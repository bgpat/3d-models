$fn = 100;
w = 4;
d1 = 72;
d2 = 44;
h = 50;
p = 0.58;
f = 2;
s = 1;
l = 20;
r = 9;

union() {
    difference() {
        union() {
            cylinder(h=h, d=d1);
            for (i = [0:5:400]) {
                translate([0, 0, i*0.1]) {
                    cylinder(h=0.1, d=d1-w+(20-pow(i, p)));
                    translate([l, 0, 0]) {
                        cylinder(h=0.1, d=d2-w+(20-pow(i, p)));
                    }
                }
            }
            translate([l, 0, 0]) {
                cylinder(h=h, d=d2);
            }
        }
        cylinder(h=200, d=d1-w, center=true);
        translate([l, 0, r]) {
            cylinder(h=h, d=d2-w);
        }
    }
    intersection() {
        cylinder(h=h, d=d1);
        union() {
            translate([f - d1 * 0.5, 0, h * 0.5]) {
                cube([w * 3, d2, h], true);
            }
            translate([0, s - d1 * 0.5, h * 0.5]) {
                cube([d2, w * 3, h], true);
            }
            translate([0, -s + d1 * 0.5, h * 0.5]) {
                cube([d2, w * 3, h], true);
            }
        }
    }
    translate([0, 0, r * 0.5]) {
        cube([d1 - w, 15, r], true);
    }
}