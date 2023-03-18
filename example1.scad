include <noseModule.scad>
include <tailModule.scad>
include <bodyModule.scad>
include <truckModule.scad>
include <wheelModule.scad>

$fa = 1;
$fs = 0.4;

bodyType = "carver";  //standard, carver, downhill
length = "short";      //short, medium, long
width = "small";       //small, medium, large
wheelSize = "small";   //small, medium, large
wheelShape = "spherical";  //cylindrical, spherical
boltsColor = "silver";    //none, black, silver, white
foldable = false;
bodyColor = "yellow";      //red, orange, yellow, green, blue, purple, pink, white, black
truckColor = "silver";    //white, silver
wheelColor = "white";   //red, orange, yellow, green, blue, purple, pink, white, black
bodyDecorationShape = "none";   //none, circle, square, triangle
bodyDecorationColor = "white";   //red, orange, yellow, green, blue, purple, pink, white, black
bodyDecorationSize = "small";   //small, medium, large
wheelDecoration = false;
bodyGridTapeSize = "none";   //none, fit, small
bodyGridTapeColor = "black"; //black, silver, white
bodyRailsColor = "black";     //red, orange, yellow, green, blue, purple, pink, white, black   
bodyRailsSize = "none";    //short, medium, long, none
truckRisersSize = "none";  //none, short, medium, tall
truckRisersColor = "black"; //black, silver, white


carverSelected =
 (bodyType == "carver") ? true:false;

//Body parameters
bodyWidth = 
 (width == "small") ? 16:
 (width == "large") ? 20:18;
  
bodyLength = 36;
bodyGridTapeLength = 
 (length == "short") ? 27: 
 (length == "long") ? 54:36;

bodyLengthScale = 
 (length == "short") ? 0.75:
 (length == "long")  ? 1.5:1; 
 
undersideDecorationSize = 
 (bodyDecorationSize == "small") ? 3:
 (bodyDecorationSize == "large") ? 7:5;
 
gridTapeScale = 
 (width == "small") ? 3.25 : 
 (width == "large") ? 3 : 3.1;
 
railsSize = 
 (bodyRailsSize == "none")  ? 0 :
 (bodyRailsSize == "short") ? 22 : 
 (bodyRailsSize == "long")  ? 30 : 26;
 
//Nose parameters
nosePositionFactor = 
 (length == "short") ? 2.8:
 (length == "long")  ? 1.35:2;
 
//Truck parameters
truckPositionFactor = 
 (bodyType == "downhill" && length == "short")  ? bodyLength - (bodyLength / 2.1) :
 (bodyType == "downhill" && length == "medium") ? bodyLength - (bodyLength / 3) :
 (bodyType == "downhill" && length == "long")   ? bodyLength - (bodyLength / 12) :
 (length == "short")  ? bodyLength / 3 :
 (length == "long")   ? bodyLength / 1.5 : bodyLength / 2;
 
 risersSize = 
 (truckRisersSize == "none")  ? 0 : 
 (truckRisersSize == "short") ? 0.5 : 
 (truckRisersSize == "tall")  ? 1.5 : 1;
 
//Wheel parameters
wheelRadius = 
 (wheelSize == "small") ? 1.5 : 
 (wheelSize == "large") ? 2.5 : 2;
 
wheelScaleFactor = 
 (wheelSize == "small") ? 3 :
 (wheelSize == "large") ? 1 : 2;
 
sphericalSelected = 
 (wheelShape == "spherical") ? true : false;
 
truckBaseHeight = 0.5;
truckWidth = 14;
wheelLength = 3;
 
wheelXCoordinate = truckPositionFactor;
wheelYCoordinate = (truckWidth / 2) - wheelLength + 1.3;
wheelZCoordinate = (truckBaseHeight * wheelScaleFactor) + wheelRadius + risersSize + 0.3;


//Building the object
body(bodyWidth, bodyLength, bodyLengthScale, bodyColor, bodyGridTapeSize, bodyGridTapeLength, bodyGridTapeColor, bodyDecorationShape, bodyDecorationColor, undersideDecorationSize, carverSelected, foldable, railsSize, bodyRailsColor);


translate([-bodyLength / nosePositionFactor + 0.001, 0, 0])
    nose(bodyType, bodyWidth, bodyColor, bodyGridTapeSize, bodyGridTapeColor, gridTapeScale);
translate([bodyLength / nosePositionFactor + 0.001, 0, 0])
    tail(bodyType, bodyWidth, bodyColor, bodyGridTapeSize, bodyGridTapeColor, gridTapeScale);

    
rotate([0, 0, 90]) {
    translate([0, truckPositionFactor, -truckBaseHeight])
        truck(truckBaseHeight, truckWidth, truckColor, boltsColor, risersSize, truckRisersColor);
    translate([0, -truckPositionFactor, -truckBaseHeight])
        truck(truckBaseHeight, truckWidth, truckColor, boltsColor, risersSize, truckRisersColor);
}

color(wheelColor) {
    translate([wheelXCoordinate, wheelYCoordinate, -wheelZCoordinate])
        wheel(wheelLength, wheelRadius, sphericalSelected, wheelDecoration);
    translate([wheelXCoordinate, -wheelYCoordinate, -wheelZCoordinate])
        wheel(wheelLength, wheelRadius, sphericalSelected, wheelDecoration);
    translate([-wheelXCoordinate, wheelYCoordinate, -wheelZCoordinate])
        wheel(wheelLength, wheelRadius, sphericalSelected, wheelDecoration);
    translate([-wheelXCoordinate, -wheelYCoordinate, -wheelZCoordinate])
        wheel(wheelLength, wheelRadius, sphericalSelected, wheelDecoration);
}