require 'yard'

Awestruct::Extensions::Pipeline.new do
  extension Yard.new
  extension Awestruct::Extensions::Posts.new( '/news' )
  extension Awestruct::Extensions::Indexifier.new
end

