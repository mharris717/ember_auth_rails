# EmberAuthRails (EAR)

This library is intended to be used with Ember.js and the 
[ember-auth-easy](http://github.com/mharris717/ember-auth-easy) javascript library.

It adds token authentication to your Rails app (thanks Devise!).

## Adding EAR to your Rails app.

* Add ember_auth_rails to your gemfile

```
gem 'ember_auth_rails'
```

* Copy the EAR migrations over

```
rake ember_auth_rails_engine:install:migrations
```

* Run the migrations

```
rake db:migrate
```

* Add the authenticate_user! filter to your controllers

```
class PostsController < ApplicationController
    before_filter :authenticate_user!

    ....
end
```

* Create your users

```
User.create! :email => "user@fake.com", :password => "password123"
```

## Rack::CORS

If your Ember app will not be running on the same url/port, add Rack::Cors to your app
  
* Add to your Gemfile:

```
gem 'rack-cors',:require=>"rack/cors"
```
  
* Add an initializer (config/initializers/cors.rb)

```
YOURAPPNAME::Application.config.middleware.use Rack::Cors do
  allow do
    # This will allow requests from all URLs. 
    # Change to whitelist specific URLs in production
    origins '*'
    resource '*', :headers => :any, :methods => [:get, :post, :options, :put]
  end
end
```
