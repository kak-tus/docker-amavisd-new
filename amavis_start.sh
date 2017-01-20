#!/usr/bin/env sh

if [ "$AMAVIS_SERVICE" = "daemon" ]; then
  consul-template -config /etc/amavis.hcl &
  child=$!
elif [ "$AMAVIS_SERVICE" = "cron" ]; then
  crond -f &
  child=$!
fi

trap "kill $child" INT TERM
wait "$child"
