#!/bin/bash

if [ -z "`which rabbit`" ]; then
  echo "Rabbit is not installed. Install it with 'gem install rabbit.'"
  exit 1
fi

rabbit rubocop.md 2>&1 &
#rabbiter --filter "#rubocop" 2>&1 &
