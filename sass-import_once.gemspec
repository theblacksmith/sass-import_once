# -*- encoding: utf-8 -*-
require File.expand_path("../lib/sass/import_once/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "sass-import_once"
  s.license     = "MIT"
  s.version     = Sass::ImportOnce::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["The Blacksmith (a.k.a. Saulo Vallory)"]
  s.email       = ["me@saulovallory.com"]
  s.homepage    = "https://github.com/theblacksmith/sass-import_once"
  s.summary     = %q{Makes Sass @import directives never import a file more than once.}
  s.description = %q{
    The Sass ImportOnce Importer MODIFIES the default behavior of Sass @import directive.
    It REPLACES the default importer to assure any @import'ed file is only include once.
    For more information check the readme at github.
  }

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'sass', '>= 3.1'

end
