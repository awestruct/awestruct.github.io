require 'rubygems'
require 'bundler/setup'


task :default => :build

desc "Run in developer mode"
task :dev => :check do
  system "awestruct --dev"
end

desc "Build the site with the development profile"
task :build => :check do
  system "awestruct -P development --force"
end

desc "Build the site and publish to github"
task :github => :check do
  system "awestruct --deploy -P github --force"
end
 

desc "Build the site and publish to staging"
task :staging => :check do
  system "awestruct --deploy -P staging --force"
end

task :check do
  Dir.mkdir('_tmp') unless Dir.exist?('_tmp')
end
