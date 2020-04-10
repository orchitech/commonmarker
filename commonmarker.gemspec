# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'commonmarker_fixed_sourcepos/version'

Gem::Specification.new do |s|
  s.name = 'commonmarker_fixed_sourcepos'
  s.version = CommonMarkerFixedSourcepos::VERSION
  s.summary = 'CommonMark parser and renderer. Written in C, wrapped in Ruby.'
  s.description = 'A fast, safe, extensible parser for CommonMark. This wraps the cmark-gfm library and adds sourcepos fixes.'
  s.authors = ['Garen Torikian', 'Ashe Connor']
  s.homepage = 'https://github.com/orchitech/commonmarker/tree/fix-sourcepos'
  s.license = 'MIT'

  s.files         = %w[LICENSE.txt README.md Rakefile commonmarker.gemspec bin/commonmarker_fixed_sourcepos]
  s.files        += Dir.glob('lib/**/*.rb')
  s.files        += Dir.glob('ext/commonmarker_fixed_sourcepos/*.*')
  s.test_files    = Dir.glob('test/**/*').reject { |f| f == 'test/benchinput.md' || f.start_with?('test/progit/') }
  s.extensions    = ['ext/commonmarker_fixed_sourcepos/extconf.rb']

  s.executables = ['commonmarker_fixed_sourcepos']
  s.require_paths = %w[lib ext]

  s.rdoc_options += ['-x', 'ext/commonmarker_fixed_sourcepos/cmark/.*']

  s.add_dependency 'ruby-enum', '~> 0.5'

  s.add_development_dependency 'awesome_print'
  s.add_development_dependency 'json', '~> 1.8'
  s.add_development_dependency 'minitest', '~> 5.6'
  s.add_development_dependency 'minitest-focus', '~> 1.1'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rake-compiler', '~> 0.9'
  s.add_development_dependency 'rdoc', '~> 6.2'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-standard'
end
