FactoryGirl.define do
  factory :comment do
    user
    question
    body Faker::Lorem.paragraph
  end
end
