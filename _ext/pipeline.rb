require 'yard'
require 'extension_documenter'

Awestruct::Extensions::Pipeline.new do
  extension Awestruct::Extensions::DataDir.new
  extension ExtensionDocumenter.new
  extension Yard.new
  extension Awestruct::Extensions::Posts.new( '/news' )
  extension Awestruct::Extensions::Indexifier.new
  extension Awestruct::Extensions::Atomizer.new( :posts, '/news.atom' )
  extension Awestruct::Extensions::IntenseDebate.new
  extension Awestruct::Extensions::Flattr.new
end

