---
title: Tagger Extension
layout: default
---

# `Tagger` Extension

The `Tagger` extension allows organizing site content based upon
`tags` meta-data in page prefixes.

## Install

To use the `Tagger` extension, simply configure it into your `_ext/pipeline.rb`
file.
    
    Awestruct::Extensions::Pipeline.new do
      extension Awestruct::Extensions::Tagger.new( :posts, 
                                                   '/index', 
                                                   '/blog/tags', 
                                                   :per_page=>10 )
    end

### Parameters

    Tagger.new( collection_name, input_path, output_prefix, options={} )

Name | Description |
-----|-------------|
`collection_name` | Name of property on `site` to act as source of tagged pages, typically an array 
`input_path` | Path to page to enumerate tagged items
`output_prefix` | Path prefix to emit the resulting tag pages
`options` | Additional options hash to be passed to an internal [`Paginator`](/extensions/paginator/)

Given the configuration of:

      extension Awestruct::Extensions::Tagger.new( :posts, 
                                                   '/index', 
                                                   '/blog/tags', 
                                                   :per_page=>10 )

The extension will scan `site.posts` for every item with a `tags` attribute.
For each observed tag, a structure is created with the following behaviour

These structures will be sorted by popularity, trimmed to the top 100 tags,
and placed into `site.posts_tags` as an ordered array.  This array


Method | Description|
-------|------------|
`to_s`        | The seen tag 
`primary_page` | First page in this tag's index collection  
`pages`  | All pages with the tag 
`group`  | Which group is this tag in terms of popularity 

From this analysis, the extension will create a paginated index for
each of the top 100 tags.  The `input_path` page denotes which page should
be used to iterate the tag's page collection. 

The `page.posts` collection, in this case, will hold the page's worth
of posts with a given tag.

The indexes will be output under the `output_prefix` directory.

To draw a full tag-cloud, the [TagCloud extension](/extensions/tag_cloud/) should be used. 



## See also
* [`TagCloud` extension](/extensions/tag_cloud/) for making a cloud from tagged items
* [`Posts` extension](/extensions/posts/) for making a site "blog-aware"
