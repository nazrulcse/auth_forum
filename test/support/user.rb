FactoryGirl.define do
  factory :user do |f|
    f.sequence(:email) { |n| "test#{n}@auth_forum.com"}
    password "123456789"
  end
end