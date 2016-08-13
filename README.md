CoreXY
======

Yet another [CoreXY](http://corexy.com/implementation.html) style 3D printer,
heavily inspired by rcenger's [Compact CoreXY
Build](http://forums.reprap.org/read.php?397,417806) over at the reprap forums.

My one uses fishing line instead of belts. I have ordered some Spectra line,
but will use cheap and easily available monofilament in the meantime.

Found a plywood wine box that I'm using as a frame to build it into, maybe I'll
make a lid and try and sound-proof it. Early experiments show that it should be
way quieter than my Printrbot Simple Metal. The motors, rails &amp; bushings,
at least.

Using 12.2mm outer diameter aluminium tubing I got from a local hardware store
as linear rails. I'll just use 3D printed bushings for now.

Got some relatively small NEMA 17 steppers, DRV8825-based stepper motor drivers
and a Teensy 3.1 I'll use as the controller.

At first it will just be a 2D plotter for testing the motion platform. I'm
still 3D-printing these parts as I write this.

The ultimate goal is to use this as a test-bed for some ideas for closed loop
control that should allow me to run the motors with really low current,
allowing quiet operation.

Credits
-------

The hardware.scad file is from [Mark
Benson](http://www.thingiverse.com/thing:1280949/) over at Thingiverse. I
included it here because OpenSCAD doesn't have a package manager, so that's
just easier.


