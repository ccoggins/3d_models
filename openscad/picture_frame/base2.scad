$fa = 1;
$fs = 0.4;

pic_width=104.1;
pic_depth=3.3;
frame_height=8;
frame_width=pic_width + 2*pic_depth + 10;
lamp_h = 15;
lamp_rod=false;

difference() {
    union() {
        cube([frame_width, frame_width, frame_height], center=true);
        translate([0, 0, -lamp_h - (frame_height / 2)])
        cylinder(h = lamp_h, r = 19.9);
    }
    
    // side hole
    edge_depth = (frame_width - pic_width) / 2;
    rotate([0, 90, 0])
    cylinder(h=frame_width + .001, r=(frame_height - 2)/2, center = false);

    if(lamp_rod) {
        // cut out hole
        translate([0, 0, -lamp_h - (frame_height / 2) - .001])
        cylinder(h=lamp_h + .002, r=18);

        translate([0, 0, -2])
        cylinder(h=6 + .002, r=18);
        
        translate([0, 0, -3])
        cylinder(h=2.001, r=5, center=true);
    } else {
        // cut out hole
        translate([0, 0, -lamp_h - (frame_height / 2) - .001])
        cylinder(h=lamp_h + frame_height + .002, r=18);

        translate([0, -1.25, -2])
        cube([frame_width + .001, 2.5, frame_height - 2 + .001]);
    }
};

if(lamp_rod) {
    difference() {
        translate([0, 0, -lamp_h - (frame_height / 2) - .001])
        cylinder(h=lamp_h + .002, r=6);
        translate([0, 0, -lamp_h - (frame_height / 2) - .002])
        cylinder(h=lamp_h + .004, r=5);
    }
} else {
    rotate_extrude(convexity = 10, $fn = 100)
    translate([18, -5, 0])
    circle(r = 1.2, $fn = 100);
    
    rotate_extrude(convexity = 10, $fn = 100)
    translate([18, -12, 0])
    circle(r = 1.2, $fn = 100);
}