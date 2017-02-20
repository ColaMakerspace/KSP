
print "Starting countdown:".

from { local countdown is 10. } until countdown = 0 step {set countdown to countdown  -1.} do {
	print countdown .
	wait 1.
}

when maxthrust = 0 then {
	wait 0.5.
	print "staging...".
	stage.
	preserve.
}.

LOCK STEERING TO UP.

wait until ship:altitude > 70000000.
