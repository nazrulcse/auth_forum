require 'test_helper'
require 'generators/auth_forum/auth_forum_generator'

module AuthForum
  class AuthForumGeneratorTest < Rails::Generators::TestCase
    tests AuthForumGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    # test "generator runs without errors" do
    #   assert_nothing_raised do
    #     run_generator ["arguments"]
    #   end
    # end
  end
end
