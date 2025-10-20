$fa = 1;
$fs = 0.4;

pic_width=104.1;
pic_depth=3.3;
frame_height=8;
frame_width=pic_width + 2*pic_depth + 10;
lamp_h = 15;

difference() {
    union() {
        cube([frame_width, frame_width, frame_height], center=true);
        translate([0, 0, -lamp_h - (frame_height / 2)])
        cylinder(h = lamp_h, r = 19.9);
    }
    // bottom cutout
    translate([0, 0, frame_height/2 - (frame_height - 2)/2])
    cube([pic_width, pic_width, frame_height - 2 + .001], center=true);
    
    // ???
    //translate([frame_width / 2, 0, 2])
    //cube([(frame_width - pic_width) / 2, 6, frame_height - 2 + .001]);
    
    // side hole
    edge_depth = (frame_width - pic_width) / 2;
    translate([frame_width / 2 - edge_depth - .001, 0, -2])
    cube([edge_depth + .002, 6, frame_height - 2 + .001]);
    
    // cut out hole
    translate([0, 0, -lamp_h - (frame_height / 2) - .001])
    cylinder(h=lamp_h + .002, r=18);
    translate([0, 0, -3])
    cylinder(h=2.00, r=5, center=true);
};
//translate([0, 0, -5])
//cylinder(h=12.00, r=5, center=true);
difference() {
    translate([0, 0, -lamp_h - (frame_height / 2) - .001])
    cylinder(h=lamp_h + .002, r=6);
    translate([0, 0, -lamp_h - (frame_height / 2) - .002])
    cylinder(h=lamp_h + .004, r=5);
}