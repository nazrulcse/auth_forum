module AuthForum
  class Contact < ActiveRecord::Base
    validates :full_name, :email, :subject, :message, :presence => true
  end
end
