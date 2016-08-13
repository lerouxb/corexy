include <config.scad>;

rodHolderLip = 9;
rodHolderX = rodMountDiameter + rodHolderLip;
rodHolderY = rodMountDiameter + backWallThickness + wallThickness + rodHolderLip;

module rodBracket() {
  difference() {
    union() {
      translate([-(rodMountDiameter/2), -(rodMountDiameter/2 + wallThickness), 0])
      cube([rodMountDiameter, rodMountDiameter+wallThickness, rodMountDiameter]);

      // x back wall
      translate([-(rodMountDiameter/2), -(rodMountDiameter/2 + backWallThickness + wallThickness), 0])
      cube([rodHolderX, backWallThickness, rodMountDiameter]);

      // y back wall
      translate([-(rodMountDiameter/2), -(rodMountDiameter/2 + backWallThickness + wallThickness), 0])
      cube([backWallThickness, rodHolderY, rodMountDiameter]);

      // top it off
      translate([-(rodMountDiameter/2), rodMountDiameter/2 - 2*wallThickness, rodMountDiameter])
      cube([rodMountDiameter, rodHolderLip + 2*wallThickness, bracketZ]);
    }

    // hole where the rod fits in
    translate([-(rodMountDiameter/2 + 0.1), 0, rodMountDiameter/2])
    rotate([0, 90, 0])
    cylinder(d=tightRodDiameter, h=rodHolderX+0.2);

    // hole in the x side wall
    translate([-(rodMountDiameter/2) + backWallThickness, rodMountDiameter/2+rodHolderLip/2, rodMountDiameter/2])
    rodWallHole();

    // hole in the y side wall
    translate([rodMountDiameter/2+rodHolderLip/2, -(rodMountDiameter/2+wallThickness), rodMountDiameter/2])
    rotate([0, 0, 90])
    rodWallHole();

    // idler pulley hole
    translate([rodHolderPulleyOffset, rodMountDiameter/2 + rodHolderLip/2, rodMountDiameter])
    rodPulleyHole();
  }

}

module rodWallHole() {
  rotate([0, 270, 0])
  translate([0, 0, -0.1]) {
  cylinder(d=wallDrillDiameter, h=backWallThickness+0.2);
  cylinder(d=wallNutDiameter, h=wallNutHeight+0.1, $fn=6);
  }
}

module rodPulleyHole() {
  translate([0, 0, -0.1]) {
  cylinder(d=idlerDrillDiameter, h=bracketZ+0.2);
  cylinder(d=idlerNutDiameter, h=idlerNutHeight+0.1, $fn=6);
  }
}

rodBracket();
