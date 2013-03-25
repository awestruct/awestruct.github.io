require 'rubygems'

task :default => :build

desc "Run in developer mode"
task :dev => :check do
  system "bundle exec awestruct --dev"
end

desc "Build the site with the development profile"
task :build => :check do
  system "bundle exec awestruct -P development --force"
end

desc "Build the site and publish to github"
task :github => :check do
  system "bundle exec awestruct --deploy -P github --force"
end

desc "Build the site and publish to staging"
task :staging => :check do
  system "bundle exec awestruct --deploy -P staging --force"
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
