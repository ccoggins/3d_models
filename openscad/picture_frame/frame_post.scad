$fa = 1;
$fs = 0.4;

pic_width=104.1;
pic_depth=3.3;

post_h = pic_width - 4;
cut_d = 8;
//post_w = pic_depth + 5 + cut_d - 1;
post_w = pic_depth + 9;

difference() {
    cube([post_w, post_w, post_h], center=true);

    // cutout for pictures
    
    cut_w = pic_depth + .8;
    cutout_xy = post_w / 2 - cut_w / 2 - 2;
    translate([post_w / 2, -cutout_xy, 0])
    cube([cut_d, cut_w, post_h + .001], center=true);
    translate([-cutout_xy, post_w / 2, 0])
    cube([cut_w, cut_d, post_h + .001], center=true);

    // screw holes
    translate([-(post_w / 2 - 4), -(post_w / 2 - 4), post_h / 2])
    cylinder(h = 20, r = 1.3, center = true);
    translate([-(post_w / 2 - 4), -(post_w / 2 - 4), -post_h / 2])
    cylinder(h = 20, r = 1.3, center = true);
}