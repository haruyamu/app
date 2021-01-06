FactoryBot.define do
  factory :post do
     after(:build) do |post|
      post.image.attach(io: File.open('public/images/book.jpeg'), filename: 'book.jpeg')
    end
    title {"東京タワーについて"}
    place {"東京"}
    content {"東京タワーについて"}
    association :user
  end
end
