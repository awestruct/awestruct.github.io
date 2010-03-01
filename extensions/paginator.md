---
title: Paginator Extension
layout: default
---

# `Paginator` extension

The `Paginator` extension allows rendering of a page template against
portions of a collection.  For instance, you might render your blog
posts on a page, 10 at a time.  The `Paginator` extension makes this possible.

## Install

To use the `Paginator` extension, simply configure it into your `_ext/pipeline.rb`
file.
    
    Awestruct::Extensions::Pipeline.new do
      extension Awestruct::Extensions::Paginator.new( :posts, '/news/index', :per_page=>5 )
    end

### Parameters

    Paginator.new( var_name, input_template, opts={} )

Parameter | Description |
----------|-------------|
`var_name` | Name of variable to paginate from `site` into each `page` |
`input_template` | Simple path (without extension) to template  to use for each page |
`opts`  | Options for pagination and linking (see below) |

#### Options

Available options are

Option | Default | Description |
-------|--------:|-------------|
`per_page` | 20 | Items per page |
`window_size` | 2 | Number of pages to display on either side of first, last, and current page when drawing links |

## Pagination

### Data Slicing

The data to paginate is retrieved from the `site` object, using the `var_name`
provided in the configuration.  

The first parameter to the extension is the name of a property from the
`site` object.  If you've used the [Posts extension](/extensions/posts) 
to place the posts into `site.posts`, then you would specify `:posts`
as the name to paginate.

The extension slices the data from the `site` object based upon `opts[:per_page]`,
and assigns the resulting slices to `page` object under the same name.

![Slicing](/images/paginator.png){:.centered}

### Page association

The second parameter, specifying the simple name of the template to use,
is then injected into the site, once for each slice produced by the 
behavior described above.

The first page injected into the site will match the name of the input
template, with the appropriate output extension.  Subsequent pages, 
if necessary, will be named `page1.html`, `page2.html` etc.

![Slicing](/images/pagination_template.png){:.centered}

### Pagination Templates

Since the `Paginator` extension adds additional properties to the `page`
object, templates may take advantage of this fact to render more robust
pages.

While the slice of objects assigned to the `page` is primary an array,
it has additional properties to aid in rendering of the page.

Property | Type | Description |
---------|-----:|-------------|
`next_page` | *Page* | Reference to the next page in the pagination sequence, or `nil` |
`previous_page` | *Page* | Reference to the previous page in the pagination sequence, or `nil` |
`current_page` | *Page* | Reference to the current page (should be equal to `page`) |
`current_page_index` | integer | 0-based index of the current page in the pagination sequence |
`pages` | Array of *Page* | The full sequence of pagination pages |

It also provides a single extra method to draw pagination links for navigating
through the sequence of pages.

Method | Result | Description |
-------|--------|-------------|
`pagination_links` | String of HTML | An HTML string including page navigation links |

## Example

Assuming you've configured the pipeline as:

    Awestruct::Extensions::Pipeline.new do
      extension Awestruct::Extensions::Posts.new( '/news', :posts )
      extension Awestruct::Extensions::Paginator.new( :posts, '/news/index', :per_page=>5 )
    end

Pages under `/news/**` matching the date-based file-naming scheme will be considered
to be blog posts, and made available as `site.posts`

In turn, the paginator will examine `site.posts` and slice it into chunks of 5,
assigning each slice to a new page.  The new pages are fed from the site template
that matches `/news/index.html.haml` or other appropriate extension.

The first generate page will be `/news/index.html`.  The second, if required will
 be `/news/page2.html` and so on.

The `/news/index.html.haml` template may look akin to

    - for post in page.posts
      .post
        %h1
          %a{:href=>post.url}= post.title
        .content
          = post.content

    = page.posts.pagination_links

## See also

* [`Posts` Extension](/extensions/posts/) to have something to paginate
      









