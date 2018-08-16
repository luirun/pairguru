FactoryBot.define do
  factory :comment do
    user_id {rand(1..10)}
    movie_id {rand(1..10)}
    content Faker::Lorem.word
  end
end
