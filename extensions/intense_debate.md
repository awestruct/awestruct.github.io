---
layout: default
title: IntenseDebate Extension
---

# IntenseDebate Integration

[IntenseDebate](http://intensedebate.com/) is a Javascript-based commenting system,
which is perfect for static websites.

## Install

To use the IntenseDebate integration, you simply need to require a
file in your `_ext/pipeline.rb` file.  No other configuration is required.

    require 'awestruct/extensions/intense_debate'

## Configure

Your `_config/site.yml` needs to include the property `intense_debate_acct`
with your account identifier.

## Use the extension

On your pages you want to enable with comments, simply use the Haml helper
of `intense_debate_comments`.  This will emit all the appropriate Javascript
to set up comments.  Typically this will be done on the layout you use
for your blog entries.
