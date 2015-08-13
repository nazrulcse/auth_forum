module AuthForum
  class Engine < ::Rails::Engine
    isolate_namespace AuthForum
    initializer :auth_forum do
      require 'jquery-ui-rails'
      require 'devise'
    end
  end
end