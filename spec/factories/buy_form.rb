FactoryBot.define do
  factory :buy_form do
    token                     { 'tok_abcdefghijk00000000000000000' }
    postal_code               { '123-1234' }
    prefecture_id             { 1 }
    city                      { 'テスト' }
    house_num                 { '1-1' }
    house_name                { 'マンション' }
    phone_num                 { '09012345678' }
    user_id                   { 1 }
    item_id                   { 1 }
  end
end
