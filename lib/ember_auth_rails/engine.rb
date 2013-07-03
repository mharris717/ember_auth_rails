module EmberAuthRails
  class Engine < ::Rails::Engine
    initializer "ember_auth.helpers" do
      ActiveSupport.on_load(:action_controller) do
        include EmberAuthHelper
      end
    end

    config.generators do |g|
      g.test_framework :rspec, :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end
  end
end
