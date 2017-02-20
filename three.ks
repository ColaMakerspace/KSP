CLEARSCREEN.

print "Starting countdown:".

from { local countdown is 10. } until countdown = 0 step {set countdown to countdown  -1.} do {
	print countdown .
	wait 1.
}
stage.

LIST ENGINES IN elist.
UNTIL false {
    PRINT "Stage: " + STAGE:NUMBER AT (0,0).
    FOR e IN elist {
        IF e:FLAMEOUT {
            STAGE.
            PRINT "STAGING!" AT (0,0).

            UNTIL STAGE:READY {
                WAIT 0.
            }

            LIST ENGINES IN elist.
            CLEARSCREEN.
            BREAK.
        }
    }
}

SET MYSTEER TO HEADING(90,90).
LOCK STEERING TO MYSTEER.
UNTIL SHIP:APOAPSIS > 80000 {
    IF SHIP:VELOCITY:SURFACE:MAG < 100 {
        SET MYSTEER TO HEADING(90,90).
    }
    ELSE IF SHIP:VELOCITY:SURFACE:MAG >= 100 {
        SET MYSTEER TO HEADING(90, 80).
        PRINT "Pitching to 80 deg." AT(0,15).
        PRINT ROUND(SHIP:APOAPSIS,0) AT(0,16).
    }
}
