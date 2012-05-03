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

## Awestruct Concepts

The goal of *Awestruct* is to make it trivially easy to create non-trivial
static websites.  The core concept of *Awestruct* is that of _structures_,
specifically Ruby `OpenStruct` structures.  The struct allows arbitrary,
schema-less data to be associated with a specific page or the entire site.

Site data is loaded from YAML files in the `_config` directory.
Page-specific data can be provided on pages using a _front-matter_ prolog.

As your files are processed, the `site` variable provides access to any
non-page data loaded from YAML files.  The `page` variable contains
any page-specific data loaded from the front-matter or other
sources.


![Structs](#{site.base_url}/images/structs.png)

Additionally, *Awestruct* allows for recursive layouts, to allow
building variation into sites in a consistent manner.
