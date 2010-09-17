---
title: Indexifier Extension
layout: default
---

# `Indexifier` extension

The `Indexifier` is normally the last extension in a pipeline, if used.

It simply scans all pages in the site for HTML pages ending *not* with `index.html`.
When it finds matching pages, it replaces it's output path with one that uses a
directory of the same name, and an `index.html` page.

For instance, a page with a path of `/faq.html` will be altered by the `Indexifier`
to produce a page at `/faq/index.html`.

This extension works on the assumption that your webserver will serve any `index.html` 
file automatically, so by moving pages into directories, the resulting URLs are cleaner.

## Install

To use the `Indexifier` extension, simply configure it into your `_ext/pipeline.rb`
file.
    
    Awestruct::Extensions::Pipeline.new do
      extension Awestruct::Extensions::Indexifier.new
    end

