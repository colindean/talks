# `make python devex`

Or , How a 45-year-old tool can `make` Python developer experience easier

## One time setup

### Homebrew

Install homebrew if you don't already have it.

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

## Install deps

    make deps

This will install a bunch of stuff. You _could_ install this stuff manually,
but it's far easier to let automation do it for you.

## Building

|Command|Effect|
|-------|------|
|`make all`| Build only the HTML file containing the presentation |
|`make open-and-serve` | Build the HTML file and open it in your browser via a server |
|`make watch` | Build if necessary and on each change, serve it up |

You'll probably want to use
`make watch` during development and
`make open-and-serve` when presenting.

