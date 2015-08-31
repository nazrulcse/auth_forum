ActiveAdmin.register AuthForum::LineItem do
  menu label: 'Line Item'
  controller do
    def create
      line_item = AuthForum::LineItem.new(line_item_params)
      if line_item.save
        redirect_to admin_auth_forum_line_item_path(line_item)
      else
        render 'new'
      end
    end

    def update
      line_item = AuthForum::LineItem.find_by_id(params[:id])
      if line_item.update_attributes(line_item_params)
        redirect_to admin_auth_forum_line_item_path(line_item)
      else
        render 'edit'
      end
    end

    def line_item_params
      params.require(:line_item).permit!
    end
  end
end
