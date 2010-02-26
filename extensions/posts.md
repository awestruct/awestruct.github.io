---
layout: default
---

# `Posts` extension

The `Posts` extension scans pages within a particular subtree
of your site, and if they match the format of `YYYY-MM-DD-post-title`,
they are registered as blog posts, and slightly manipulated.

Any page identified as a post will, at render time, have the following
features:

* `page.next` will point to the next (more recent) post, or `nil` if 
the current page is the latest post.
* `page.previous` will point to the previous (older) post, or `nil`
if the current page is the earliest post.
* `page.date` will be a `Time` object encoding the date from the path
* `page.url` will be adjusted to use directory layouts for the path segments
representing date parts.
* `page.content` will provide the rendered content of the page, without
any layout applied.  Normally only used for providing summaries.

These properties point to the actual page object for these other posts.
As such, you can directly reference their `url`, `title` or other 
properties you've set upon them.

For instance, in a given post, you can provide navigational links:

    - if page.next
      %a{:href=>page.next.url} Next: \#{page.next.title}

## Install

To use the `Posts` extension, simply configure it into your `_ext/pipeline.rb`
file.
    
    Awestruct::Extensions::Pipeline.new do
      extension Awestruct::Extensions::Posts.new( '/news' ) )
    end

