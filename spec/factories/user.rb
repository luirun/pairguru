FactoryBot.define do
  factory :user do
    name  		{ Faker::Name.name }
    email       { Faker::Internet.email }
    password    "foobar1234"
    confirmed_at 01-01-2018
  end
end