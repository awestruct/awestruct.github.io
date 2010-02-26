---
layout: default
title: layout
---
# Project layout

## Project Files & Directories

### Files

Any typical file, starting at the top of your site tree, may be interpretted
as a [template](/file_types/). Any unrecognized file type will be copied
verbatim to the output tree.

Any file or directory whose first character is an underscore (`_`) will be ignored.
All files starting with a dot (`.`) will likewise be ignored, except for any file
named `.htaccess`, which will be copied verbatim into the output tree.

### `stylesheets/`

The `stylesheets/` directory may be initially populated by Compass, and may
be used by the site to store either `.css` or `.sass` files.  Straight CSS 
will be copied verbatim to the output tree, while Sass files will be interpolated
through the Compass-enabled Sass engine.

### `images/`

### `javascripts/`

## Special Files & Directories

### `_layouts/`

The `_layouts/` directory contains Haml templates to be used as layouts (or skins)
for content pages.

Layouts should be named using double extensions, indicating the output type of the layout.
The base extension will be used in locating layouts referenced from pages.

For instance, a page named `index.html.haml` specifying a layout of `default` (without 
extension), the file `_layouts/default.html.haml` will be used.

Another page, named `news.xml.haml` specifying a layout of `default` (without extension)
would be wrapped in the layout in `_layouts/default.xml.haml`.

### `_config/`
  
Directory containing site-specific state in the form
of YAML files.

Each YAML file is loaded, converted into an `OpenStruct`-based
tree as much as possible, and assigned to a similarly-named
property on the `site` variable.

For instance, if you had a a file `_config/authors.yml` with the 
following contents

    - name: Bob McWhirter
      email: bob@mcw...
    - name: Rebecca McWhirter
      email: rebecca@mcw...

Then from within templates, `site.authors` would provide access 
to an `OpenStruct`-converted tree of information.  This allows
templates such as

    - for author in site.authors
      .author
        \#{author.name} can be reached via \#{author.email}

### `_config/site.yml`

Unlike all other YAML files, the contents of `site.yml` are
added directly to the `site` object.  One property, `base_url` 
is always available, and defaults to `localhost`. 

### `_ext/`

Directory containing site-specific Ruby extensions.  This
directory is automatically added to the `$LOAD_PATH`.

### `_ext/pipeline.rb`
  
File defining the pre-render pipeline of extensions.  Extensions
are executed, in order, and provided the `site` variable.

### `_site/`

The generated files are placed under the `_site/` directory.
When you use `--server` mode, the server simply serves from
this directory.
