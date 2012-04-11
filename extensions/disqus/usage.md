
### Configure `_config/site.yml`

Your `_config/site.yml` needs to include the property `disqus`
with your account short name. If you are working on a site
which is not accessible from the internet, but still want to
be able to test the Disqus comment system, be sure to set
the boolean `disqus_developer` property to `true`.

Property | Description
:--------|:-----------|
`disqus` | The short name for your Disqus account
`disqus_generate_id` | Setting this property to `true` tells the extension to automatically generate a [Disqus identifier](http://docs.disqus.com/help/14/) as an MD5 digest of the post's date and slug. If this property is not defined, or `false`, the post will only be identified by its fully-qualified URL.
`disqus_developer` | Setting this property to `true` allows Disqus to load when you are running the site locally (or on a domain which is not accessible from the public internet)

Enabling `disqus_generate_id` is recommended so that the comments are not tied
to the post's URL, but rather its signature, thus simplifying migration.

If you are using [multiple profiles](/profiles), you should set
this properties per profile so that, for instance, you don't
comments on your staging site with comments on your production
site.

Here's an example of how you might configure these properties when
using multiple profiles:

    profiles:
      development:
        base_url: http://localhost:4242
        disqus: mysite-development
        disqus_developer: true
      staging:
        base_url: http://staging.mysite.com
        disqus: mysite-staging
      development:
        base_url: http://mysite.com
        disqus: mysite
        disqus_generate_id: true

### Use `page.disqus_comments`

This will emit the javascript necessary to provide Disqus comment
integration for the comments for the target page. Typically this
should only be used once per page (though it can be used multiple
times if you set the [Disqus Identifier](http://docs.disqus.com/help/14/)).

    .content
      = page.content
    .comments
      = page.disqus_comments 

### Use `page.disqus_comments_link`

This will emit the javascript necessary to provide Disqus comment
links for the target page. (You can control the text that is emitted
from the Disqus admin console for the site).

    .byline
      = page.disqus_comments_link
    .content
      = page.content
    .comments
      = page.disqus_comments 

You can also invoke this method for each post on a master aggregator
(or index) page. In this case you refer to the method from the
iteration variable (e.g., `post`). You can even call it multiple times
per post (for instance in the header and the footer).

    - for post in site.posts
      .post
        .byline
          = post.disqus_comments_link
        .abstract
          = post.abstract
        .footer
          = post.disqus_comments_link

If you want the link to include comment and reaction counts, make sure
to call the `page.disqus_comments_count` method on the page.

### Use `page.disqus_comments_count`

This will emit the javascript necessary to provide comments and
reactions counts on the comment links. Call this anywhere on the
page below all posts, preferrably as close to the end body tag
as possible.

    = page.disqus_comments_count

### Enable conditionally

Since Disqus loads comments from the internet, you may want to
disable it altogether in development. You can do that by leaving
the `disqus` property unset in your development profile and
using a conditional statement in the page template.

    .content
      = page.content
    .comments
      - if site.disqus
        = page.disqus_comments 

