---
title: TagCloud Extension
layout: default
---

# `TagCloud` Extension

The `TagCloud` extension allows for the creation of tag clouds from
an input collection.  Often it may be used with the [`Posts` extension](/extensions/posts/)

## Install

To use the `TagCloud` extension, simply configure it into your `_ext/pipeline.rb`
file.
    
    Awestruct::Extensions::Pipeline.new do
      extension Awestruct::Extensions::TagCloud.new( :posts, '/news/tags', :layout=>'default' )
    end

### Parameters

    TagCloud.new( collection_name, output_path, options={} )

Name | Description |
-----|-------------|
`var_name` | Name of property on `site` to act as source of tagged pages, typically an array |
`output_path` | Path prefix to emit the resulting tag cloud page|
`options` | Additional options hash to set the `title` and `layout` parameters of the tag cloud page|


## See also
* [`Tagger` extension](/extensions/tagger/) for making a list of items partitioned by tags
* [`Posts` extension](/extensions/posts/) for making a site "blog-aware"
