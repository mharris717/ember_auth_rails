module EmberAuthRails
  class Engine < ::Rails::Engine
    initializer "ember_auth.helpers" do
      ActiveSupport.on_load(:action_controller) do
        include EmberAuthHelper
      end
    end
  end
end
