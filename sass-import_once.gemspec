# -*- encoding: utf-8 -*-
require File.expand_path("../lib/sass/import_once/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "sass-import_once"
  s.version     = Sass::ImportOnce::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["The Blacksmith (a.k.a. Saulo Vallory)"]
  s.email       = ["me@saulovallory.com"]
  s.homepage    = "http://theblacksmithhq.com/"
  s.summary     = %q{Makes Sass @import directives only import a file once.}
  s.description = %q{Makes Sass @import directives only import a file once.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- test/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'sass', '>= 3.1'

end
