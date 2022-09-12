#!/bin/bash
if [ -z "$1" ]; then
  sed 's/:/\n/g' <<< "$PATH"
else
  sed 's/:/\n/g' <<< "$1"
fi
