FactoryGirl.define do
  factory :admin_user, :class => AuthForum::AdminUser do |f|
    f.sequence(:email) { |n| "admin#{n}@auth_forum.com"}
    password "123456789"
  end
end