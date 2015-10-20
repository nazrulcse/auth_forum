FactoryGirl.define do
  factory :cart, :class => AuthForum::Cart do |f|
    f.sequence(:id) { |n| "#{n}"}
  end
end