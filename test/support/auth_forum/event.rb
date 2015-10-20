FactoryGirl.define do
  factory :event, :class => AuthForum::Event do |f|
    f.sequence(:name) { |n| "Event #{n}"}
    f.sequence(:title) { |n| "Product event #{n}"}
    f.sequence(:description) { |n| "Sample event #{n} for test"}
    association :product, factory: :product
  end
end