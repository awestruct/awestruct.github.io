---
title: Sitemap Extension
layout: default
---

# `Sitemap` extension

The `Sitemap` is normally one of the last extension in a pipeline, if used.
It will generate a `/sitemap.xml` file which may be fed to search engines
for better SEO.

It simply scans all the pages in your site and generates your sitemap for you.
`Sitemap` will ignore images, css, javascript, `robots.txt`, and `.htaccess` files.
If there are URLs on your site that are not handled by awestruct, for example
URLs that are managed with `.htaccess RewriteRule`s, you can add those in
`_config/sitemap.yml` as shown.

    ---
    pages:
      - 
        url: /2x/builds/html-docs/
        change_frequency: daily
        priority: 1
      -
        url: /1.1.x/builds/html-docs
        change_frequency: monthly
        priority: 0.5

Values for `change_frequency` and `priority` should correspond to those
allowed in the [sitemap protocol](http://www.sitemaps.org/protocol.html).

As with the sitemap protocol, `priority` for your pages defaults to 0.5.
You may set this, and the `change_frequency` value in the front matter
for each page or template. If set in the template, all pages rendered with
that template will be affected. The default for `change_frequency` is `never`.

## Install

To use the `Sitemap` extension, simply configure it into your `_ext/pipeline.rb`
file.
    
    Awestruct::Extensions::Pipeline.new do
      extension Awestruct::Extensions::Sitemap.new
    end


NOTE: If you use the `indexifier` extension, you should ensure that the
`sitemap` extension appears after `indexifier` in your `_ext/pipeline.rb`

