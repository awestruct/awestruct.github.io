---
---

### Typical usage to tag blog posts, 10-per-page
    
    Awestruct::Extensions::Pipeline.new do
      extension Awestruct::Extensions::Tagger.new( :posts, 
                                                   '/index', 
                                                   '/blog/tags', 
                                                   :per_page=>10 )
    end

