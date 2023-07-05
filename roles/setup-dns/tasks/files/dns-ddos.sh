#!/bin/bash
(( usage = $(top -b -n 1 -d 1 -p $(pgrep -x unbound) | tail -1 | awk '{print $9}' | cut -f1 -d ".") ))
if (( $usage > 35 )); then
  sudo service unbound restart &
fi