FactoryGirl.define do
  factory :category, :class => AuthForum::Category do |f|
    f.sequence(:name) { |n| "Category #{n}"}
  end
end