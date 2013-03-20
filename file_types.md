---
title: template types
layout: default
---

<div class="page-header">
<h1>File Types</h1>
</div>

## Pages

Page-based templates (Haml, ERB and Maruku) provide normal templating in either
a powerful DOM-based method, or a cleaner, simpler markup method.

All types allow for *front-matter*, to set properties (or meta-data) on
the page.  Properties set through the front-matter are sometimes used by the
engine, are available within the page itself, and even usable within any
layout triggered by the page.

Front-matter is delineated with two lines of 3 dashes each.  Between the
dashed lines, a YAML hash should be defined.
 
For instance, a page `fancy_page.md` might look like this:

    ---
    title: My fancy page
    author: Bob McWhirter
    layout: default
    ---

    # How I spent my summer vacation

See [the documentation on the template context](/template_context/)
for information on using these properties within your pages.

### Haml (`.haml`)

Haml files are interpreted anywhere within the site tree.

Haml files should have double-extension, as the `.haml` extension
will simply be removed by default.

To produce a file `index.html`, the Haml source file should be
named `index.html.haml`.  This allows for non-HTML generation,
such as for XML or other file types.

### ERB (`.erb`)

ERB files are interpreted anywhere within the site tree.

ERB files should have double-extension, as the `.erb` extension
will simple be removed by default.

To produce a file `index.html`, the ERB source file should be
named `index.html.erb`.  This allows for non-HTML generation,
such as for XML or other file types.

### Markdown (`.md`)

Markdown files are interpreted anywhere within the site tree.

The `.md` extension will be replaced by `.html` by default.

The engine will interpolate the Markdown source as a typical
Ruby `String`, allowing for expressions such as

    # This is the \#{page.title}

### Org-mode (`.org`)

[Org-Mode](http://orgmode.org/) files should *not* include the `.html` secondary
extension.  Simply name your file `mything.org` and not
`mything.html.org`.

Org-mode support is new, and fairly untested.

## Stylesheets

### Scss & Sass (`.scss` and `.sass`)

Scss and Sass templates are interpreted, within the context of the Compass
framework, anywhere within the site tree.

The `.scss` and `.sass` extensions will be replaced with `.css` by default.

### CSS (`.css`)

Any CSS file will be copied verbatim into the output tree.

## Other

### YAML (`.yaml`)

While not strictly a template type, YAML files will
be processed within the `_config/` directory, and added
to the `site` variable available within templates.

### Dot and underscore files (`.*` and `_*`)

All files starting with a dot (`.`) or an underscore (`_`) will be
ignored during procesing, with one exception (see below).

### `.htaccess`

It's often useful to maintain an `.htaccess` file for Apache along
with your site, for configuring items such as `ErrorDocument` or
rewrite rules.  

For this reason, *Awestruct* will include `.htaccess` access files
when generating the output tree.

### Everything else (`*.*`)

Any unrecognized file will simply be copied over to the output tree.

