---
layout: default
title: IntenseDebate Extension
---

# IntenseDebate Integration

[IntenseDebate](http://intensedebate.com/) is a Javascript-based commenting system,
which is perfect for static websites.

## Install

To use the IntenseDebate integration, you simply need add a helper to the
pipeline in your `_ext/pipeline.rb` file.  


    Awestruct::Extensions::Pipeline.new do
      helper Awestruct::Extensions::IntenseDebate
    end

## Configure

Your `_config/site.yml` needs to include the property `intense_debate_acct`
with your account identifier.

Property | Description |
---------|----------------------------------------------------------|
intense_debate_acct | The identifier for your IntenseDebate account |

## Use the extension

On your pages you want to enable with comments, simply use the Haml helper
of `intense_debate_comments`.  This will emit all the appropriate Javascript
to set up comments.  Typically this will be done on the layout you use
for your blog entries.

    .content
      = post.content
    .comments
      = intense_debate_comments 
