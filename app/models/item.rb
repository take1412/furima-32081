class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :days_ship

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, inclusion: { in: 300..9999999, message: "is invalid. Please enter between 300 and 9,999,999 half-width numbers."}
  end

  with_options numericality: { other_than: 0, message: "can't be blank"} do
    validates :category_id
    validates :condition_id
    validates :charge_id
    validates :prefecture_id
    validates :days_ship_id
  end
  
end
