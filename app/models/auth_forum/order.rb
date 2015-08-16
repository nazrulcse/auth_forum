module AuthForum
  class Order < ActiveRecord::Base
    attr_accessor :exp_month, :start_year, :card_cvv,:card_num
    has_many :line_items
    belongs_to :user
  end
end
