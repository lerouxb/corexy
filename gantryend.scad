include <config.scad>;
use <bushing.scad>;

module gantryEnd() {
  difference() {
    union() {
      rodHolderX();

      translate([-gantryX/2+rodMountDiameter/2, 0, 0])
      rodHolderY();
      translate([gantryX/2-rodMountDiameter/2, 0, 0])
      rodHolderY();

      // flat
      translate([-gantryX/2 + rodMountDiameter, -gantryY/2, 0])
      cube([gantryX - 2*rodMountDiameter, gantryY, bracketZ]);
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
  translate([-gantryX/2, 0, -rodDiameter])
  rotate([0, 90, 0])
  difference() {
    union() {
      difference() {
        translate([-rodDiameter, -gantryY/2, 0])
        cube([rodDiameter, gantryY, gantryX]);

        translate([0, 0, -0.1])
        cylinder(d=rodDiameter*2, h=gantryX+0.2);
      }

      bushing(lm8uu_od=rodDiameter*2, lm8uu_length=gantryX, lm8uu_id=rodDiameter);
    }

    // subtract the middle section
    translate([-rodMountDiameter, -gantryY, gantryBushingOffset])
    cube([rodMountDiameter*2, gantryY*2, gantryX-2*gantryBushingOffset]);
  }
}

module rodHolderY() {
  translate([0, -gantryY/2, rodMountDiameter/2])
  rotate([-90, 0, 0])
  difference() {
    union() {
      translate([-rodMountDiameter/2, 0, 0])
      cube([rodMountDiameter, gantryY/2, gantryY]);
      cylinder(d=rodMountDiameter, h=gantryY);
    }
    // this part has to be tight
    translate([0, 0, -0.1])
    cylinder(d=tightRodDiameter, h=gantryY+0.2);
  }
}

gantryEnd();
//rodHolderX();
