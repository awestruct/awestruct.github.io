---
title: Textile Extension
layout: default
---

The implementation that Awestruct uses is RedCloth. It's possible to customize Textile using RedCloth in two ways:

* Define block tags
* Filter inline markup

Let's look at the two cases.

### Define block tags

To define block tags, you simply add an Awestruct extension that overrides the RedCloth HTML formatter. Here's an example of how to define a custom tag for vimeo:

    module RedCloth::Formatters::HTML
      def vimeo(opts)
        clip_id, dim = opts[:text].split(' ').map! {|s| s.strip}
        dim_attrs = ''
        if dim
          # x is transformed by &#215; by textile
          w, h = dim.split('&#215;')
        else
          w, h = ["800", "600"]
        end
        dim_attrs = " width=\"\#{w}\" height=\"\#{h}\""
        "<iframe\#{pba(opts)}\#{dim_attrs} src=\"http://player.vimeo.com/video/\#{clip_id}?title=0&amp;byline=0&amp;portrait=0\" frameborder=\"0\" webkitallowfullscreen=\"webkitallowfullscreen\" mozallowfullscreen=\"mozallowfullscreen\" allowfullscreen=\"allowfullscreen\"></iframe>"
      end
    end

You need to require the file with this code in `_ext/pipeline.rb`.

### Filter inline markup

Markup is filtered using rule methods. Custom rule methods are passed to the `to_html` method of the RedCloth object. Awestruct will read in the method names defined by `site.textile_rules`, convert them to symbols (if they aren't already), and pass them to this method.

The functions must be included into the RedCloth class using an Awestruct Extension. For example:

    module Awestruct::Extensions
      class TextilePlus
        def initialize()
          RedCloth.send(:include, CustomRules)
        end
    
        module CustomRules
          def emoticons(text)
             # replace emoticons in text
          end
        end
      end
    end

You can either set `site.textile_rules` inside the extension, or in `_config/site.yml`. Here's an example of using site.yml (where the methods are defined as strings):

    textile_rules = [emoticons]

Here's an example of registering them in the extension (where the methods are defined as symbols):

    def execute(site)
      site.textile_rules = [:emoticons]
    end

You then initialize the extension in your pipeline:

    extension Awestruct::Extensions::TextilePlus.new() 

Now you can use your custom markup and tags.
