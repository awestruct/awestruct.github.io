require File.join(File.dirname(__FILE__), 'yard')
require 'extension_documenter'

Awestruct::Extensions::Pipeline.new do
  extension ExtensionDocumenter.new
  extension Awestruct::Extensions::Yard.new
  extension Awestruct::Extensions::Posts.new( '/news' )
  extension Awestruct::Extensions::Indexifier.new
  extension Awestruct::Extensions::Atomizer.new( :posts, '/news.atom' )
  extension Awestruct::Extensions::IntenseDebate.new
  extension Awestruct::Extensions::Flattr.new
  extension Awestruct::Extensions::Paginator.new( :posts, 
                                                  '/news/index', 
                                                  :per_page=>3 )
  transformer Awestruct::Extensions::Minify.new
end
