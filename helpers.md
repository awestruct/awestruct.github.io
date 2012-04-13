---
title: Helpers
layout: default
---

<div class="page-header">
<h1>Helpers</h1>
</div>

Helpers are Ruby modules that get mixed into the template evaluation
context.  Typically they add methods you may invoke from within
templates to produce additional output, retrieve objects or data,
or perform other actions.

To add a helper, simply use the `helper` keyword in your pipeline
configuration `_ext/pipeline.rb`, and specify the module to add as
a helper.  Be sure you `require` the appropriate files to have
the module loaded.

    Awestruct::Extensions::Pipeline.new do
      helper Awestruct::Extensions::IntenseDebate
      helper Awestruct::Extensions::GoogleAnalytics
    end

## Write your own helper

By default, the `_ext/` directory is added to the load path, so you may
simply add your helper definition there.


### Helper Definition

`_ext/my_helper.rb`

    module MyHelper
      def right_now
        Time.now
      end
    end

### Pipeline Configuration

`_ext/pipeline.rb`

    require 'my_helper'

    Awestruct::Extensions::Pipeline.new do
      helper MyHelper
    end

### Usage in a Template

`my_template.html.haml`

    %h1
      Generated \#{right_now}
