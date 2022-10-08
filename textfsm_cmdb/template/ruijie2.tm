Value HOSTNAME (\S+)
Value MODEL (\S+)
Value VERSION (.*)
Value List SN ([A-Za-z\d]+)
Value List UPDEVICE (\S+(LF|CO|SP|DI|EX)\S+\b)
Value List LOCALPORT ([A-Za-z\-]+\s*\d*\/\d*(\/\d*)*)
Value List UPPORT ([A-Za-z\-]*\s*\d*\/\d*(\/\d*)*)


Start
 ^${HOSTNAME}#.*
 ^System description.*\(${MODEL}\)
 ^System software version : ${VERSION}
 ^  Slot \d\/M\d.* -> m1
 ^  Slot ([1,2]\/0|\d)\s*:\s* -> he

he
 ^\s+Serial number\s+:\s+${SN} -> Continue
 ^.*show lldp nei -> lldp

m1
 ^\s+Serial number\s+:\s+${SN} -> m2

m2
 ^  Slot 1/M\d.* -> m3

m3
 ^\s+Serial number\s+:\s+${SN} -> lldp

lldp
 ^${UPDEVICE}\s+${LOCALPORT}\s+${UPPORT} -> Continue
