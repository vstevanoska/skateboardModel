$fa = 1;
$fs = 0.4;

module tail(type = "standard", width = 18, tailColor = "white", gridTapeSize = "none", gridTapeColor = "black", gridTapeScale = 2.75)
{   
    rotate([0, 180, 0]) {
        if (type == "standard"){
            color(tailColor) {
                difference() { 
                    cylinder(r = width / 2, h = 1, center = true);
                    translate([width / 2,0,0]) 
                        cube(width, center=true);
                }
            }
            color(gridTapeColor) {
                translate([0, 0, -0.1]) {
                    if (gridTapeSize == "small") {
                        difference() { 
                            cylinder(r = width / gridTapeScale, h = 1, center = true);
                            translate([width / 2,0,0]) 
                                cube(width, center=true);
                        }
                    }
                    else if (gridTapeSize == "fit") {
                    difference() { 
                        cylinder(r = (width / 2) - 0.001, h = 1, center = true);
                        translate([width / 2,0,0]) 
                            cube(width, center=true);
                    }
                }
                }
            }
        }
        else if (type == "carver"){
            scale([1.5,1.12,1]) {
            color(tailColor) {
                translate([0, 1, 0]) {
                    intersection() {
                        difference() { 
                            cylinder(r = width / 2, h = 1, center = true);
                            translate([width / 2, 0, 0]) 
                                cube(width, center=true);
                        }
                        difference() { 
                            translate([0, -2, 0])
                                cylinder(r = width / 2, h = 1, center = true);
                            translate([width / 2, 0, 0]) 
                                cube(width, center=true);
                        }
                    }
                }
            }
            color(gridTapeColor) {
                translate([0, 0, -0.1]) {
                    if (gridTapeSize == "small") {
                        difference() { 
                            cylinder(r = width / gridTapeScale, h = 1, center = true);
                            translate([width / 2,0,0]) 
                                cube(width, center=true);
                        }
                    }
                    else if (gridTapeSize == "fit") {
                        translate([0, 1, 0]) {
                            intersection() {
                                difference() { 
                                    cylinder(r = (width / 2) - 0.001, h = 1, center = true);
                                    translate([width / 2, 0, 0]) 
                                        cube(width, center=true);
                                }
                                difference() { 
                                    translate([0, -2, 0])
                                        cylinder(r = (width / 2) - 0.001, h = 1, center = true);
                                    translate([width / 2, 0, 0]) 
                                        cube(width, center=true);
                                }
                            }
                        }
                    }
                }
            }
        
            }
        }
        else {
            color(tailColor) {
                difference() {
                    difference() {
                        union() {
                            scale([4, 3, 1])
                                translate([-1.7, 0, 0])
                                    cylinder(h = 1, r = 1, center = true);
                                translate([-3.5, 0, 0]) 
                                    cube([7, width, 1], center=true);
                        }
                        scale([2,1,1])
                            translate([-3, 4.9, 0])
                                cylinder(h = 2, r = 2, center = true);
                        scale([2,1,1])
                            translate([-3, -4.9, 0])
                                cylinder(h = 2, r = 2, center = true);
                    }
                    translate([-5, 8, 0])
                        cube([6, 6.2, 5], center = true);
                    translate([-5, -8, 0])
                        cube([6, 6.2, 5], center = true);
                }
            }
            color(gridTapeColor) {
                translate([0, 0, -0.1]) {
                    if (gridTapeSize == "small") {
                        difference() {
                            difference() {
                            union() {
                                scale([3.5, 3, 1])
                                    translate([-1.7, 0, 0])
                                        cylinder(h = 1, r = 1, center = true);
                                    translate([-3.5, 0, 0]) 
                                        cube([7, width, 1], center=true);
                            }
                            scale([2,1,1])
                                translate([-3.5, 5.3, 0])
                                    cylinder(h = 2, r = 3, center = true);
                            scale([2,1,1])
                                translate([-3.5, -5.3, 0])
                                    cylinder(h = 2, r = 3, center = true);
                     
                        }
                            if (width == 18) {
                            translate([-3, 10.5, -3])
                                cube([10, 8, 10], center = true);
                            translate([-3, -10.5, -3])
                                cube([10, 8, 10], center = true);
                            }
                            else if (width == 16) {
                                translate([-2.499, 8, 0])
                                    cube(5, center = true);
                                translate([-2.499, -8, 0])
                                    cube(5, center = true);
                            }
                            else {
                                translate([-3, 11.5, -3])
                                    cube([10, 8, 10], center = true);
                                translate([-3, -11.5, -3])
                                    cube([10, 8, 10], center = true);
                                translate([-7, 10, 0])
                                    cube(10, center = true);
                                translate([-7, -10, 0])
                                    cube(10, center = true);
                            }
                        }
                    }
                    else if (gridTapeSize == "fit") {
                    difference() {
                        difference() {
                            union() {
                                scale([4, 3, 1])
                                    translate([-1.7, 0, -0.4])
                                        cylinder(h = 0.1, r = 1, center = true);
                                    translate([-3.5, 0, -0.4]) 
                                        cube([7, width - 0.1, 0.1], center=true);
                            }
                            scale([2,1,1])
                                translate([-3, 4.9, 0])
                                    cylinder(h = 2, r = 2, center = true);
                            scale([2,1,1])
                                translate([-3, -4.9, 0])
                                    cylinder(h = 2, r = 2, center = true);
                        }
                        translate([-5, 8, 0])
                            cube([6, 6.2, 5], center = true);
                        translate([-5, -8, 0])
                            cube([6, 6.2, 5], center = true);
                    }
                }
                }
            }
        }
    }
}
//tail("standard", 18, "red", "fit", "black");