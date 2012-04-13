---
title: site.yml profiles
layout: default
---

<div class="page-header">
<h1>Site profiles</h1>
</div>

If your `_config/site.yml` file has an entry named `profiles`,
each of which is a hash of properties, those properties
may be selected en-masse to override any global property of the
same name.

## An example

    food: ham
    profiles:
      development:
      staging:
        base_url: http://staging.torquebox.org/
      production:
        base_url: http://torquebox.org/
        food: biscuit

## Usage

From the command-line tool, use the `--profile` or `-P` option to
select specific profile.  The profile's properties will be loaded
and override any globally-defined property on `site`.

In the example above, `food` will always be `"ham"` except when running the
`production` profile, where it will be `"biscuit"`.

    awestruct -P production --server --auto


<span class="label label-info">See Also</span>

[Deployment over `rsync`](/deployment/) uses site profiles.



