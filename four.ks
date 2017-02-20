CLEARSCREEN.

print "Starting countdown:".

from { local countdown is 10. } until countdown = 0 step {set countdown to countdown  -1.} do {
	print countdown .
	wait 1.
}

lock steering to up.
lock throttle to 1.
stage.

when ship:altitude > 10000 then {
	LOCK STEERING TO R(0,0,-90) + HEADING(90,45).
}

when ship:apoapsis > 80000 then {
	LOCK STEERING TO R(0,0,-90) + HEADING(90,0).
}

print "Burning to raise apoapsis".
until ship:obt:apoapsis > 100000 {
  wait 0.5.
	if MAXTHRUST = 0 {
		stage.
	}
}

lock throttle to 0.
print "Waiting for apoapsis.".
until ETA:APOAPSIS < 10 {
	wait 0.5.
}
LOCK STEERING TO R(0,0,-90) + HEADING(90,0).
lock throttle to 1.

print "Buring to raise periapsis".
until ship:obt:periapsis > 100000{
	wait 0.5.
	if MAXTHRUST = 0 {
		stage.
	}
}

stage.
stage.
wait 1.
AG1 on.
lock throttle to 0.


