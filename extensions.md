---
layout: default
title: extensions
---

# Extensions

The render pipeline can be modified by including either
custom or 3rd-party extensions.

The pipeline is configured using the `pipeline.rb` file in the
`_ext/` directory.

The `_ext/` directory is automatically added to the `$LOAD_PATH`
so that site-supplied extensions may easily be loaded.

## An extension class

An extension class only need implement a single method, `execute(site)`.
Each extension in the pipeline will be called, in-order, and passed the
`site` object.

    class MyExtension
      def execute(site)

        # body goes here

      end
    end

## Configuring the pipeline

New extensions can be added to the existing `_ext/pipeline.rb` file
using the `extension` method.

    require 'my_extension'

    Awestruct::Extensions::Pipeline.new do
      extension MyExtension.new
      extension Awestruct::Extensions::Posts.new( 'news' ) 
      extension Awestruct::Extensions::Indexifier.new
    end

## The processing chain

The extension pipeline runs immediately before the final URL assignment
to pages and generating the final output pages.

![The process](/images/process.png){.centered}

Given the timing of the extension pipeline execution, advanced functionality
can be applied.  Pages can be added or removed, output locations can be changed,
and links between pages or YAML-based structures may be created.

## Possibilities

Since the extension pipeline runs before the final render stage, it has
the opportunity to do wild manipulations to the state of the site.

### Posts

The [`Posts` extension](/extensions/posts/) makes any *Awestruct* site
"blog-aware".  It scans all pages under a given sub-tree, and if they match
a particular naming convention, it does some work.

If the current output path matches the pattern of `YYYY-MM-DD-post-title`, 
it does the following:

* Adjusts `page.output_path` to use directories instead of dashes.  
`YYYY-MM-DD-post-title` becomes `/YYYY/MM/DD/post-title`.
* Adds the page to an array it makes available as `site.posts`.
* Adds navigational links between blog post pages
  * `page.next` points to the next entry
  * `page.previous` points to the previous entry

### Pretty URLs

The [`Indexifier` extension](/extensions/indexifier/) adjusts the
`page.url` for any page that is not currently output as an `index.html`.

For instance, a page with a `url` of `/stuff.html` gets
modified so that `page.output_path` returns `/stuff/index.html`.

By placing the `Indexifier` last in the chain, it can affect the
entire tree, regardless of the source of the page.

### Synthetic page generation

An extension may decide to leave all pages alone, but inject
additional synthetic pages into a site at generation time.


