ActiveAdmin.register Forem::Category do
  menu parent: 'Forem', label: 'Category'
  controller do
    def create
      category = Forem::Category.new(category_params)
      if category.save
        redirect_to admin_forem_category_path(category)
      else
        render 'new'
      end
    end

    def update
      category = Forem::Category.friendly.find(params[:id])
      if category.update_attributes(category_params)
        redirect_to admin_forem_category_path(category)
      else
        render 'edit'
      end
    end

    def category_params
      params.require(:category).permit!
    end
  end
end
