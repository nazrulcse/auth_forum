FactoryGirl.define do
  factory :line_item, :class => AuthForum::LineItem do |f|
    f.sequence(:id) { |n| "#{n}"}
    association :product,factory: :product
    association :cart,factory: :cart
  end
end