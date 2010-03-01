---
title: site.yml profiles
layout: default
---

# `site.yml` profiles

If your `_config/site.yml` file has an entry named `profiles`,
which itself is a hash hash of properties, those properties
may be selected en-masse to override any global property of the
same name.

## An example

    some_prop: true
    profiles:
      development:
      staging:
        base_url: http://staging.torquebox.org/
      production:
        base_url: http://torquebox.org/
        some_prop: false

## Usage

From the command-line tool, use the `--profile` or `-P` option to
select specific profile.  The profile's properties will be loaded
and override any globally-defined property on `site`.

In the above example, in all cases `some_prop` will be `true` except
for the `production` profile.

    awestruct -P production --server --auto

## See also

* [Deployment over `rsync`](/deployment/) uses site profiles.



