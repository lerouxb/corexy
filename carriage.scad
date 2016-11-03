include <config.scad>;

use <bushing.scad>;

carriageFlatX = gantryX-rodMountDiameter;
carriageY = 30;

tensionerOffsetY = carriageY/4;

module carriage() {
  difference() {
    translate([-carriageFlatX/2, -carriageY/2, rodMountDiameter/2-backWallThickness])
    cube([carriageFlatX, carriageY, backWallThickness]);

    // where the rods go
    translate([-carriageFlatX/2, carriageY/2, 0])
    bearingSpace();
    translate([carriageFlatX/2, carriageY/2, 0])
    bearingSpace();

    // pen hole
    translate([0, 0, -(rodMountDiameter/2+0.1)])
    cylinder(d=penHexDiameter, h=rodMountDiameter+0.2, $fn=6);

    // tensioner holes
    holeOffsetZ = rodMountDiameter/2-backWallThickness-0.1;
    translate([gantryPulleyOffset, tensionerOffsetY, holeOffsetZ])
    tensionerHole();
    translate([-gantryPulleyOffset, tensionerOffsetY, holeOffsetZ])
    tensionerHole();
    translate([gantryPulleyOffset, -tensionerOffsetY, holeOffsetZ])
    tensionerHole();
    translate([-gantryPulleyOffset, -tensionerOffsetY, holeOffsetZ])
    tensionerHole();

    // a hole through the center so we can tighten the pen
    translate([0, carriageY/2+0.1, rodMountDiameter/2-backWallThickness/2])
    rotate([90, 0, 0])
    cylinder(d=tensionerDrillDiameter, h=carriageY+0.2);
  }


  translate([-carriageFlatX/2, carriageY/2, 0])
  rotate([90, 0, 0])
  bushing(lm8uu_od=rodDiameter*2, lm8uu_length=carriageY, lm8uu_id=rodDiameter);

  translate([carriageFlatX/2, carriageY/2, 0])
  rotate([90, 0, 0])
  mirror()
  bushing(lm8uu_od=rodDiameter*2, lm8uu_length=carriageY, lm8uu_id=rodDiameter);
}

module bearingSpace() {
  rotate([90, 0, 0])
  translate([0, 0, -0.1])
  cylinder(d=2*rodDiameter, h=carriageY+0.2);
}

module tensionerHole() {
  cylinder(d=tensionerDrillDiameter, h=backWallThickness+0.2);
  translate([0, 0, -0.1])
  cylinder(d=tensionerNutDiameter, h=tensionerNutHeight+0.1, $fn=6);
}

carriage();
