ActiveAdmin.register Forem::Post do
  menu parent: 'Forem', label: 'Post'

  before_filter do
    Forem::Post.class_eval do
      def to_s
        "Post-#{id}"
      end
    end
  end

  controller do
    def create
      post = Forem::Post.new(post_params)
      if post.save
        redirect_to admin_forem_post_path(post)
      else
        render 'new'
      end
    end

    def update
      post = Forem::Post.find_by_id(params[:id])
      if post.update_attributes(post_params)
        redirect_to admin_forem_post_path(post)
      else
        render 'edit'
      end
    end

    def post_params
      params.require(:post).permit!
    end
  end
end
