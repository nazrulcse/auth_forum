$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'auth_forum/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'auth_forum'
  s.version     = AuthForum::VERSION
  s.authors     = ['nazrul']
  s.email       = ['nazrulku07@gmail.com']
  #s.homepage    = "TODO"
  s.summary     = 'Base application'
  s.description = 'Basic authentication with with forem engine'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2.0'

  s.add_development_dependency 'mysql2'
  s.add_dependency 'devise'
  s.add_dependency 'will_paginate', '3.0.5'
  s.add_dependency 'forem'
end
