FactoryGirl.define do
  factory :question do
    user
    title Faker::Book.title
    body Faker::Lorem.paragraph
  end
end
