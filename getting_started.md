---
layout: default
title: getting started
---

<div class="page-header">
<h1>Getting Started</h1>
</div>

## Install awestruct and start a new project

    $ gem install awestruct

Create a new empty directory, and run `awestruct` with the `--init`
parameter.  Optionally pick a supported framework with the `--framework`
option. 

    $ mkdir myproj
    $ cd myproj
    $ awestruct --init --framework blueprint

## Edit, save, reload, repeat

    $ awestruct --dev

Then just browse to [http://localhost:4242/](http://localhost:4242).
Awestruct provides a simple server to make viewing your site during
development easier.  Your site will auto-rebuild as you change source files.

