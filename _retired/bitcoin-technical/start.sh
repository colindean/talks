#!/bin/bash

if [ -z "`which rabbit`" ]; then
  echo "Rabbit is not installed. Install it with 'gem install rabbit.'"
  exit 1
fi

rabbit bitcoin-technical.md 2>&1 &
rabbiter --filter "#ytaets" 2>&1 &
