

`Sitemap` will ignore images, css, javascript, `robots.txt`, and `.htaccess` files.
If there are URLs on your site that are not handled by awestruct, for example
URLs that are managed with `.htaccess RewriteRule`s, you can add those in
`_config/sitemap.yml` as shown.

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

As your site gets more complex you may want to exclude more content from your sitemap. By
adding some configuration to the sitemap.yml you can exclude all files by extension or individual files by
their full path in the generated site.

    excluded_extensions: ['.pdf']
    excluded_files: [ '/success_form.html', '/assets/hidden-file.csv' ]

By default the following are excluded from the sitemap

    excluded_files: [ '/.htaccess', '/favicon.ico' ,'/robots.txt', ]
    excluded_extensions: ['.atom', '.scss', '.css', '.png', '.jpg', '.gif', '.js' ]

### Install

To use the `Sitemap` extension, simply configure it into your `_ext/pipeline.rb`
file.
    
    Awestruct::Extensions::Pipeline.new do
      extension Awestruct::Extensions::Sitemap.new
    end


NOTE: If you use the `indexifier` extension, you should ensure that the
`sitemap` extension appears after `indexifier` in your `_ext/pipeline.rb`


