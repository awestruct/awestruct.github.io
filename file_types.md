---
title: Template types
layout: default
---

<div class="page-header">
<h1>File Types</h1>
</div>

## Interpolation

In previous versions of awestruct interpolation was turned on, starting with version 0.5.5 it has been turned off by default to improve generation performance.
If you wish to turn it back on, you can do so at the site level by adding

    interpolate: true

to the _config/site.yml file. Or you can turn it on for an individual page by including the above line in the front matter of that file.

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

### AsciiDoc (`.adoc`)

AsciiDoc files are interpreted anywhere within the site tree.

The `.adoc` extension will be replaced by `.html` by default.

NOTE: Apart from the extension `.adoc`, files with the extensions `.asciidoc` and `.ad` are also interpreted as AsciiDoc files.

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

### Exclusions

*Awestruct* will ignore any file or folder listed in the optional `.awestruct_ignore` file located at the root of the project.


### Everything else (`*.*`)

Any unrecognized file will simply be copied over to the output tree.

