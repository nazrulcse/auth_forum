module AuthForum
  class Event < ActiveRecord::Base
    belongs_to :product
  end
end
