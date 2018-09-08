# Dev Environment Configuration

This is my repository of resources to help set up my dev environment. The
primary goal of this repo is to store my various dotfiles and similar
configuration files, but it also serves as a home for some simple and helpful
notes on configuration bits that I have to re-learn every time I set up a new
computer.

Note: This repo currently only has my Mac configuration. I hope to add more as
      I get around to it.


## Getting Started

The hope is to automate the environment configuration process as much as
possible. To that end, the main configuration interface is the `setup.sh`
script in the root of the directory. Simply run that script with a single
command line argument specifying your operating system (it currently only
supports Mac, specified by `macosx`) and you'll be off to the races. Note that
the Mac configuration process *does* assume that you're using
[iTerm2](https://www.iterm2.com/), so you'll have to download that first.
