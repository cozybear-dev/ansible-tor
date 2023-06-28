#! /bin/bash
(( usage = $(top -b -n 10 -d 1 -p $(pgrep -x unbound) | tail -1 | awk '{print $9}') ))
if (( usage > 35 )); then
  service unbound restart
fi