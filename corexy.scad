include <config.scad>;

use <hardware.scad>;

use <motorbracket.scad>;
use <motorbracket.scad>;
use <gantryend.scad>;
use <rodbracket.scad>;
use <pulleys.scad>;
use <gantry.scad>;





module testBracket() {
  testWidth = 20;

  translate([-testWidth/2, -(motorSize/2+rodMountDiameter/2), -rodMountDiameter/2])
  rotate([0, 90, 0])
  difference() {
    union() {
      translate([0, -rodMountDiameter/2, 0])
      cube([rodMountDiameter/2, rodMountDiameter, testWidth]);
      cylinder(d=rodMountDiameter, h=testWidth);
    }
    translate([0, 0, -0.1])
    cylinder(d=rodDiameter, h=testWidth+0.2);
  }
}
module motor() {
  translate([-motorSize/2, -motorSize/2, -(motorHeight)])
  color("lightblue")
  nema17();
}

spacing = 10*2 + rodMountDiameter;

motorBracket();

translate([0, 0, pulleyOffset])
motorPulley();

translate([-idlerOffsetX, idlerOffsetY, pulleyOffset])
idlerPulleyBushing();

translate([bracketX + gantryX - backWallThickness, 0, 0]) {
  mirror()
  motorBracket();

  translate([0, 0, pulleyOffset])
  motorPulley();

  translate([-idlerOffsetX, idlerOffsetY, pulleyOffset])
  idlerPulleyBushing();
}

translate([gantryX/2+motorSize/2, -(motorSize/2+rodMountDiameter/2+motorDistance), 0]) {
  gantryEnd();

  translate([-gantryPulleyOffset, wallThickness, pulleyOffset])
  idlerPulleyBushing();

  translate([gantryPulleyOffset, wallThickness, pulleyOffset])
  idlerPulleyBushing();
}

translate([gantryX/2+motorSize/2, -(motorSize/2+rodMountDiameter/2+motorDistance+10+rodMountDiameter), rodMountDiameter/2])
gantry();

translate([-(rodMountDiameter+wallThickness), -(motorSize/2+rodMountDiameter/2+motorDistance + rodMountDiameter + spacing), -rodMountDiameter]) {
  rodBracket();
  translate([rodHolderPulleyOffset, rodMountDiameter/2 + rodHolderLip/2, rodMountDiameter/2+bracketZ+pulleyOffset])
  idlerPulleyBushing();
}

translate([bracketX + gantryX - backWallThickness + wallThickness + rodMountDiameter, -(motorSize/2+rodMountDiameter/2+motorDistance + rodMountDiameter + spacing), -rodMountDiameter])
mirror() {
  rodBracket();
  translate([rodHolderPulleyOffset, rodMountDiameter/2 + rodHolderLip/2, rodMountDiameter/2+bracketZ+pulleyOffset])
  idlerPulleyBushing();
}


translate([gantryX/2+motorSize/2, -(motorSize/2+rodMountDiameter/2+motorDistance + rodMountDiameter + spacing), 0]) {
  gantryEnd();

  translate([-gantryPulleyOffset, wallThickness, pulleyOffset])
  idlerPulleyBushing();

  translate([gantryPulleyOffset, wallThickness, pulleyOffset])
  idlerPulleyBushing();
}

motor();


