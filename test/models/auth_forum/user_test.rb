require 'test_helper'

module AuthForum
  class UserTest < ActiveSupport::TestCase

    def setup
      @user = FactoryGirl.create(:user, :name => 'nazrul')
      @user1 = FactoryGirl.create(:user)
    end

    test "user name for forem_name" do
      assert_equal @user.forem_name, 'nazrul'
    end

    test "Anonymous name for user if name not exist for forem_name" do
      assert_equal @user1.forem_name, 'Anonymous'
    end

    test "test forem_email" do
      assert_equal @user.forem_email, @user.email
    end
  end
end
