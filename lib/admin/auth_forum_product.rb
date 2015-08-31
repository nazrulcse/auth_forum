ActiveAdmin.register AuthForum::Product do
  menu label: 'Product'

  index do
    column 'ID' do |product|
      link_to product.id, admin_auth_forum_product_path(product)
    end
    column :title
    column :description do |product|
      truncate(product.description, length: 130, omission: '...')
    end
    column 'Category' do |product|
      product.category.name if product.category.present?
    end
    column 'Image' do |product|
      image_tag product.image_url(:thumb), width: 100, height: 100
    end
    column :price do |product|
      number_to_currency(product.price)
    end
    column :created_at
    column :updated_at
    actions
  end

  controller do
    def create
      product = AuthForum::Product.new(product_params)
      if product.save
        redirect_to admin_auth_forum_product_path(product)
      else
        render 'new'
      end
    end

    def update
      product = AuthForum::Product.find_by_id(params[:id])
      if product.update_attributes(product_params)
        redirect_to admin_auth_forum_product_path(product)
      else
        render 'edit'
      end
    end

    def product_params
      params.require(:product).permit!
    end
  end
end
