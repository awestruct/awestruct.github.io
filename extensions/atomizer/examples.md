### Typical Usage

    Awestruct::Extensions::Pipeline.new do
      extension Awestruct::Extensions::Atomizer.new( 
        :posts, 
        '/news.atom',
        :feed_title=>'Awesome Blog Inc.' 
      )
    end


