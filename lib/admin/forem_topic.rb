ActiveAdmin.register Forem::Topic do
  menu parent: 'Forem', label: 'Topic'
  controller do
    def create
      topic = Forem::Topic.new(topic_params)
      if topic.save
        redirect_to admin_forem_topic_path(topic)
      else
        render 'new'
      end
    end

    def update
      topic = Forem::Topic.friendly.find(params[:id])
      if topic.update_attributes(topic_params)
        redirect_to admin_forem_topic_path(topic)
      else
        render 'edit'
      end
    end

    def topic_params
      params.require(:topic).permit!
    end
  end
end
