---
layout: default
---

# `Posts` extension

The `Posts` extension scans pages within a particular subtree
of your site, and if they match the format of `YYYY-MM-DD-post-title`,
they are registered as blog posts, and slightly manipulated.

## Install

To use the `Posts` extension, simply configure it into your `_ext/pipeline.rb`
file.

    Awestruct::Extensions::Pipeline.new do
      extension Awestruct::Extensions::Posts.new( '/news', :posts ) )
    end

### Parameters

The constructor takes up to 2 parameters.  The first specifies a 
sub-tree to scan, and defaults to the empty string. The prefix
you specify should not end with a slash.

The second parameter is the name of the property upon `site` the
resulting collection of pages should be assigned to.  By default
the assign-to property is `posts`.

## Details

Any page identified as a post will, at render time, have the following
properties added or manipulated:

Property          | Description
:-----------------|:---------------------|
`page.next_XXX` | Points to the next most recent post page, or `nil`  if the current page is the latest post |
`page.previous_XXX` | Points to the previous most recent page, or `nil` if the current page is the oldest post |
`page.date`  | A `Time` object encoding the date from the path |
`page.output_path`  | Adjusted to use directory layouts for the path segments representing date parts |
`page.content` | Provide the rendered content of the page, without any layout applied.  Normally only used for providing summaries |

The navigational `next_XXX` and `previous_XXX` properties are named
after the singular form of the assignment property.  By default,
since the assignment property is `posts`, these properties end up
being named `next_post` and `previous_post`.

These properties point to the actual page object for these other posts.
As such, you can directly reference their `url`, `title` or other 
properties you've set upon them.

For instance, in a given post, you can provide navigational links:

    - if page.next_post
      %a{:href=>page.next_post.url} Next: \#{page.next_post.title}

## Usage

From within any template, the assigned property is available from the
`site` object, and provides an array to access all pages that are categorized
as posts.  

To create a "latest news" type of page, you could have a template such as

    - for post in site.posts
      .post
        %h1 
          %a{:href=>post.url}= post.title
        %h2 
          = post.date.strftime( '%d %B %Y' )
        .content
          = post.content


## See also

* [`Atomizer` Extension](/extensions/atomizer/) to automatically create Atom feeds.
* [`Paginator` Extension](/extensions/paginator/) to automatically paginate collections of items, such as blog posts.
