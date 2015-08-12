module AuthForum
  class Engine < ::Rails::Engine
    isolate_namespace AuthForum
    initializer :auth_forum do
      ActiveAdmin.application.load_paths += Dir[File.dirname(__FILE__) + '/admin']
      require 'jquery-ui-rails'
    end
  end
end