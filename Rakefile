$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require 'bundler'
require 'bundler/gem_tasks'

if ARGV.join(' ') =~ /spec/
  Bundler.require :default, :spec
else
  Bundler.require
end

require './lib/portkey_parallax_header'

Motion::Project::App.setup do |app|
  app.name = 'portkey_parallax_header'
  app.frameworks += %w(Foundation UIKit)
end
