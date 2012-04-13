---
title: template context
layout: default
---

<div class="page-header">
<h1>Template Context</h1>
</div>

A few root objects are available within any of the supported template types.

## `content`

The `content` object is primarily used from within layouts, as it holds
the content from the previously rendered page or content.  

## `site`

The `site` object is the top-level object available within the template.  
Various [extensions](/extensions/) may add additional properties to this 
object.  By default, it has the following:

### `site.base_url`

Default this is set to `http://localhost:4242`.  Through the `_config/site.yml`
file, you may override this value to the URL of your product site, for instance.
Normally this is not required, except when creating fully-qualified URLs, which is
rare.

### `site.pages`

From the `site` object, you have access to the array of registered pages. All
struct-based meta-data for each page is directly accessible (and alterable)
from it.  See the section on `page` below for more details.

    site.pages.each do |page|
      puts "page.title=\#{page.title}"
      puts "page.layout=\#{page.layout}"
    end

When templates are interpreted, changes to this array are undefined.  Before the
rendering phase, extensions may add/remove pages within this array, or alter details
on the individual pages themselves.

## `page`

The `page` object is set to the struct for each page in turn, during processing.
It provides access to any properties set in the front-matter, along with
other properties used by the engine or extensions.

### `page.url`

The `url` property of each page provides a _relative_ URL from the root of the site
for accessing the page. The URL may or may not directly match the output file.

For instance, any path that ends with `/index.html` will not include the `index.html`
portion in the resulting URL.

This allows for the top-level page of the site (`/index.html`) to have a URL of simply `/`.
The same rule applies for any directory's `index.html`.

### `page.layout`

Normally set through a page's front-matter, the `layout` property is used by the 
engine to recursively surround page content with a layout.  Any layout 
may also specify a layout for itself to use, until some end is reached.

The `layout` property should reference the *simple name* of the layout.

A page `index.html.haml` wanting to use the layout from `_layouts/default.html.haml`
should simply specify front-matter such as

    ---
    layout: default
    ---

The correct layout extension (`.html`) will be selected based upon the page's
own extension.

## Additional helpers

Additional [helpers may be configured into the pipeline](/helpers/).
