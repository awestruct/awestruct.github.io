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
      extension Awestruct::Extensions::Atomizer.new( 
      	:posts, 
      	'/news.atom', 
      	:blog_title=>'Awesome Blog Inc.' 
      )
    end

### Parameters

    Atomizer.new( var_name, output_path, opts={} )

Name | Description |
-----|-------------|
`var_name` | Name of property on `site` to act as source of posts, typically an array 
`output_path` | Path to emit the resulting Atom feed 
`opts` | Options for pagination and linking (see below)

#### Options

Available options are

Option | Default | Description
-------|--------:|-------------|
`num_entries` | 50 | Number of most recent entries rendered in the atom feed 
`blog_url` | `site.base_url` | Blog URL used to set the `id` element in the atom feed - you might want to use your actual blog URL like `http://example.com/blog`
`blog_title` | `site.title` or if unset `site.base_url` | Blog title in the feed

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
