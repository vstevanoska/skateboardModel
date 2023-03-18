module truck(baseHeight = 0.5, width = 14, bodyColor = "gray", boltColor = "none", risersSize = 0, risersColor = "black")
{
    color(bodyColor) {
        translate([0, 0, -(risersSize) - (baseHeight/ 2)])
            cube([4, 2.5, baseHeight], center = true);
        translate([0, 0, -(risersSize) - (baseHeight/ 2) - 1])
            cylinder(1.5, baseHeight, 1, center = true);
        rotate([0, 90, 0])
            translate([(risersSize) + 2.8, 0, 0])
                cylinder(8, r = 1, center = true);
        rotate([0, 90, 0])
            translate([(risersSize) + 2.8, 0, 0])
                cylinder(width, r = baseHeight, center = true);
    }
    if (boltColor != "none") {
        color(boltColor) {
            translate([1.5, 1, 0.15])
                    cylinder(2, r = 0.2, center = true);
            translate([-1.5, 1, 0.15])
                    cylinder(2, r = 0.2, center = true);
            translate([1.5, -1, 0.15])
                    cylinder(2, r = 0.2, center = true);
            translate([-1.5, -1, 0.15])
                    cylinder(2, r = 0.2, center = true);
        }
    }
    if (risersSize != 0) {
        color(risersColor) {
            translate([0, 0, -risersSize / 2])
                cube([4, 2.5, risersSize], center = true);
        }
    }
}
//truck(0.5, 14, "silver", "white", 1.5, "black");