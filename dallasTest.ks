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
wait 1.

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

until MAXTHRUST < 0.1 {
    wait 1.
}

print "Flameout detected. Staging.".
stage.
