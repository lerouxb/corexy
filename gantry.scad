include <config.scad>;

gantryFlatX = gantryX-rodMountDiameter;

module gantry() {
  difference() {
    union() {
      translate([-gantryFlatX/2, -rodMountDiameter/2, -rodMountDiameter/2])
      cube([gantryFlatX, rodMountDiameter, rodMountDiameter]);

      translate([-gantryFlatX/2, rodMountDiameter/2, 0])
      gantrySliderPositive();

      translate([gantryFlatX/2, rodMountDiameter/2, 0])
      gantrySliderPositive();
    }

    // where the rods go
    translate([-gantryFlatX/2, rodMountDiameter/2, 0])
    gantrySliderNegative();
    translate([gantryFlatX/2, rodMountDiameter/2, 0])
    gantrySliderNegative();

    // pen hole
    translate([0, 0, -(rodMountDiameter/2+0.1)])
    cylinder(d=penHexDiameter, h=rodMountDiameter+0.2, $fn=6);

    // tensioner holes
    translate([gantryPulleyOffset, tensionerOffsetY, -(rodMountDiameter/2+0.1)])
    tensionerHole();
    translate([-gantryPulleyOffset, tensionerOffsetY, -(rodMountDiameter/2+0.1)])
    tensionerHole();
    translate([gantryPulleyOffset, -tensionerOffsetY, -(rodMountDiameter/2+0.1)])
    tensionerHole();
    translate([-gantryPulleyOffset, -tensionerOffsetY, -(rodMountDiameter/2+0.1)])
    tensionerHole();

    // a hole through the center so we can tighten the pen
    rotate([90, 0, 0])
    translate([0, 0, -rodMountDiameter/2-0.1])
    cylinder(d=tensionerDrillDiameter, h=rodMountDiameter+0.2);
  }
}

module gantrySliderPositive() {
  rotate([90, 0, 0])
  cylinder(d=rodMountDiameter, h=rodMountDiameter);
}

module gantrySliderNegative() {
  rotate([90, 0, 0])
  translate([0, 0, -0.1])
  cylinder(d=looseRodDiameter, h=rodMountDiameter+0.2);
}

module tensionerHole() {
  cylinder(d=tensionerDrillDiameter, h=rodMountDiameter+0.2);
  translate([0, 0, -0.1])
  cylinder(d=tensionerNutDiameter, h=tensionerNutHeight+0.1, $fn=6);
}

gantry();
