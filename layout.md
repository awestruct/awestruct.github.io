---
layout: default
title: layout
---
<div class="page-header">
<h1>Project layout</h1>
</div>

## Project Files & Directories

Any typical file, starting at the top of your site tree, may be interpreted
as a [template](/file_types/). Any unrecognized file type will be copied
verbatim to the output tree. Directories will be copied and the files within
them will be interpreted as templates, or copied verbatim if the file type
is not recognized for filtering.

Any file or directory whose first character is an underscore `_` will be ignored.
All files starting with a dot, for example, `.gitignore` will likewise be
ignored, except for any file named `.htaccess`, which will be copied verbatim
into the output tree.

### Stylesheets

The `stylesheets/` directory will contain a starter template based on the framework
specified, if any, when the project was created. Place your .css, .scss or .sass 
files in here.  Straight CSS will be copied verbatim to the output tree, while
.scss and .sass files will be interpolated through the Compass-enabled Sass engine.


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
    - name: Lance Ball
      email: lance@lan...

Then from within templates, `site.authors` would provide access 
to an `OpenStruct`-converted tree of information.  This allows
templates such as

    - for author in site.authors
      .author
        \#{author.name} can be reached via \#{author.email}

### `_config/site.yml`

Unlike all other YAML files, the contents of `site.yml` are
added directly to the `site` object.  One property, `base_url` 
is always available, and defaults to `localhost` or other 
appropriate value.

Additionally, [specific conditional profiles](/profiles/) may be defined
to affect property values easily from the commandline.

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

### `_tmp/`

A temporary directory is created for extensions to cache
things, if necessary.  It's available as `site.tmp_dir`.
