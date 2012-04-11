### Typical Usage

    Awestruct::Extensions::Pipeline.new do
      extension Awestruct::Extensions::Atomizer.new( :posts, '/news.atom' )
    end


