= EmberAuthRails

This library is intended to be used with Ember.js and the 
[ember-auth-easy](http://github.com/mharris717/ember-auth-easy) javascript library.

It adds token authentication to your Rails app (thanks Devise!).

1. Add ember_auth_rails to your gemfile
2. Copy the EAR migrations over
    rake ember_auth_rails_engine:install:migrations
3. Run the migrations
4. Add the authenticate_user! filter to your controllers
    class PostsController < ApplicationController
        before_filter :authenticate_user!

        ....
    end

If your Ember app will not be running on the same url/port, add Rack::Cors to your app
# Add to your Gemfile:
    gem 'rack-cors',:require=>"rack/cors"
# Add an initializer
    YOURAPPNAME::Application.config.middleware.use Rack::Cors do
      allow do
        # This will allow requests from all URLs. 
        # Change to whitelist specific URLs in production
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options, :put]
      end
    end