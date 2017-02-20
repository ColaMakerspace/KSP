// Fuck you, terminal
CLEARSCREEN.

// Set cruise control to cool
LOCK THROTTLE TO 1.0.   // 1.0 is the max, 0.0 is idle.

// Count us down, Jim
PRINT "Counting down:".
FROM {local countdown is 10.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
    PRINT "..." + countdown.
    WAIT 1. // pauses the script here for 1 second.
}

// If you run out of thrust, stage some shit!
WHEN MAXTHRUST = 0 THEN {
    PRINT "Staging".
    STAGE.
    PRESERVE.
}.

// Does what it says.
LOCK STEERING TO UP.

// Keep this here so it doesn't die.
WAIT UNTIL SHIP:ALTITUDE > 70000.