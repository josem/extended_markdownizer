# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "extended_markdownizer/version"

Gem::Specification.new do |s|
  s.name        = "extended_markdownizer"
  s.version     = ExtendedMarkdownizer::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["José M. Gilgado"]
  s.email       = ["jm.gilgado@gmail.com"]
  s.homepage    = "https://github.com/josem/extended_markdownizer"
  s.summary     = %q{Render any text as markdown, with code highlighting and all!}
  s.description = %q{Render any text as markdown, with code highlighting, url detection and conversion of youtube/vimeo urls into embedded videos}

  s.rubyforge_project = "extended_markdownizer"

  s.add_runtime_dependency 'activerecord', '>= 3.0.3'
  s.add_runtime_dependency 'rdiscount'
  s.add_runtime_dependency 'coderay'

  s.add_development_dependency 'rocco'
  s.add_development_dependency 'git'
  s.add_development_dependency 'rspec', '~> 2.5.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
