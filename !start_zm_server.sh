#!/bin/bash
_script="$(readlink -f ${BASH_SOURCE[0]})" 
## Delete last component from $_script ##
_mydir="$(dirname $_script)"
#name of the config file the server should use.
CFG=dedicated_zm.cfg
#name of the server shown in the title of the terminal window
NAME="Server 1"
#Port used by the server
PORT=4976

echo -e '\033]2;'PlutoniumT6 - $NAME - Server restart'\007'  ## edits terminal tab title. may not work in all terminals
echo "Visit plutonium.pw / Join the Discord (a6JM2Tv) for NEWS and Updates!"
echo "Server "$NAME" will load $CFG and listen on port $PORT UDP!"
echo "To shut down the server close this window first!"
printf -v NOW '%(%F_%H:%M:%S)T' -1
echo ""$NOW" $NAME server started."

while true
do
wine start /wait /abovenormal z:$_mydir/t6rzm.exe -dedicated +sv_config $CFG +net_port $PORT  ## expects t6rzm.exe to be in same directory as this script
#xvfb-run wineconsole t6rzm.exe -dedicated +sv_config $CFG +net_port $PORT #use this line instead if you are running headless
printf -v NOW '%(%F_%H:%M:%S)T' -1
echo ""$NOW" WARNING: $NAME server closed or dropped... server restarting."
sleep 1
done
