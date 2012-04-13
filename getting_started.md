---
layout: default
title: getting started
---

# Getting Started

## Install awestruct and start a new project

*awestruct* is available through [rubygems](http://rubygems.org/gems/awestruct).

    $ gem install awestruct

Create a new empty directory, and run `awestruct` with the `--init`
parameter.  Optionally pick a supported framework with the `--framework`
option. 

    $ mkdir myproj
    $ cd myproj
    $ awestruct --init --framework blueprint

## Edit, save, reload, repeat

`awestruct` provides a simple server to make viewing your site during
development easier.  Your site will auto-rebuild as you change source files.

    $ awestruct --dev

Then just browse to [http://localhost:4242/](http://localhost:4242)
