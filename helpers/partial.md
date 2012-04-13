---
title: Partial Helper
layout: default
---

<div class="page-header">
<h1>Partial Helper</h1>
</div>

The `Partial` helper allows you to include a partial page fragment into another
page.

## Install

To use the `Partial` helper, simply configure it into your `_ext/pipeline.rb`
file.
    
    Awestruct::Extensions::Pipeline.new do
      helper Awestruct::Extensions::Partial
    end


## Usage

The `Partial` helper makes a `partial(path)` method available within
every page.  The passed-in path argument should be full filename (with extensions)
relative to the project directory's `_partials/` directory.

    = partial( 'bottom-navigation.html.haml' )
