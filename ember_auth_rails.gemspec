$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ember_auth_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ember_auth_rails"
  s.version     = EmberAuthRails::VERSION
  s.authors     = ["Mike Harris"]
  s.email       = ["mharris717@gmail.com"]
  s.homepage    = "http://github.com/mharris717/ember_auth_rails"
  s.summary     = "Rails engine to help with ember.js authentication"
  s.description = "Rails engine to help with ember.js authentication"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.13"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
