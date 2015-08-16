module AuthForum
  class Product < ActiveRecord::Base
    belongs_to :category
    has_one :event
    mount_uploader :image, ImageUploader
    validates :title, :description, :image_url, :presence => true
    before_destroy :ensure_not_referenced_by_any_line_item

    def get_image(size)
      if image_url.present?
        image_url(size.to_sym)
      else
        'assets/default.png'
      end
    end

    private

    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end

  end
end
