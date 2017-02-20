
print "Starting countdown:".

from { local countdown is 10. } until countdown = 0 step {set countdown to countdown  -1.} do {
	print countdown .
	wait 1.
}

until ship:maxthrust > 0 {
	wait 0.5.
	print "staging...".
	stage.
}

wait until ship:altitude > 70000000.
