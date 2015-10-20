require 'test_helper'

module AuthForum
  class CategoriesControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
      @user = FactoryGirl.create(:user)
      sign_in @user
      @category = FactoryGirl.create(:category)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create category" do
      assert_difference('Category.count') do
        post :create, category: { name: @category.name }
      end

      assert_redirected_to category_path(assigns(:category))
    end
  end
end
