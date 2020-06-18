# Intro to Git

## Setup

Ensure that [Homebrew](https://brew.sh) is already installed.

    make deps

## Building

    make

## Presenting

    make open

You may need to reload and you can only have one session running. You could
alternatively run `miniserve` in the background with

    miniserve . -p 8080 &

Ports suck so you're on your own for choosing a port if 8080 has something else
running on it.
