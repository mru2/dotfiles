#!/usr/bin/env sh

# Terminate exiting instances
killall -q polybar

# Wait until shutdown
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch bar
polybar topbar
