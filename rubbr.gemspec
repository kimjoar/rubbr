# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'rubbr/version'

Gem::Specification.new do |s|
  s.name        = "rubbr"
  s.version     = Rubbr::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Eivind Uggedal"]
  s.email       = ["eu@redflavor.com"]
  s.homepage    = "http://rubyforge.com/projects/rubbr"
  s.description = "Build large LaTeX documents"
  s.summary     = s.description

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "rubbr"

  s.add_development_dependency "rspec"

  s.files        = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md CHANGELOG.md)
  s.executables  = ['rubbr']
  s.default_executable = 'rubbr'
  s.require_path = 'lib'
end

