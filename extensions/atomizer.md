---
title: atomizer extension
layout: default
---

# `Atomizer` Extension

The `Atomizer` extension takes an array of blog posts, and
generates an Atom feed at the specified location.

## Install

To use the `Atomizer` extension, simply configure it into your `_ext/pipeline.rb`
file.
    
    Awestruct::Extensions::Pipeline.new do
      extension Awestruct::Extensions::Atomizer.new( :posts, '/news.atom' )
    end

