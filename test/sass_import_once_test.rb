require 'test/unit'
require 'sass'
require 'sass-import_once'

class SassImportOnceTest < Test::Unit::TestCase

  def test_will_import_file_once
    css = render_file("test.scss")
    assert_equal 1, css.scan(/#i\.was\.imported/).count
  end

private
  def render_file(filename)
    fixtures_dir = File.expand_path("fixtures", File.dirname(__FILE__))
    full_filename = File.expand_path(filename, fixtures_dir)
    syntax = File.extname(full_filename)[1..-1].to_sym
    engine = Sass::Engine.new(File.read(full_filename),
                              :syntax => syntax,
                              :filename => full_filename,
                              :cache => false,
                              :read_cache => false,
                              :load_paths => [fixtures_dir])
    engine.render
  end
end
