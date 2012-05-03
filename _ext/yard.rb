
module Awestruct
  module Extensions
    class Yard

      def execute(site)
        gem_file = File.join( site.tmp_dir, "awestruct-#{site.gem_version}.gem" )
        if ( ! File.exist?( gem_file ) )
          Dir.chdir( site.tmp_dir ) do 
            puts `ruby -S gem fetch awestruct -v #{site.gem_version}`
          end
        end

        Dir.chdir( site.tmp_dir ) do
          gem_dir = File.join( 'gems', 'gems', "awestruct-#{site.gem_version}" )
          if ( ! File.exist?( gem_dir ) )
            puts `ruby -S gem install awestruct-#{site.gem_version}.gem -i gems --ignore-dependencies`
          end

          doc_dir = File.join( gem_dir, 'doc' ) 
          if ( ! File.exist?( doc_dir ) )
            Dir.chdir( gem_dir ) do
              puts `ruby -S yardoc --verbose --debug 'lib/**/*.rb'`
            end
          end

          FileUtils.rm_rf( File.join( site.output_dir, 'yardoc' ) )
          #FileUtils.mkdir_p( File.join( site.output_dir, 'yardoc' ) )
          FileUtils.cp_r( doc_dir, File.join( site.output_dir, 'yardoc' ) )
        end

      end

    end
  end
end
