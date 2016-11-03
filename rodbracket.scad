include <config.scad>;
use <Chamfers-for-OpenSCAD/Chamfer.scad>;
use <pulleys.scad>;


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

module rodBracket() {
  difference() {
    union() {
      translate([0, -rodMountDiameter/2, -rodMountDiameter])
      chamferCube(sizeX=lipX, sizeY=rodMountDiameter, sizeZ=rodMountDiameter, chamferHeight=1);

      translate([0, -rodMountDiameter/2, -(rodMountDiameter+2*wallNutDiameter)])

      chamferCube(sizeX=backWallThickness, sizeY=rodMountDiameter, sizeZ=rodMountDiameter + 2*(2*wallNutDiameter), chamferHeight=1);
    }

    // hole where the rod goes
    translate([-0.1, 0, -rodMountDiameter/2])
    rotate([0, 90, 0])
    cylinder(d=tightRodDiameter, h=lipX+0.2);

    //  screw+nut holes in back plate
    translate([backWallThickness, 0, wallNutDiameter])
    rodWallHole();
    translate([backWallThickness, 0, -(rodMountDiameter+wallNutDiameter)])
    rodWallHole();
  }
}

module rodBracketJig() {
  translate([-(jigThickness+boxThickness), -rodMountDiameter/2, -(rodMountDiameter+2*wallNutDiameter)]) {
    difference() {
      union() {
        // vertical back wall
        cube([jigThickness, rodMountDiameter, jigThickness + pulleyBottomOffset + bracketZ + rodMountDiameter + 2*wallNutDiameter]);

        // lip horizontal
        translate([0, 0, bracketZ + pulleyBottomOffset + rodMountDiameter + 2*wallNutDiameter])
        cube([jigThickness*2 + boxThickness, rodMountDiameter, jigThickness]);

        // lip vertical
        translate([jigThickness+boxThickness, 0, bracketZ + pulleyBottomOffset + rodMountDiameter + 2*wallNutDiameter - jigThickness])
        cube([jigThickness, rodMountDiameter, jigThickness*2]);
      }

      translate([0, 0, wallNutDiameter])
      jigWallHole();

      translate([0, 0, 3*wallNutDiameter + rodMountDiameter])
      jigWallHole();
    }
  }
}

module rodPulleyBracket() {
  difference() {
    union() {
      translate([0, -rodMountDiameter/2, -rodMountDiameter])
      chamferCube(sizeX=lipX, sizeY=rodMountDiameter, sizeZ=rodMountDiameter, chamferHeight=1);

      // back plate where we're the screws go
      translate([0, -rodMountDiameter/2, -(rodMountDiameter+2*wallNutDiameter)])
      chamferCube(sizeX=backWallThickness, sizeY=rodMountDiameter, sizeZ=rodMountDiameter + 2*(2*wallNutDiameter), chamferHeight=1);

      // overhang for pulley plus screw+nut hole
      //translate([0, -rodMountDiameter/2, 0])
      //chamferCube(sizeX=rodMountDiameter+2*idlerNutDiameter, sizeY=rodMountDiameter, sizeZ=bracketZ, chamferHeight=1);

      // overhang in the y direction
      translate([0, rodMountDiameter/2 - 2, -rodMountDiameter])
      chamferCube(sizeX=lipX, sizeY=4, sizeZ=bracketZ+rodMountDiameter, chamferHeight=1);

      // overhang in the x direction
      translate([0, rodMountDiameter/2, 0])
      chamferCube(sizeX=lipX, sizeY=lipY, sizeZ=lipZ, chamferHeight=1);
      }

    // hole where the rod goes
    translate([-0.1, 0, -rodMountDiameter/2])
    rotate([0, 90, 0])
    cylinder(d=tightRodDiameter, h=lipX+0.2);

    // screw+nut holes in back plate
    translate([backWallThickness, 0, wallNutDiameter])
    rodWallHole();
    translate([backWallThickness, 0, -(rodMountDiameter+wallNutDiameter)])
    rodWallHole();

    // screw+nut hole for the pulley
    translate([lipX/2, rodMountDiameter/2 + lipY/2, 0])
    rodPulleyHole();
  }
}

/*
module rodPulleyJig() {
  translate([-(jigThickness+boxThickness), -rodMountDiameter/2, -(rodMountDiameter+2*wallNutDiameter)]) {
    difference() {
      union() {
        cube([jigThickness, rodMountDiameter, jigThickness + pulleyBottomOffset + rodMountDiameter + 2*wallNutDiameter]);

        translate([0, 0, pulleyBottomOffset + rodMountDiameter + 2*wallNutDiameter])
        cube([jigThickness*2 + boxThickness, rodMountDiameter, jigThickness]);

        translate([jigThickness+boxThickness, 0, pulleyBottomOffset + rodMountDiameter + 2*wallNutDiameter - jigThickness])
        cube([jigThickness, rodMountDiameter, jigThickness*2]);
      }

      translate([0, 0, wallNutDiameter])
      jigWallHole();

      translate([0, 0, 3*wallNutDiameter + rodMountDiameter + bracketZ])
      jigWallHole();
    }
  }
}
*/

module jigWallHole() {
  translate([0, rodMountDiameter/2, 0])
  rotate([0, 90, 0])
  translate([0, 0, -0.1])
  cylinder(d=wallDrillDiameter, h=jigThickness+0.2);
}

rodBracketJig();

//translate([lipX/2, rodMountDiameter/2 + lipY/2, pulleyOffset])
//idlerPulleyBushing();

//rodPulleyBracket();
