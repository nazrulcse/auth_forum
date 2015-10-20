FactoryGirl.define do
  factory :about, :class => AuthForum::About do |f|
    f.sequence(:body) { |n| "Sample about body #{n}"}
  end
end