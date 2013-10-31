require 'sass/exec'

class Sass::Engine
  alias old_initialize initialize
  
  def initialize(template, options={})
    options[:filesystem_importer] = Sass::ImportOnce::Importer

    old_initialize(template, options)
  end
end