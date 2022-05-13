#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run picom
run nm-applet

# Start connection to protonvpn
run protonvpn-cli c -f
