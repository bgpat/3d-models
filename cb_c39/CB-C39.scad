$fn = 100;
linear_extrude(height = 2) {
    difference() {
        w = 38;
        h = 13;
        hull() {
            s = 1.25;
            scale([w / h, 1]) circle(r = h / 2);
            translate([(w - w / s) / 2, 0]) scale([w / h / s, 1]) circle(r = h / 2);
            translate([-(w - w / s) / 2, 0]) scale([w / h / s, 1]) circle(r = h / 2);
        }
        union() {
            sw = 13;            
            t = 3;
            b = 2.5;
            nw1 = 4;
            nm1 = 0.5;
            nw2 = 6.5;
            nm2 = 1.5;
            translate([0, b - t]) square([sw, h - t - b], center = true);
            translate([-nw1 / 2, 0]) square([nw1, h / 2 - nm1]);
            translate([-nw2 / 2, 0]) square([nw2, h / 2 - nm2]);
        }
    }
}