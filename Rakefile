require 'rubygems'

task :default => :build

desc "Build and preview the site locally in development mode"
task :preview => :check do
  system "bundle exec awestruct --dev"
  #system "bundle exec awestruct -P development -g -s"
end

# provide a serve task for those used to Jekyll commands
task :serve => :preview

# provide a dev task for those used to legacy Awestruct commands
task :dev => :preview

desc "Build the site with the development profile"
task :build, [:profile] => :check do |t, args|
  system "bundle exec awestruct -P #{args[:profile] || 'development'} --force"
end

desc "Build the site and publish to github"
task :github => :check do
  system "bundle exec awestruct --deploy -g -P github --force"
end

desc "Build the site and publish to staging"
task :staging => :check do
  system "bundle exec awestruct --deploy -g -P staging --force"
end

desc "Build the site and publish to production"
task :production => :check do
  system "bundle exec awestruct --deploy -g -P production --force"
end

desc "Setup or update the environment to run Awestruct"
task :setup do
  system "bundle update"
end

desc "Clean out generated site and temporary files"
task :clean do
  require 'fileutils'
  ['.awestruct', '.sass-cache', '_site', '_tmp'].each do |dir|
    FileUtils.remove_dir dir unless !File.directory? dir
  end
end

task :check do
  begin
    require 'bundler'
    Bundler.setup
  rescue StandardError => e
    puts "\e[31m#{e.message}\e[0m"
    puts "\e[33mRun `rake setup` to install required gems.\e[0m"
    exit e.status_code
  end
  Dir.mkdir('_tmp') unless Dir.exist?('_tmp')
end
