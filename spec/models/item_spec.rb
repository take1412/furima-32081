require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品が保存できる時' do
      it "image,name.text,category_id,condition_id,charge_id,prefecture_id,days_ship_id,price,の値が入力されていれば保存できること。" do
        expect(@item).to be_valid
      end
    end

    context '商品が保存できない時' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空だと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "textが空だと登録できない" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it "categoryが選択されていないと登録できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "conditionが選択されていないと登録できない" do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it "chargeが選択されていないと" do
        @item.charge_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Charge can't be blank")
      end

      it "prefectureが選択されていないと登録できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "days_shipが選択されていないと登録できない" do
        @item.days_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Days ship can't be blank")
      end

      it "priceが空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが半角数字以外だと登録できない" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Please enter between 300 and 9,999,999 half-width numbers.")
      end

      it "priceが300未満だと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Please enter between 300 and 9,999,999 half-width numbers.")
      end

      it "priceが9999999を超えると登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Please enter between 300 and 9,999,999 half-width numbers.")
      end

      it 'userが紐付いていないと登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end

