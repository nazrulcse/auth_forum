require 'test_helper'

module AuthForum
  class EventsControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
      @user = FactoryGirl.create(:user, :name => 'nazrul')
      sign_in @user
      @event = FactoryGirl.create(:event)
      @product = FactoryGirl.create(:product, :price => 25)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:events)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create event" do
      assert_difference('Event.count') do
        post :create, event: { name: 'test', description: 'test', title: '@post.title', product_id: @product.id }
      end

      assert_redirected_to event_path(assigns(:event))
    end

    test "should show post" do
      get :show, id: @event
      assert_response :success
    end

    test "Should show more" do
      xhr :get, :more
      assert_response :success
      assert_not_nil assigns(:events)
    end

  end
end
