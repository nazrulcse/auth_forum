FactoryGirl.define do
  factory :post, :class => AuthForum::Post do |f|
    f.sequence(:title) { |n| "Title #{n}"}
    f.sequence(:author) { |n| "Author #{n}"}
    f.sequence(:description) { |n| "description #{n}"}
  end
end