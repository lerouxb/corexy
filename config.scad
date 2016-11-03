$fn=200;

wallThickness = 1.2;

pulleyDiameter = 7;
pulleyDepth = 2;
pulleyOuterDiameter = pulleyDiameter + 2*pulleyDepth;
pulleyHeight = 2*pulleyDepth + 2*wallThickness;

pulleyBushingInnerDiameter = 4.2;
pulleyBushingHeight = 18;

motorShaftDiameter = 5.2; // actually 5

motorSize = 42;
motorHeight = 48;
motorShaftHeight = 24;

//shaftCollarDiameter = 22.5; // actually 22
//shaftCollarThickness = 2.5; // actually 2

//wallDrillDiameter = 3.3;
wallDrillDiameter = 2.5;
wallNutDiameter = 6.2; // actually 6
wallNutHeight = 4;

//backWallHeight = 6 + 2*wallThickness; // 6 is the diameter of M4 screw head
backWallThickness = wallNutHeight + 2*wallThickness;

//rodDiameter = 12.5; // actually 12.2
rodDiameter = 6;
tightRodDiameter = rodDiameter; // for jamming it in there
looseRodDiameter = rodDiameter + 0.1; // for sliding it over
//rodMountDiameter = rodDiameter + 4*wallThickness;
rodMountDiameter = 2 * rodDiameter;

//rodHolderLip = 12;
//rodHolderLip = 20;
rodHolderPulleyOffset = 2;

//shortShaftLength = 250;

motorScrewOffset = 31/2;
motorScrewDrillDiameter = 2.5;

pulleyOffset = motorShaftHeight-pulleyBushingHeight;

idlerDrillDiameter = 3.3;
idlerNutDiameter = 7.8;
idlerOffsetX = 5;
idlerOffsetY = motorSize/2 + pulleyBushingInnerDiameter/2 + wallThickness;
idlerSpacing = wallThickness + pulleyBushingInnerDiameter/2 + pulleyOuterDiameter/2 + wallThickness;

bracketX = backWallThickness + motorSize;
bracketY = rodMountDiameter + backWallThickness + motorSize + idlerSpacing;

// difference between the motor shaft length and the pulley z size
bracketZ = motorShaftHeight - pulleyBushingHeight;

idlerNutHeight = bracketZ - 2*wallThickness;

gantryX = 62;
gantryY = 2*rodDiameter;
gantryPulleyOffset = pulleyOuterDiameter/2 + wallThickness/2;
gantryBushingOffset = 17;

motorDistance = wallThickness;

tensionerDrillDiameter = 2.5;
tensionerNutDiameter = 6.2;
tensionerNutHeight = 4;


penHexDiameter = 9;

boxThickness = 10; // CHANGE ME!
pulleyBottomOffset = 25; // slightly more than the pulley size plus bolt head
jigThickness = 2*wallThickness;

lipX = wallThickness*2 + pulleyOuterDiameter;
lipY = idlerNutDiameter + 4*wallThickness + 1;
lipZ = bracketZ;
