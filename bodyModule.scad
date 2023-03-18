$fa = 1;
$fs = 0.4;

module body(width = 18, length = 36, lengthScale = 1, bodyColor = "white", gridTapeSize = "none", gridTapeLength = 36, gridTapeColor = "black",patternShape = "none", patternColor = "white",patternSize = 5, isCarver = false, isFoldable = false, railsSize = 0, railsColor = "black")
{
    foldingWidth = (isCarver == true) ? width + 1 : width;
    
    scale([lengthScale, 1, 1]) {
        color(bodyColor) {
            if (isCarver) {
                union() { 
                    difference() {
                        scale([length / 6, 1, 1])
                            cylinder(h = 1, r = width / 2 + 0.45, center = true);
                        cube([length * 6, width, 2], center = true);
                    }
                    cube([length, width, 1], center = true);
                }
            }
            else {
                cube([length, width, 1], center = true);
            }
        }
    }
    color(patternColor) {
    
        if (patternShape == "circle") {
            translate([0, 0, -0.1])
                circle(patternSize);
        }
        else if (patternShape == "square") {
            translate([0, 0, -0.1])
                square(patternSize * 2, center = true);
        }
        else if (patternShape == "triangle") {
            rotate([0, 0, 90])
            translate([-patternSize, -patternSize, -0.1])
                polygon(points=[[0,0],[patternSize * 2,0],[patternSize, patternSize * 2]]);
        }
    }

    if (isFoldable) {    
        color("black") {
            translate([0, 0, -0.7]){
                cube([2, foldingWidth + 0.01, 0.5], center = true);
            translate([0, 0, 0.5])
                cube([0.5, foldingWidth + 0.1, 1.5], center = true);
            rotate([90, 0, 0])
                translate([0.5, 0.5, 0])
                    cylinder(foldingWidth + 0.5, r = 0.2 , center = true);
            rotate([90, 0, 0])
                translate([-0.5, 0.5, 0])
                    cylinder(foldingWidth + 0.5, r = 0.2 , center = true);
            }
        }
    }
    
    color(gridTapeColor) {
        translate([0, 0, 0.1]) {
            if (gridTapeSize == "small") 
                cube([gridTapeLength, width - 5, 1], center = true);
            
            else if (gridTapeSize == "fit") 
                cube([gridTapeLength, width - 0.001, 1], center = true);
        }
    }
    
    color(railsColor) {
        if (railsSize != 0) {
            translate([0, (width / 2) - 2, -0.6])
                cube([railsSize, 1, 0.5], center = true);
            translate([0, -(width / 2) + 2, -0.6])
                cube([railsSize, 1, 0.5], center = true);
        }
    }
}
//body(18, 36, 1, "red", "small", 36, "black", "triangle", "white", 5, false, false, 30, "orange");