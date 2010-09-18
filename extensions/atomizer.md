---
title: Atomizer Extension
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

### Parameters

    Atomizer.new( var_name, output_path )

Name | Description |
-----|-------------|
`var_name` | Name of property on `site` to act as source of posts, typically an array 
`output_path` | Path to emit the resulting Atom feed 

## Feed items

Items fed to the `Atomizer` extension must meed some criteria
in terms of properties returning data:

Property | Description |
---------|-------------|
`title`  | Title of the entry 
`date`  | Date of the entry 
`author` | Either a simple string, or an object providing `name` and `email` properties 
`content` | The full content of the entry (HTML is allowed) 

## See also
* [`Posts` extension](/extensions/posts/) for making a site "blog-aware"
