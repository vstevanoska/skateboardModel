$fa = 1;
$fs = 0.4;

module wheel(length = 3, radius = 2, sphericalSelected = false, wheelDecoration = false)
{
    if (sphericalSelected) {
        difference() {
            difference() {
                sphere(radius);
                rotate([90, 0, 0])
                    translate([0, 0, length / 2])
                        cylinder(radius, 0, length, center = true);
                rotate([-90, 0, 0])
                    translate([0, 0, length / 2])
                        cylinder(radius, 0, length, center = true);
            }
            if (wheelDecoration) {
                rotate([90, 0, 0]) {
                    difference() {
                        cylinder(h = 0.3, r = radius + 1, center = true);
                        cylinder(h = 0.4, r = radius - 0.1, center = true);
                    }
                    translate([0, 0, 0.5])
                        difference() {
                            cylinder(h = 0.3, r = radius + 1, center = true);
                            cylinder(h = 0.4, r = radius - 0.1, center = true);
                        }
                    translate([0, 0, -0.5])
                        difference() {
                            cylinder(h = 0.3, r = radius + 1, center = true);
                            cylinder(h = 0.4, r = radius - 0.1, center = true);
                        }
                }
            }
        }
    }
    else {
        rotate([90, 0, 0])
            difference() {
                cylinder(length, r = radius, center = true);
                if (wheelDecoration) {
                    difference() {
                        cylinder(h = 0.3, r = radius + 1, center = true);
                        cylinder(h = 0.4, r = radius - 0.1, center = true);
                    }
                    translate([0, 0, 0.5])
                        difference() {
                            cylinder(h = 0.3, r = radius + 1, center = true);
                            cylinder(h = 0.4, r = radius - 0.1, center = true);
                        }
                    translate([0, 0, 1])
                    difference() {
                        cylinder(h = 0.3, r = radius + 1, center = true);
                        cylinder(h = 0.4, r = radius - 0.1, center = true);
                    }
                    translate([0, 0, -0.5])
                        difference() {
                            cylinder(h = 0.3, r = radius + 1, center = true);
                            cylinder(h = 0.4, r = radius - 0.1, center = true);
                        }
                    translate([0, 0, -1])
                    difference() {
                        cylinder(h = 0.3, r = radius + 1, center = true);
                        cylinder(h = 0.4, r = radius - 0.1, center = true);
                    }
                }       
        }
    }   
}
//wheel(3, 2, true, false);