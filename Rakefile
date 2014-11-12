require "bundler/gem_tasks"
require 'bundler'
Bundler.require

task :test do
  Dir.glob('./test/**/*_test.rb') { |file| require file }
end

