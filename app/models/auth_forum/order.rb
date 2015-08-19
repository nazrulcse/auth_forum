module AuthForum
  class Order < ActiveRecord::Base
    ORDER_STATE = {
        :reject => 0,
        :pending => 1,
        :delivery => 2,
        :delivered => 3
    }
    attr_accessor :exp_month, :start_year, :card_cvv, :card_num
    has_many :line_items
    belongs_to :user
    validates :card_holder_name, :presence => true
    validates :card_num, :presence => true
    validates :exp_month, :presence => true
    validates :start_year, :presence => true
    validates :card_cvv, :presence => true
    validates :first_name, :presence => true
    validates :last_name, :presence => true
    validates :b_address, :presence => true
    validates :b_country, :presence => true
    validates :b_city, :presence => true
    validates :b_zip, :presence => true
    validates :s_address, :presence => true , :unless => :same_address?
    validates :s_country, :presence => true , :unless => :same_address?
    validates :s_city, :presence => true , :unless => :same_address?
    validates :s_zip, :presence => true , :unless => :same_address?

    def add_to_line_item(current_cart)
      current_cart.line_items.each do |item|
        line_items << item
      end
    end

    def total_item
      line_items.sum(:quantity)
    end

    def order_total
      line_items.collect{|item| item.quantity * item.product.price }.sum
    end

  end
end
