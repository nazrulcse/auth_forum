ActiveAdmin.register AuthForum::Post do
  menu label: 'Post'
  controller do
    def create
      post = AuthForum::Post.new(post_params)
      if post.save
        redirect_to admin_auth_forum_post_path(post)
      else
        render 'new'
      end
    end

    def update
      post = AuthForum::Post.find_by_id(params[:id])
      if post.update_attributes(post_params)
        redirect_to admin_auth_forum_post_path(post)
      else
        render 'edit'
      end
    end

    def post_params
      params.require(:post).permit!
    end
  end
end
