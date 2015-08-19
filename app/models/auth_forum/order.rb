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
    after_create :update_billing_address
    validates :card_holder_name, :presence => true
    validates :card_num, :presence => true
    validates :exp_month, :presence => true
    validates :start_year, :presence => true
    validates :card_cvv, :presence => true
    validates :first_name, :presence => true
    validates :last_name, :presence => true
    validates :b_address, :presence => true, :if => :same_billing_address?
    validates :b_country, :presence => true, :if => :same_billing_address?
    validates :b_city, :presence => true, :if => :same_billing_address?
    validates :b_zip, :presence => true, :if => :same_billing_address?
    validates :s_address, :presence => true
    validates :s_country, :presence => true
    validates :s_city, :presence => true
    validates :s_zip, :presence => true

    def add_to_line_item(current_cart)
      current_cart.line_items.each do |item|
        line_items << item
      end
    end

    def update_billing_address
      if same_address
         self.b_address = s_address
         self.b_country = s_country
         self.b_city = s_city
         self.b_zip = s_zip
        self.save
      end
    end

    def same_billing_address?
      !same_address
    end

    def total_item
      line_items.sum(:quantity)
    end

    def order_total
      line_items.collect{|item| item.quantity * item.product.price }.sum
    end

  end
end
