---
title: DataDir Extension
layout: default
---

# `DataDir` Extension

The `DataDir` extension loads each directory of renderable files
under `_data/` as a map attached to the `site` object.

For instance, the following layout:

    _data/
      team/
        bob.md
        jim.md

would result in a map at `site.team` with the value of

    {  :bob=><page for bob.md>,
       :jim=><page for jim.md> }

The rendered page content (without layout) and the page
data may be access from any other page.

    \#{site.team[:bob].name}
    \#{site.team[:bob].content}

## Install

To use the `DataDir` extension, simply configure it into your `_ext/pipeline.rb`
file.
    
    Awestruct::Extensions::Pipeline.new do
      extension Awestruct::Extensions::DataDir.new
    end

### Parameters

    DataDir.new( data_dir='_data' )

Name | Description |
data_dir | Directory containing data directories, defaults to `_data/` 


