set desiredAltitude to 1769645.29.

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

lock steering to HEADING(90, 90).

print "".
print "Igniting liquid engine.".
stage.
wait 1.

print "Initiating gravity turn.".
lock steering to HEADING(90, 65).

until ship:altitude > 10000 {
    wait 1.
}

print "Turning harder.".
lock steering to HEADING(90, 45).

until ship:apoapsis > 65000 {
    wait 1.
}

print "Turning wicked hard.".
lock steering to HEADING(90, 0).

print "".
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
print "".
print "Close to apoapsis. Reigniting main engine.".
lock throttle to 1.

until MAXTHRUST < 0.1 {
    wait 1.
}

print "Main engine cutoff.".
print "Dropping main engine.".
stage.
wait 2.
print "".
print "Igniting secondary engine.".
stage.

print "Waiting for stable orbit.".
until ship:obt:eccentricity > -0.01 and ship:obt:eccentricity < 0.01 {
    CLEARSCREEN.
    print "Orbital eccentricity: " + ROUND(ship:obt:eccentricity, 2).
    wait 0.1.
}

print "Orbital eccentricity near 0. Stable orbit achieved.".
lock throttle to 0.

print "".
print "Ejecting fairing.".
wait 0.5.
stage.
wait 2.
print "Deploying solar array.".
AG1 on.
print "Dropping secondary engine.".
stage.
print "Warping to periapsis...".

set timeToPeri to ETA:PERIAPSIS.
kuniverse:timewarp:warpto(time:seconds + (timeToPeri - 10)).
print "".
until ETA:PERIAPSIS < 1 {
    wait 1.
}

print "Boosting apoapsis...".
lock steering to HEADING(90, 0).
stage.
lock throttle to 0.1.

until ship:obt:apoapsis > desiredAltitude {
    wait 0.5.
}

lock throttle to 0.
print "Apoapsis is high enough.".
print "".
print "Warping to apoapsis...".

set timeToApo to ETA:APOAPSIS.
kuniverse:timewarp:warpto(time:seconds + (timeToApo - 10)).
until ETA:APOAPSIS < 1 {
    wait 1.
}

print "Boosting periapsis...".
lock steering to HEADING(90, 0).
lock throttle to 0.1.
until ship:obt:periapsis > desiredAltitude {
    wait 0.5.
}
lock throttle to 0.
print "Periapsis is high enough.".
print "".
print "The end?".