require 'rails_helper'

RSpec.describe BuyForm, type: :model do
  before do
    @buy_form = FactoryBot.build(:buy_form)
  end

  describe '購入情報登録' do
    context '購入情報が登録できる時' do
      it 'token,postal_code,prefecture_id,city,house_num,house_name,phone_numの値が入力されていれば登録できること' do
        expect(@buy_form).to be_valid
      end

      it 'house_nameが入力されていなくても登録できる' do
        @buy_form.house_name = nil
        expect(@buy_form).to be_valid
      end
    end

    context '購入情報が登録できない場合' do
      it 'tokenが空だと登録できない' do
        @buy_form.token = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Token can't be blank")
      end

      it 'postal_codeが空だと登録できない' do
        @buy_form.postal_code = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeに-が含まれていないと登録できない' do
        @buy_form.postal_code = '1234567'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it 'prefecture_idが空だと登録できない' do
        @buy_form.prefecture_id = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'prefecture_idが選択されていないと登録できない' do
        @buy_form.prefecture_id = 0
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空だと登録できない' do
        @buy_form.city = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numが空だと登録できない' do
        @buy_form.house_num = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("House num can't be blank")
      end

      it 'phone_numが空だと登録できない' do
        @buy_form.phone_num = nil
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone num can't be blank")
      end

      it 'phone_numに-が含まれていたら登録できない' do
        @buy_form.phone_num = '090-1234-5678'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Phone num is invalid. Input up to 11 numbers without hyphen(-)')
      end

      it 'phone_numが11文字以上だと登録できない' do
        @buy_form.phone_num = '123456789012'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include('Phone num is too long (maximum is 11 characters)')
      end
    end
  end
end
