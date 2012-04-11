---
title: Paginator Extension
layout: default
---

### Simple Installation
    
    Awestruct::Extensions::Pipeline.new do
      extension Awestruct::Extensions::Paginator.new( :posts, 
                                                      '/news/index', 
                                                      :per_page=>5 )
    end

### Typical Usage

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

    = page.posts.links

