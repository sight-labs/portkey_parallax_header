require "portkey_parallax_header/version"

unless defined?(Motion::Project::App)
  raise "This must be required from within a RubyMotion Rakefile"
end

Motion::Project::App.setup do |app|
  lib_dir = File.join(File.dirname(__FILE__))
  app.files.unshift(Dir.glob(File.join(lib_dir, "portkey_parallax_header/**/*.rb")))
  app.frameworks += %w{ Foundation UIKit }
end
