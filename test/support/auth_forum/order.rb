FactoryGirl.define do
  factory :order, :class => AuthForum::Order do |f|
    f.sequence(:card_holder_name) { |n| "card holder #{n}"}
    f.sequence(:first_name) { |n| "first name #{n}"}
    f.sequence(:last_name) { |n| "last name #{n}"}
    f.sequence(:email) { |n| "test#{n}@auth_forum.com"}
    f.sequence(:s_address) { |n| "s_address #{n}"}
    f.sequence(:s_country) { |n| "s_country #{n}"}
    f.sequence(:s_city) { |n| "s_city #{n}"}
    f.sequence(:s_zip) { |n| "s_zip #{n}"}
  end
end