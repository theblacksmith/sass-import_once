# -*- encoding: utf-8 -*-
require File.expand_path("../lib/sass/import_once/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "sass-import_once"
  s.version     = Sass::ImportOnce::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["The Blacksmith (a.k.a. Saulo Vallory)"]
  s.email       = ["me@saulovallory.com"]
  s.homepage    = "https://github.com/theblacksmith/sass-import_once"
  s.summary     = %q{Makes Sass @import directives only import a file once.}
  s.description = %q{
    The Sass ImportOnce Importer MODIFIES the default behaviour of Sass.
    Sass @import directive imports the file requested everytime it's called
    this has been default behaviour, as far as I know, from the beginning of
    Sass's life. But sometimes, or most of the time, this behaviour isn't 
    desireable. When working with modularized sass styles and sass frameworks
    out there we usually want a file to be imported only once.

    For more information check the readme at github.
  }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'sass', '>= 3.1'

end
