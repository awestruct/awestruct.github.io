require 'rubygems'
require 'bundler/setup'


task :default => :build

desc "Run in developer mode"
task :dev do
  system "awestruct --dev"
end

desc "Build the site with the development profile"
task :build do
  system "awestruct -P development --force"
end

desc "Build the site and publish to github"
task :github do
  system "awestruct --deploy -P github --force"
end
 

desc "Build the site and publish to staging"
task :staging do
  system "awestruct --deploy -P staging --force"
end
