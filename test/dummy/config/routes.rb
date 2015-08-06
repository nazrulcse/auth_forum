Rails.application.routes.draw do

  mount AuthForum::Engine => "/auth_forum"
end
