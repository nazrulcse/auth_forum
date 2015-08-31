ActiveAdmin.register Forem::Subscription do
  menu parent: 'Forem', label: 'Subscription'
  controller do
    def create
      subscription = Forem::Subscription.new(subscription_params)
      if subscription.save
        redirect_to admin_forem_subscription_path(subscription)
      else
        render 'new'
      end
    end

    def update
      subscription = Forem::Subscription.find_by_id(params[:id])
      if subscription.update_attributes(subscription_params)
        redirect_to admin_forem_subscription_path(subscription)
      else
        render 'edit'
      end
    end

    def subscription_params
      params.require(:subscription).permit!
    end
  end
end
