include <config.scad>;
use <knurledFinishLib_v2.scad>


spoolCircumference = 40;
spoolRadius = spoolCircumference/(2*PI);
spoolDiameter = spoolCircumference/PI;

spoolDrillDiameter = 2.5;
spoolNutDiameter = 6.2;

spoolOuterDiameter = 22; // about the shaft collar
spoolOuterRadius = spoolOuterDiameter/2;

spoolHeight = motorShaftHeight;

spoolTopHeight = 4;
spoolBottomHeight = 4;

// height of the 45 degree tapers that link the diameters
spoolTaper = (spoolOuterDiameter-spoolDiameter)/2;

filamentDiameter = 1.5; // TODO: increase
filamentRadius = filamentDiameter/2;

filamentChannel1Offset = motorShaftDiameter/2 + (spoolDiameter-motorShaftDiameter)/4;
filamentChannel2Offset = spoolRadius+filamentRadius;

filamentGap = filamentChannel2Offset-filamentChannel1Offset;


module spool() {
  difference() {
    union() {
      cylinder(d=spoolDiameter, h=spoolHeight);

      spoolTop();
      spoolBottom();

      spoolSeparator();
    }

    motorShaft();

    motorScrewHoles();

    filamentChannel();
  }
}

module spoolTop() {
  translate([0, 0, spoolHeight-spoolTopHeight])
  //cylinder(d=spoolOuterDiameter, h=spoolTopHeight);
  knurl(k_cyl_hg=spoolTopHeight, k_cyl_od=spoolOuterDiameter, knurl_wd=2, knurl_hg=2, e_smooth=1, knurl_dp=0.5);

  // taper
  //translate([0, 0, spoolHeight-(spoolTopHeight+spoolTaper)])
  //cylinder(d1=spoolDiameter, d2=spoolOuterDiameter, h=spoolTaper);
}

module spoolBottom() {
  cylinder(d=spoolOuterDiameter, h=spoolBottomHeight);
  translate([0, 0, spoolBottomHeight])
  cylinder(d1=spoolOuterDiameter, d2=spoolDiameter, h=spoolTaper);
}

module spoolSeparator() {
  // TODO: change the angle to be less steep
  // maybe print at a lower temp
  // maybe 0.2mm or 0.15mm layers rather than 0.1mm
  // add an extra cylinder at the end of the taper to even out the thin top edge

  separatorProtrusion = (spoolOuterDiameter-spoolDiameter)/3;
  spoolMidDiameter = spoolDiameter + separatorProtrusion*2;
  spoolGap = spoolHeight-(spoolTopHeight+spoolTaper+spoolBottomHeight);

  separatorHeight = separatorProtrusion;
  echo("separatorHeight", separatorHeight);

  translate([0, 0, spoolBottomHeight + spoolTaper + spoolGap/2 - (separatorHeight*1.5)]) {
    translate([0, 0, separatorHeight])
    cylinder(d1=spoolMidDiameter, d2=spoolDiameter, h=separatorHeight);
  }

}

module motorShaft() {
  translate([0, 0, -0.1])
  cylinder(d=motorShaftDiameter, h=spoolHeight+0.2);
}

module motorScrewHoles() {
  motorScrewHole();
  rotate([0, 0, 120])
  motorScrewHole();
  rotate([0, 0, 240])
  motorScrewHole();
}

motorScrewCutoutDepth = 1;

module motorScrewHole() {
  translate([0, 0, spoolNutDiameter/2])
  rotate([60, 90, 0])
  translate([0, 0, -0.1]) {
    cylinder(d=spoolDrillDiameter, h=spoolOuterRadius+0.1);
    translate([-(spoolNutDiameter/2+0.1), -(spoolNutDiameter/2+0.1), spoolOuterRadius - motorScrewCutoutDepth])
    cube([spoolNutDiameter+0.2, spoolNutDiameter+0.2, motorScrewCutoutDepth+0.1]);
  }
}


module filamentChannel() {
  translate([filamentChannel1Offset, 0, -0.1])
  cylinder(d=filamentDiameter, h=spoolHeight+0.2);

  translate([filamentChannel2Offset, 0, -0.1])
  cylinder(d=filamentDiameter, h=spoolBottomHeight + spoolTaper + 0.2);

  translate([filamentChannel2Offset, 0, spoolHeight - (spoolTopHeight+0.1)])
  cylinder(d=filamentDiameter, h=spoolTopHeight + 0.2);

  filamentChannelLink();

  translate([0, 0, spoolHeight])
  filamentChannelLink();
}

module filamentChannelLink() {
  translate([filamentChannel1Offset, 0, 0])
  rotate([0, 90, 0])
  cylinder(d=filamentDiameter, h=filamentGap);
}

spool();
