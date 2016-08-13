include <config.scad>;

module gantryEnd() {
  difference() {
    union() {
      rodHolderX();

      translate([-gantryX/2+rodMountDiameter/2, 0, 0])
      rodHolderY();
      translate([gantryX/2-rodMountDiameter/2, 0, 0])
      rodHolderY();

      // flat
      translate([-gantryX/2 + rodMountDiameter, -rodMountDiameter/2, 0])
      cube([gantryX - 2*rodMountDiameter, rodMountDiameter, bracketZ]);
    }

    // symmetrical screw holes for idler pulleys
    translate([-gantryPulleyOffset, 0, 0])
    gantryPulleyHole();
    translate([gantryPulleyOffset, 0, 0])
    gantryPulleyHole();
  }
}

module gantryPulleyHole() {
  translate([0, 0, -0.1]) {
  cylinder(d=idlerDrillDiameter, h=bracketZ+0.2);
  rotate([0, 0, 90])
  cylinder(d=idlerNutDiameter, h=idlerNutHeight+0.1, $fn=6);
  }
}

module rodHolderX() {
  translate([-gantryX/2, 0, -rodMountDiameter/2])
  rotate([0, 90, 0])
  difference() {
    union() {
      translate([-rodMountDiameter/2, -rodMountDiameter/2, 0])
      cube([rodMountDiameter/2, rodMountDiameter, gantryX]);
      cylinder(d=rodMountDiameter, h=gantryX);
    }

    // this part has to slide over the rod
    translate([0, 0, -0.1])
    cylinder(d=looseRodDiameter, h=gantryX+0.2);

    difference() {
      // subtract the middle section
      translate([-rodMountDiameter/2-0.1, -gantryY/2-0.1, rodMountDiameter])
      cube([rodMountDiameter+0.2, gantryY+0.2, gantryX-2*rodMountDiameter]);

      //translate([-rodMountDiameter/2-0.2, -gantryY/2-0.2, gantryX/2-rodMountDiameter*0.2])
      //cube([rodMountDiameter+0.4, gantryY+0.4, rodMountDiameter*0.4]);
    }
  }
}

module rodHolderY() {
  translate([0, -rodMountDiameter/2, rodMountDiameter/2])
  rotate([-90, 0, 0])
  difference() {
    union() {
      translate([-rodMountDiameter/2, 0, 0])
      cube([rodMountDiameter, rodMountDiameter/2, gantryY]);
      cylinder(d=rodMountDiameter, h=gantryY);
    }
    // this part has to be tight
    translate([0, 0, -0.1])
    cylinder(d=tightRodDiameter, h=gantryY+0.2);
  }
}
