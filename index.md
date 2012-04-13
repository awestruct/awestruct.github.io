---
layout: default
title: home
---
<div class="page-header">
<h1>Are you { :awestruct } yet?</h1>
</div>

*Awestruct* is a framework for creating static HTML sites.  It's inspired
by the awesome [Jekyll](http://github.com/mojombo/jekyll) utility in the
same genre.

The goal of *Awestruct* is to make it trivially easy to bake out non-trivial
static websites using tools like [Compass](http://compass-style.org/),
[Markdown](http://daringfireball.net/projects/markdown/syntax) and
[Haml](http://haml-lang.com/), as well as common frameworks like Twitter
Bootstrap and Blueprint.

The core concept of Awestruct is that of structures, specifically Ruby
`OpenStruct` structures. The struct aspect allows arbitrary, schema-less data
to be associated with a specific page or the entire site.

Site-specific data is automatically loaded from simple YAML files, while data
can be provided on pages using a front-matter prolog.


