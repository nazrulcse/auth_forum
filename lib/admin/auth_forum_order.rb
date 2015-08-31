ActiveAdmin.register AuthForum::Order do
  menu label: 'Order'
  actions :index, :show, :destroy, :edit, :update
  controller do
    def update
      order = AuthForum::Order.find_by_id(params[:id])
      if order.update_attributes(order_params)
        redirect_to admin_auth_forum_order_path(order)
      else
        puts order.errors.inspect
        render 'edit'
      end
    end

    def order_params
      params.require(:order).permit!
    end
  end
end
