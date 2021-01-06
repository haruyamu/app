FactoryBot.define do
  factory :user do
    name {"namename"}
    email {Faker::Internet.free_email}
    password {"name4444"}
  end
end
