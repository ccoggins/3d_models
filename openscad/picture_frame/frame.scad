$fa = 1;
$fs = 0.4;

pic_width=104.1;
pic_cutout=pic_width + 2;
pic_depth=3.3;
frame_height=5;
frame_width=pic_width + 2*pic_depth + 10;
center_cutout=false;
diamond_cutout=true;

difference() {
    cube([frame_width, frame_width, frame_height], center=true);
    // cutout for pictures
    cutout_dist = frame_width / 2 - pic_depth - .5;
    //cutout_dist = frame_width / 2 - (pic_depth / 2) - 2.5;
    translate([0, cutout_dist, frame_height / 2 - .999])
    cube([pic_cutout, pic_depth, 2], center=true);
    
    translate([0, -(cutout_dist), frame_height / 2 - .999])
    cube([pic_cutout, pic_depth, 2], center=true);
    
    translate([-(cutout_dist), 0, frame_height / 2 - .999])
    cube([pic_depth, pic_cutout, 2], center=true);
    
    translate([cutout_dist, 0, frame_height / 2 - .999])
    cube([pic_depth, pic_cutout, 2], center=true);
    
    // screw holes
    screw_dist = frame_width / 2 - 4;
    screw_radius = 1.6;
    screw_head_radius = 3.2;
    translate([screw_dist, screw_dist, 0])
    union() {
        translate([0, 0, -frame_height/4])
        cylinder(h=frame_height/2+.001, r1=screw_head_radius,
            r2=screw_radius, center=true);
        translate([0, 0, frame_height/4])
        cylinder(h=frame_height/2+.001, r=screw_radius, center=true);
    };

    translate([-screw_dist, screw_dist, 0])
    union() {
        translate([0, 0, -frame_height/4])
        cylinder(h=frame_height/2+.001, r1=screw_head_radius,
            r2=screw_radius, center=true);
        translate([0, 0, frame_height/4])
        cylinder(h=frame_height/2+.001, r=screw_radius, center=true);
    };

    translate([screw_dist, -screw_dist, 0])
    union() {
        translate([0, 0, -frame_height/4])
        cylinder(h=frame_height/2+.001, r1=screw_head_radius,
            r2=screw_radius, center=true);
        translate([0, 0, frame_height/4])
        cylinder(h=frame_height/2+.001, r=screw_radius, center=true);
    };

    translate([-screw_dist, -screw_dist, 0])
    union() {
        translate([0, 0, -frame_height/4])
        cylinder(h=frame_height/2+.001, r1=screw_head_radius,
            r2=screw_radius, center=true);
        translate([0, 0, frame_height/4])
        cylinder(h=frame_height/2+.001, r=screw_radius, center=true);
    };
    
    // center cutout
    if (center_cutout) {
        cylinder(h=frame_height + .001, r=20, center=true);
    }
    
    if (diamond_cutout) {
        cutout_w = pic_width - 8.1;
        for(x_offset = [-cutout_w / 2 : 6 : cutout_w / 2 ]) {
            for(y_offset = [-cutout_w / 2 : 6 : cutout_w / 2 ]) {
                translate([x_offset, y_offset, 0])
                rotate([0, 0, 45])
                cube([3, 3, frame_height + .001], center=true);
            }
        }
    }
    
    // bottom cutout
    translate([0, 0, frame_height/2 - (frame_height - 2)/2])
    cube([pic_width, pic_width, frame_height - 2 + .001], center=true);
};
        //cylinder(h=frame_height/2+.001, r1=3, r2=2, center=true);
//translate([0, 0, frame_height/4])
//cylinder(h=frame_height/2, r=2, center=true);