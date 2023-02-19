FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    image    { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/cafe201261763.jpg'))}
  end
end
