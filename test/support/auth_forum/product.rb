FactoryGirl.define do
  factory :product, :class => AuthForum::Product do |f|
    f.sequence(:title) { |n| "Sample product #{n}"}
    description "Sample test product"
    category_id 1
    association :category,factory: :category
  end
end