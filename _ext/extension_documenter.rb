
class ExtensionDocumenter

  def execute(site)
    site.pages.each do |page|
      if ( page.relative_source_path =~ %r(/extensions/(([^/]+)|(doc_template))/) )
        site.pages.delete( page )
      end
    end

    extensions = []

    extension_pages = {}

    Dir[ 'extensions/*' ].each do |dir|
      next unless File.directory?( dir )

      ext_name = File.basename( dir )

      ext_page = site.engine.load_site_page( '/extensions/doc_template.html.haml' )
      ext_page.output_path = "/extensions/#{ext_name}.html"

      desc_page = site.engine.find_and_load_site_page( "#{dir}/description" )

      ext_page.name        = desc_page.name
      ext_page.see_also    = desc_page.see_also

      extensions << [ ext_name, desc_page.name ]

      ext_page.classname   = desc_page.classname
      ext_page.description = desc_page.content

      example_page = site.engine.find_and_load_site_page( "#{dir}/examples" )

      ( ext_page.example = example_page.content ) if example_page

      usage_page = site.engine.find_and_load_site_page( "#{dir}/usage" )

      if ( usage_page ) 
        ext_page.usage   = usage_page.content
        ext_page.params  = usage_page.params
        ext_page.param_descriptions = {}
        unless ( ext_page.params.nil? )
          ext_page.params.each do |param|
            ext_page.param_descriptions[ param ] = usage_page.send( param )
          end
          if ( ext_page.params.include?( "opts" ) )
            if ( File.exist?( "#{dir}/opts.yaml" ) )
              opts = YAML.load( File.read( "#{dir}/opts.yaml" ) )
              ext_page.opts = opts
            end
          end
        end
      end

      extension_pages[ ext_name ] = ext_page
      site.pages << ext_page
    end

    unless (extension_pages.is_a? String)
      extension_pages.each do |key, page|
        see_also = page.see_also
        ref_pages = []
        unless ( see_also.nil? || see_also.is_a?(String) )
          see_also.each do |key|
            ref_page = extension_pages[key]
            ( ref_pages << ref_page ) unless ref_page.nil?
          end
        end
        page.see_also = ref_pages
      end
    end

    extension_pages.each do |key, page|
      see_also = page.see_also
      unless ( see_also.nil? )
        see_also.each do |other_page|
          other_see_also = other_page.see_also || []
          ( other_see_also << page ) unless other_see_also.include?( page )
          other_page.see_also = other_see_also
        end
      end
    end

    extension_pages.each do |key, page|
      see_also = page.see_also || []
      page.see_also = see_also.sort{|l,r|l.name<=>r.name}
    end

    site.extensions = extensions.sort{|l,r| l.first <=> r.first}
  end

end
