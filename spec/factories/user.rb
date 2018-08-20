FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password "foobar1234"
    confirmed_at { Time.zone.now }
  end
end