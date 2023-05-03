#!/bin/bash

if [ -z "`which rabbit`" ]; then
  echo "Rabbit is not installed. Install it with 'gem install rabbit.'"
  exit 1
fi

rabbit mosh.md 2>&1 &
