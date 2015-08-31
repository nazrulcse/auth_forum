require 'devise'
require 'rmagick'
require 'carrierwave'
require 'activemerchant'
require 'activeadmin'
module AuthForum
  class Engine < ::Rails::Engine
    isolate_namespace AuthForum
    config.to_prepare do
      ApplicationController.helper(ActionView::Helpers::ApplicationHelper)
    end
    initializer :auth_forum do
      require 'jquery-ui-rails'
    end
  end
end