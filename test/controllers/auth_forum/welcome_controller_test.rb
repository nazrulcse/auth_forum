require 'test_helper'

module AuthForum
  class WelcomeControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
      FactoryGirl.create(:about)
      @about_latest = FactoryGirl.create(:about)
    end

    test 'should get index' do
      get :index
      assert_response :success
    end

    test 'should get latest about' do
      get :about
      assert_response :success
      assert_equal assigns(:about), @about_latest
    end

    test 'should get contact' do
      get :contact
      assert_response :success
    end

    test "should create contact" do
      assert_difference('Contact.count') do
        post :create_contact, contact: { full_name: 'User Name', subject: 'Contact subject', email: 'example@auth_forum.com', message: 'Contact message' }
      end

      assert_redirected_to contact_path
    end

  end
end
