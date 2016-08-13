include <config.scad>;

module pulley() {
  translate([0, 0, pulleyBushingHeight-pulleyHeight]) {
    // bottom half
    cylinder(d=pulleyOuterDiameter, h=wallThickness);
    translate([0, 0, wallThickness])
    cylinder(d1=pulleyOuterDiameter, d2=pulleyDiameter, h=pulleyDepth);

    // top half
    translate([0, 0, pulleyDepth + wallThickness])
    cylinder(d1=pulleyDiameter, d2=pulleyOuterDiameter, h=pulleyDepth);
    translate([0, 0, 2*pulleyDepth + wallThickness])
    cylinder(d=pulleyOuterDiameter, h=wallThickness);
  }
}

module idlerPulleyBushing() {
  color("seagreen")
  difference() {
    union() {
      pulley();
      cylinder(d=pulleyBushingInnerDiameter + 2*wallThickness, h=pulleyBushingHeight);
    }

    translate([0, 0, -0.1])
    cylinder(d=pulleyBushingInnerDiameter, h=pulleyBushingHeight+0.2);
  }
}

module motorPulley() {
  color("hotpink")
  difference() {
    union() {
      pulley();
      cylinder(d=motorShaftDiameter + 2*wallThickness, h=pulleyBushingHeight);
    }

    translate([0, 0, -0.1])
    cylinder(d=motorShaftDiameter, h=pulleyBushingHeight+0.2);
  }
}
