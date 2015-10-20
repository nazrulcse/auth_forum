FactoryGirl.define do
  factory :contact, :class => AuthForum::Contact do |f|
    f.sequence(:full_name) { |n| "User name #{n}"}
    f.sequence(:email) { |n| "example#{n}@auth_forum.com"}
    f.sequence(:subject) { |n| "contact subject #{n}"}
    f.sequence(:message) { |n| "contact message"}
  end
end