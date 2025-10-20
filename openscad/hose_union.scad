$fa = 1;
$fs = 0.4;
large_r = 62;
small_r = 47.5;
h = 50;
difference() {

    cylinder(h, r=small_r, center=true);

    wall_thickness = 4;
    small_r_i = small_r - wall_thickness;
    large_r_i = large_r - wall_thickness;
    h2 = h + .003;
    //translate([0, 0, .001])
    cylinder(h2, r=small_r_i, center=true);
};