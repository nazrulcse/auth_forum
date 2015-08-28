require 'devise'
require 'rmagick'
require 'carrierwave'
require 'activemerchant'
require 'activeadmin'
module AuthForum
  class Engine < ::Rails::Engine
    isolate_namespace AuthForum
    initializer :auth_forum do
      require 'jquery-ui-rails'
      ActiveAdmin.before_load do |app|
        app.load_paths << File.expand_path('../../../app/admin', __FILE__)
        require 'admin/dashboard'
      end
    end
  end
end