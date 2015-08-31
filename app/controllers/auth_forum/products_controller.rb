require_dependency "auth_forum/application_controller"

module AuthForum
  class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]

    def index
      @products = Product.limit(10)
    end

    def show
    end

    def new
      @product = Product.new
    end

    def edit
    end

    def more
      @products = Product.limit(10).offset(params[:offset])
      respond_to do |format|
        format.js {render :layout => false}
      end
    end

    def create
      puts post_params.inspect
      @product = Product.new(product_params)
      if @product.save
        redirect_to @product, notice: 'Product was successfully created.'
      else
        render :new
      end
    end

    def update
      if @product.update(product_params)
        redirect_to @product, notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @product.destroy
      redirect_to products_url, notice: 'Product was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_product
        @product = Product.find(params[:id])
      end

      def product_params
        params.require(:product).permit(:title, :description, :price, :image, :category_id)
      end
  end
end
