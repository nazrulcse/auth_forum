require 'activeadmin'
require 'auth_forum/engine'
module AuthForum
  class Engine < ::Rails::Engine
    isolate_namespace AuthForum
    initializer :auth_forum do
      require 'devise'
    end
  end
end