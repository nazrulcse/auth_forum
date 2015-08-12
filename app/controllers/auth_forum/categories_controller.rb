require_dependency "auth_forum/application_controller"

module AuthForum
  class CategoriesController < ApplicationController

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)

      if @category.save
        redirect_to @category, notice: 'Category was successfully created.'
      else
        render :new
      end
    end

    private
      # Only allow a trusted parameter "white list" through.
      def category_params
        params.require(:category).permit(:name)
      end
  end
end
