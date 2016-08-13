include <config.scad>;

module motorBracket() {
  holderOffset = rodMountDiameter/2-motorSize/2-backWallThickness;

  motorPlate();
  wallBrackets();
  translate([holderOffset, 0, 0])
  motorRodHolder();
}

module motorScrewHole() {
  translate([0, 0, -0.1])
  cylinder(d=motorScrewDrillDiameter, h=bracketZ+0.2);
}

module motorPlate() {
  plateOffsetX = -(backWallThickness+motorSize/2);

  difference() {
    translate([plateOffsetX, -(motorSize/2), 0])
    cube([bracketX, idlerSpacing+motorSize, bracketZ]);

    /*
    // hole for motor shaft collar
    translate([0, 0, -0.1])
    cylinder(d=shaftCollarDiameter, h=shaftCollarThickness+0.2);

    // hole for motor shaft
    translate([0, 0, -0.1])
    cylinder(d=motorShaftDiameter+wallThickness, h=bracketZ+0.2);
    */

    translate([0, 0, -0.1])
    cylinder(d=motorSize-6*wallThickness, h=bracketZ+0.2);

    // screw holes for motor
    translate([-motorScrewOffset, -motorScrewOffset, 0])
    motorScrewHole();
    translate([-motorScrewOffset, motorScrewOffset, 0])
    motorScrewHole();
    translate([motorScrewOffset, -motorScrewOffset, 0])
    motorScrewHole();
    translate([motorScrewOffset, motorScrewOffset, 0])
    motorScrewHole();

    // idler pulley
    translate([-idlerOffsetX, idlerOffsetY, -0.1])
    cylinder(d=idlerDrillDiameter, h=bracketZ+0.2);
  }
}

module wallXScrewHole() {
  translate([-backWallThickness/2-1, 0, -backWallThickness/2])
  rotate([0, 90, 0])
  union() {
    cylinder(d=wallDrillDiameter, h=backWallThickness+2);
    rotate([0, 0, 90])
    cylinder(d=wallNutDiameter, h=wallNutHeight+1, $fn=6);
  }
}

module wallYScrewHole() {
  translate([0, -backWallThickness/2-1, -backWallThickness/2])
  rotate([0, 90, 90])
  union() {
    cylinder(d=wallDrillDiameter, h=backWallThickness+2);
    rotate([0, 0, 90])
    cylinder(d=wallNutDiameter, h=wallNutHeight+1, $fn=6);
  }
}

module wallBrackets() {
  wallOffset = -(backWallThickness+motorSize/2);
  motorOffsetXTweak = 0.1;

  difference() {
    translate([wallOffset, -motorSize/2, -backWallThickness])
    cube([backWallThickness+motorSize, motorSize+idlerSpacing, backWallThickness]);

    translate([-motorSize/2+motorOffsetXTweak, -motorSize/2-0.1, -(backWallThickness+0.1)])
    cube([motorSize+0.1, motorSize+idlerSpacing-backWallThickness+0.1, backWallThickness+0.2]);

    translate([-(motorSize/2+backWallThickness/2), -motorScrewOffset, 0])
    rotate([0, 0, 180])
    wallXScrewHole();

    translate([-(motorSize/2+backWallThickness/2), motorScrewOffset, 0])
    rotate([0, 0, 180])
    wallXScrewHole();

    translate([-motorScrewOffset, (motorSize/2+idlerSpacing-backWallThickness/2), 0])
    wallYScrewHole();

    translate([motorScrewOffset, (motorSize/2+idlerSpacing-backWallThickness/2), 0])
    wallYScrewHole();
  }
}

module motorRodHolder() {
  translate([-rodMountDiameter/2, -(motorSize/2+rodMountDiameter/2+motorDistance), -rodMountDiameter/2])
  rotate([0, 90, 0])
  difference() {
    union() {
      translate([-(rodMountDiameter/2+bracketZ), -rodMountDiameter/2, 0])
      // square it off
      cube([rodMountDiameter/2+bracketZ, rodMountDiameter, rodMountDiameter]);

      // connect it to the main block
      translate([-(rodMountDiameter/2+bracketZ), -rodMountDiameter/2, 0])
      cube([bracketZ+backWallThickness, rodMountDiameter+motorDistance, rodMountDiameter]);

      // the round outside part
      cylinder(d=rodMountDiameter, h=rodMountDiameter);
    }
    // this part has to hold the rod tight
    translate([0, 0, -0.1])
    cylinder(d=tightRodDiameter, h=bracketX+0.2);
  }
}
