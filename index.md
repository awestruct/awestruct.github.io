---
layout: default
title: home
---
# Are you *awestruct* yet?

*Awestruct* is a framework for creating static HTML sites.  It's inspired
by the awesome [Jekyll](http://github.com/mojombo/jekyll) utility in the
same genre.

Additionally, *Awestruct* integrates [Compass](http://compass-style.org/),
[Markdown](http://daringfireball.net/projects/markdown/syntax) and [Haml](http://haml-lang.com/).

The core concept of *Awestruct* is that of _structures_, specifically
Ruby `OpenStruct` structures.  The struct aspect allows arbitrary,
schema-less data to be associated with a specific page or the entire
site.

Site-specific data is automatically loaded from simple YAML files, 
while data can be provided on pages using a _front-matter_ prolog.

The goal of *Awestruct* is to make it trivially easy to bake out
non-trivial static websites. In addition to providing template-driven
site creation (using *Haml*), *Awestruct* provides facilities for
easily priming the site creation with additional non-page data.

Within each template, the `site` variable provides access to any
non-page data loaded from YAML files.  The `page` variable contains
any page-specific data loaded from the front-matter or other
sources.

![Structs](/images/structs.png)

Additionally, *Awestruct* allows for recursive layouts, to allow
building variation into sites in a consistent manner.
