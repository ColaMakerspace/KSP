set desiredPeriod to 21549.
set desiredAltitude to 2863330.

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

print " ".
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

print "Turning due East.".
lock steering to HEADING(90, 0).

print " ".
print "Waiting for apoapsis above 80km.".
until ship:obt:apoapsis > 80000 {
    wait 1.
}

print "Apoapsis of " + ROUND(ship:obt:apoapsis) + " detected.".
print "Throttling down main engine.".
lock throttle to 0.
wait 1.

print "Physics warping to space...".
set kuniverse:timewarp:mode to "PHYSICS".
set kuniverse:timewarp:warp to 3.
until ship:altitude > 70000 {
    wait 0.5.
}
set kuniverse:timewarp:warp to 0.
wait 1.
print "Warping to near apoapsis...".
kuniverse:timewarp:warpto(time:seconds + (ETA:APOAPSIS - 20)).
print "Waiting until near apoapsis...".
until ETA:APOAPSIS < 10 {
    wait 1.
}

lock steering to HEADING(90, 0).
print " ".
print "Close to apoapsis. Reigniting main engine.".
lock throttle to 1.

until MAXTHRUST < 0.1 {
    wait 1.
}

print "Main engine cutoff.".
print "Dropping main engine.".
stage.
wait 2.
print " ".
print "Igniting secondary engine.".
stage.

print "Waiting for stable orbit.".
until ship:obt:apoapsis > 75000 and ship:obt:periapsis > 75000 {
    wait 0.1.
}
print "Apo and Peri above 75km. Orbit achieved.".
lock throttle to 0.

print " ".
print "Ejecting fairing.".
wait 0.5.
stage.
wait 2.
print "Deploying solar array.".
AG1 on.
print "Dropping secondary engine.".
stage.
wait 1.
print "Warping to periapsis...".

set timeToPeri to ETA:PERIAPSIS.
kuniverse:timewarp:warpto(time:seconds + (timeToPeri - 10)).
print " ".
lock steering to HEADING(90, 0).
until ETA:PERIAPSIS < 1 {
    wait 1.
}

print "Boosting apoapsis...".
set slowdownApo to desiredAltitude * 0.9.
stage.
lock throttle to 1.
until ship:obt:apoapsis > slowdownApo {
    wait 0.1.
}
lock throttle to 0.1.
until ship:obt:apoapsis > desiredAltitude {
    wait 0.1.
}
lock throttle to 0.
print "Apoapsis is high enough.".

print " ".
wait 1.
print "Warping to apoapsis...".

set timeToApo to ETA:APOAPSIS.
kuniverse:timewarp:warpto(time:seconds + (timeToApo - 10)).
lock steering to HEADING(90, 0).
until ETA:APOAPSIS < 1 {
    wait 1.
}

print "Boosting orbital period to " + desiredPeriod + " seconds.".
set slowdownPeriod to desiredPeriod * 0.9.
lock throttle to 0.5.
until ship:obt:period > slowdownPeriod {
    wait 0.1.
}
lock throttle to 0.1.
until ship:obt:period > desiredPeriod {
    wait 0.1.
}
lock throttle to 0.

print "Orbital period near " + desiredPeriod + " achieved.".
print " ".
print "The End?".