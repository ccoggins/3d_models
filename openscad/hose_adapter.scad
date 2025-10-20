$fa = 1;
$fs = 0.4;
large_r = 62;
small_r = 47.5;
h = 40;
difference() {
    union() {
        translate([0, 0, h/2])
        cylinder(h, r=large_r, center=true);
        translate([0, 0, h + h/2])
        cylinder(h=h, r1=large_r, r2=small_r, center=true);
        translate([0, 0, 2*h + h/2])
        cylinder(h, r=small_r, center=true);
    };

    wall_thickness = 4;
    small_r_i = small_r - wall_thickness;
    large_r_i = large_r - wall_thickness;
    h2 = h + .002;
    union() {
        translate([0, 0, h2/2 - .001])
        cylinder(h2, r=large_r_i, center=true);
        translate([0, 0, h2 + h2/2 - .001])
        cylinder(h=h2 + .002, r1=large_r_i,
            r2=small_r - wall_thickness, center=true);
        translate([0, 0, 2*h2 + h2/2 - .001])
        cylinder(h2, r=small_r_i, center=true);
    };
};