require 'devise'
require 'rmagick'
require 'carrierwave'
require 'activemerchant'
module AuthForum
  class Engine < ::Rails::Engine
    isolate_namespace AuthForum
    initializer :auth_forum do
      require 'jquery-ui-rails'
    end
  end
end