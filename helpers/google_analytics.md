---
title: GoogleAnalytics Helper
layout: default
---

# `GoogleAnalytics` Helper

The `GoogleAnalytics` helper provides easy insertion of Google Analytics
tracking code into your site.

## Install

To use the `GoogleAnalytics` helper, simply configure it into your `_ext/pipeline.rb`
file.
    
    Awestruct::Extensions::Pipeline.new do
      helper Awestruct::Extensions::GoogleAnalytics
    end


## Configure

Your `_config/site.yml` needs to include the property `google_analytics`
with your account identifier.

Property | Description |
---------|----------------------------------------------------------|
google_analytics | The identifier for your Google Analytics site tracking |

## Use the helper

Typically in a core HTML layout, simply invoke the helper

    = google_analytics
