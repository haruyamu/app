FactoryBot.define do
  factory :comment do
    text {"you look cool"}
    association :user
    association :post
  end
end