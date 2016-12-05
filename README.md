[![docker hub](https://img.shields.io/badge/docker-crime--scene--tools-blue.svg)](https://hub.docker.com/r/rwstauner/crime-scene-tools)
[![Build Status](https://travis-ci.org/rwstauner/docker-crime-scene-tools.svg?branch=master)](https://travis-ci.org/rwstauner/docker-crime-scene-tools)

# Crime Scene Tools

A collection of the tools used in the book
[Code as a Crime Scene](https://pragprog.com/book/atcrime/your-code-as-a-crime-scene).

- [Code Maat](https://github.com/adamtornhill/code-maat)
- [Some python scripts](http://www.adamtornhill.com/code/crimescenetools.htm)
- [Cloc](http://cloc.sourceforge.net/)

The "entrypoint" script allows for a simpler more consistent calling style:

It recognizes `maat`:

    docker run crime-scene-tools maat ...

As well as any of the python scripts:

    docker run crime-scene-tools merge_comp_freqs ...

and falls back to any other tool in the PATH:

    docker run crime-scene-tools cloc ...
