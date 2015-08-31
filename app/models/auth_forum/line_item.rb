module AuthForum
  class LineItem < ActiveRecord::Base
    belongs_to :product
    belongs_to :cart
    belongs_to :order

    def total_price
      quantity * product.price
    end

    def to_s
      product.title
    end

  end
end
