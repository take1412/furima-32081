class BuyForm

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_num, :house_name, :phone_num, :buy_info, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :house_num
    validates :phone_num, format: {with: /\A[0-9]{11}\z/, message: "is invalid. Input up to 11 numbers without hyphen(-)."}
  end

  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    buy_info = BuyInfo.create(user_id: user_id, item_id: item_id)
    Adress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_num: house_num, house_name: house_name, phone_num: phone_num, buy_info_id: buy_info.id)
  end
end