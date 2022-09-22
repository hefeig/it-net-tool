Value HOSTNAME (\S+)
Value MODEL (\S+)
Value List LOCALPORT ([A-Za-z\-]+\d+\/\d+(\/\d*)*)
Value List UPPORT (([A-Za-z\-]+\d+\/\d+(\/\d*)*|\w+))
Value List UPDEVICE (\S+(LF|CO|SP|DI|EX)\S+)
Value VERSION (.*)
Value List SN ([A-Za-z\d]+)


Start
 ^.*<${HOSTNAME}>display lldp neighbor brief -> lldp

lldp
 ^${LOCALPORT}\s+${UPDEVICE}\s+${UPPORT}\s+\d+ -> Continue
 ^.*display version -> version

version
 ^VRP\s+\(R\)\s+software.*Version.*\(${VERSION}\)
 ^HUAWEI\s+${MODEL}\s+.*uptime.*weeks.*days.*hours.*minutes -> Continue
 ^HUAWEI\s+${MODEL}\s+.*uptime.*weeks.*day.*hour.*minutes
 ^.*display device ma -> device

device
 ^\d+\s+-\s+${SN}\s+\S+
