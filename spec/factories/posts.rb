FactoryBot.define do
  factory :post do
    title          {Faker::Lorem.sentence}
    text           {Faker::Lorem.sentence}
    category_id    {2}
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/cafe201261763.jpg'), filename: 'cafe201261763.jpg')
    end
  end
end