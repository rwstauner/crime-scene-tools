[![docker hub](https://img.shields.io/badge/docker-crime--scene--tools-blue.svg)](https://hub.docker.com/r/rwstauner/crime-scene-tools)
[![Build Status](https://travis-ci.org/rwstauner/docker-crime-scene-tools.svg?branch=master)](https://travis-ci.org/rwstauner/docker-crime-scene-tools)

# Crime Scene Tools

A collection of the tools used in the book
[Code as a Crime Scene](https://pragprog.com/book/atcrime/your-code-as-a-crime-scene).

- [Code Maat](https://github.com/adamtornhill/code-maat)
- [Some python scripts](http://www.adamtornhill.com/code/crimescenetools.htm)
- [Cloc](http://cloc.sourceforge.net/)

Scripts are in `bin/` (which is added to `$PATH` in the docker image).

## Available commands

Available commands can be seen with `help`:

    $ docker run crime-scene-tools help
    available commands:
      complexity_analysis
      cst
      csv_as_enclosure_json
      csv_main_dev_as_knowledge_json
      git-maat-log
      git_complexity_diff
      git_complexity_trend
      git_proximity_analysis
      maat
      merge_comp_freqs

- `complexity_analysis`
    Calculates whitespace complexity of the given file.

- `cst`
    A wrapper that ensures `bin/` is at the front of `PATH`
    (useful in an interactive shell or outside of docker)

- `csv_as_enclosure_json`
    Generates a JSON document suitable for enclosure diagrams.

- `csv_main_dev_as_knowledge_json`
    Generates a JSON document suitable for knowledge diagrams.

- `git maat-log`
    `git log` formatted for consumption by `maat`

- `git_complexity_diff`
    Calculates whitespace complexity trends over a range of revisions.

- `git_complexity_trend`
    Calculates whitespace complexity trends over a range of revisions.

- `git_proximity_analysis`
    Calculates proximity of changes recorded in the revision history.

- `maat`
    This is Code Maat, a program used to collect statistics from a VCS.

- `merge_comp_freqs`
    Require one CSV file with frequencies and one with the complexity.
