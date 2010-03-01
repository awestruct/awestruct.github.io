---
layout: default
title: Google Analytics Extension
---

# Google Analytics Integration

[Google Analytics](http://google.com/analytics/) is a website traffic monitoring tool.

## Install

To use the Google Analytics integration, you simply need add a helper to the
pipeline in your `_ext/pipeline.rb` file.  


    Awestruct::Extensions::Pipeline.new do
      helper Awestruct::Extensions::GoogleAnalytics
    end

## Configure

Your `_config/site.yml` needs to include the property `google_analytics`
with your account identifier.

Property | Description |
---------|----------------------------------------------------------|
google_analytics | The identifier for your Google Analytics profile |

## Use the extension

On pages you wish to track with Google Analytics, simply use the `google_analytics`
helper.  Typically this may be done in the lowest-level layout, such as `base.html.haml`


    %body
      ~ content
      = google_analytics
