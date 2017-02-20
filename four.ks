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

when Orbit:periapsis > 70000 then {
	lock throttle to 0.
	shutdown.
}

until Orbit:apoapsis > 80000 {
  wait 0.5.
	if MAXTHRUST = 0 {
		stage.
	}
}

until Orbit:periapsis > 70000{
	wait 0.5.
	if MAXTHRUST = 0 {
		stage.
	}
}

AG1 on.
