---
title: Skins
layout: default
---

<div class="page-header">
<h1>Shared Skins</h1>
</div>

Awestruct supports the concept of shared skins as the basis of multiple
sites within a similarly-designed family.

## Configuration

Within `_config/site.yml` a `skin_dir` property may be set.  It should
point to a relative directory containing a base awestruct project, known
as the skin.

The skin project may contain an `_ext/pipeline.rb` which will be appended
to the project's own.  Additionally, the skin's `_layouts` directory
is made available, but layouts contained within may be overridden by
similarly-named layouts contributed by the actual project.

Pages within a skin project also contribute to resulting rendered site.

A skin may use the [Partial helper](/helpers/partial) to allow
a leaf project to insert partial page fragments into a layout 
specified by the skin.
