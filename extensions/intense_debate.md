---
layout: default
title: IntenseDebate Extension
---

# IntenseDebate Extension

[IntenseDebate](http://intensedebate.com/) is a Javascript-based commenting system,
which is perfect for static websites.

## Install

To use the IntenseDebate integration, you simply need add an extension to the
pipeline in your `_ext/pipeline.rb` file.  

    require 'intense_debate'
    
    Awestruct::Extensions::Pipeline.new do
      extension Awestruct::Extensions::IntenseDebate.new
    end

Don't forget to add the require import.

## Configure


Your `_config/site.yml` needs to include the property `intense_debate_acct`
with your account identifier.

<table>
  <thead>
    <tr>
      <th>Property</th>
      <th>Description</th>
    </tr>
  </thread>
  <tbody>
    <tr>
      <td>intense_debate_acct</td>
      <td>The identifier for your IntenseDebate account</td>
    </tr>
  </tbody>
</table>

## Use the extension

The extension adds two methods to every page within the site.

### `page.intense_debate_comments`

This will emit the javascript necessary to provide IntenseDebate comment
integration for the comments for the target page.  Typically this
should only be used once per page.

    .content
      = page.content
    .comments
      = page.intense_debate_comments 

### `page.intense_debate_comments_link`

This will emit the javascript necessary to provide simple IntenseDebate
comment links for the target page.  This is okay to invoke several
times on a master aggregator (or index) page.


    - for post in site.posts
      .post
        .abstract
          = post.abstract
        .comments
          = post.intense_debate_comments_link
