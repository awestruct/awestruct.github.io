### Simple

    Awestruct::Extensions::Pipeline.new do
      extension Awestruct::Extensions::Indexifier.new
    end


### Avoiding some paths

Awestruct::Extensions::Pipeline.new do
  extension Awestruct::Extensions::Indexifier.new(['path_regex_expression','another_path_expression'])
end
