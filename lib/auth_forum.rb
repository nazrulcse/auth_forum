require 'activeadmin'
require "auth_forum/engine"
# module AuthForum
#   class Engine < ::Rails::Engine
#     isolate_namespace AuthForum
#     initializer :auth_forum do
#       puts Dir[File.dirname(__FILE__) + '/auth_forum/admin']
#       ActiveAdmin.application.load_paths.unshift Dir[File.dirname(__FILE__) + '/auth_forum/admin']
#     end
#   end
# end
module AuthForum
  #extend ActiveSupport::Autoload
  #autoload :Admin
end