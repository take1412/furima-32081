require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birth_day,が存在すれば登録できる。" do
        expect(@user).to be_valid
      end

      it "passwordが英字と数字両方含めて6文字以上だと登録できる" do
        @user.password = "a12345"
        @user.password_confirmation = "a12345"
        expect(@user).to be_valid
      end

      it "last_nameが全角だったら登録できる。" do
        @user.last_name = "鈴木"
        expect(@user).to be_valid
      end

      it "first_nameが全角だったら登録できる。" do
        @user.last_name = "花子"
        expect(@user).to be_valid
      end

      it "last_name_kanaが全角カナだったら登録できる。" do
        @user.last_name_kana = "スズキ"
        expect(@user).to be_valid
      end

      it "first_name_kanaが全角カナだったら登録できる。" do
        @user.first_name_kana = "ハナコ"
        expect(@user).to be_valid
      end

    end
    
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailに@がないと登録できない" do
        @user.email = "aaa.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "重複しているemailが存在していたら登録できない。" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "a1234"
        @user.password_confirmation = "a1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが英字と数字両方含まれていないと登録できない。" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. please includ both letters and numbers.")
      end
      
      it "passwordとpassword_confirmationが一致していないと登録できない。" do
        @user.password_confirmation = "a12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end 

      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "#last_nameが半角だと登録できない。" do
        @user.last_name = "ｽｽﾞｷ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "#first_nameが半角だと登録できない。" do
        @user.first_name = "ﾊﾅｺ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
 
      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "#last_name_が全角カナでないと登録できない。" do
        @user.last_name_kana = "すずき"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
      end

      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "#last_name_が全角カナでないと登録できない。" do
        @user.first_name_kana = "はなこ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
      end

      it "birth_dayが空では登録できない" do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end

    end
  end
end

