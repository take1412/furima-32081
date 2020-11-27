FactoryBot.define do
  factory :item do
    name                  {"a"}
    text                  {"a"}
    category_id           {1}
    condition_id          {1}
    charge_id             {1}
    prefecture_id         {1}
    days_ship_id          {1}
    price                 {500}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
