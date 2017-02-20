CLEARSCREEN.

print "Launch in T minus:".

from { local countdown is 10. } until countdown = 0 step {set countdown to countdown  -1.} do {
	print countdown .
	wait 1.
}

lock steering to up.
lock throttle to 1.
stage.

wait 1.
print "Liftoff?".
wait 1.

CLEARSCREEN.

print "Waiting for SRB flameout...".

until stage:solidfuel < 0.1 {
    wait 1.
}

print "SRB flameout detected.".
print "Ejecting SRBs.".
stage.
wait 2.

set steeringWheel to HEADING(90, 90).
lock steering to steeringWheel.

print "Igniting liquid engine.".
stage.
wait 1.

print "Initiating gravity turn.".
set steeringWheel to HEADING(90, 65).

until ship:altitude > 10000 {
    wait 1.
}

print "Turning harder.".
set steeringWheel to HEADING(90, 45).

until ship:apoapsis > 65000 {
    wait 1.
}

print "Turning wicked hard.".
set steeringWheel to HEADING(90, 0).

print "Waiting for apoapsis above 80km.".
until ship:obt:apoapsis > 80000 {
    wait 1.
}

print "Apoapsis of " + ROUND(ship:obt:apoapsis) + " detected.".
print "Throttling down main engine.".
lock throttle to 0.

print "Waiting until near apoapsis...".
until ETA:APOAPSIS < 10 {
    wait 1.
}

lock steering to HEADING(90, 0).
print "Close to apoapsis. Reigniting main engine.".
lock throttle to 1.

until MAXTHRUST < 0.1 {
    wait 1.
}

print "Main engine cutoff.".
print "Dropping main engine.".
stage.
wait 2.
print "Igniting secondary engine.".
stage.

print "Waiting for stable orbit.".
until orbit:eccentricity > -0.1 and orbit:eccentricity < 0.1 {
    wait 0.25.
}

print "Orbital eccentricity near 0. Stable orbit achieved.".
lock throttle to 0.

print "".
print "[Insert the rest of mission here]".

print "Ejecting fairing.".
wait 0.5.
stage.
wait 2.
print "Deploying solar array.".
AG1 on.