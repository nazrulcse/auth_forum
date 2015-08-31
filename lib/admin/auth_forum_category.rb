ActiveAdmin.register AuthForum::Category do
  menu label: 'Product Category'
  controller do
    def create
      category = AuthForum::Category.new(category_params)
      if category.save
        redirect_to admin_auth_forum_category_path(category)
      else
        render 'new'
      end
    end

    def update
      category = AuthForum::Category.find_by_id(params[:id])
      if category.update_attributes(category_params)
        redirect_to admin_auth_forum_category_path(category)
      else
        render 'edit'
      end
    end

    def category_params
      params.require(:category).permit!
    end
  end
end
