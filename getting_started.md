---
layout: default
title: getting started
---

# Getting Started

## Install *awestruct*

*awestruct* is available through the GemCutter repository.

    $ gem install awestruct

## Start a new project

Create a new empty directory, and run `awestruct` with the `--init`
parameter.  Optionally pick a supported Compass framework with the
`--framework` option.

    $ mkdir myproj
    $ cd myproj
    $ awestruct --init --framework blueprint

## Start editing and browsing

`awestruct` can auto-rebuild your site as you change source files.
Additionally it can provide a simple server to make viewing your
site during development easier.

    $ awestruct --auto --server

Then just browse to:

    http://localhost:4242/
