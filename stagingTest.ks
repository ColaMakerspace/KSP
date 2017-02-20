CLEARSCREEN.

PRINT "ETA:".
FROM {local countdown is 10.} UNTIL countdown = 0 STEP {
    SET countdown = countdown - 1.
}DO {
    PRINT "..." + countdown.
    WAIT 1.
}