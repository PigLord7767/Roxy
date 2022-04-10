#!/bin/bash
set -e
set -o pipefail

if [[ "${KEEP_DYNO_ALIVE,,}" == "true" ]];then
    nohup python keep_alive.py >/dev/null 2>&1 &
    echo "Heroku FREE dyno will be kept alive"
else
    echo "Heroku FREE dyno will auto-sleep after 20 minutes"
fi

bin/start-nginx-solo
P1=$!
wait $P1