$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'easy_ui/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'easy_ui'
  s.version     = EasyUi::VERSION
  s.authors     = ['Chirag Viradiya']
  s.email       = ['chirag.viradiya@gmail.com']
  s.homepage    = 'TODO'
  s.summary     = 'Easy Rails UI Helpers'
  s.description = 'Easy Rails UI Helpers'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.0.12'
  s.add_dependency 'sass-rails'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'bootstrap-sass'
  s.add_dependency 'sprockets'
  s.add_dependency 'sprockets-rails'
  s.add_dependency 'uglifier'
  s.add_dependency 'font-awesome-rails'
  s.add_dependency 'jquery-rails'

  s.add_development_dependency 'sqlite3'
end