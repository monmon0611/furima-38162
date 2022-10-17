require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
    describe 'ユーザー新規登録' do
      context '新規登録できる場合' do
        it "全てが存在すれば登録できる" do
          expect(@user).to be_valid
        end
      end
    end
    # ユーザー新規登録についてのテストコードを記述します  
    it 'nicknameが空では登録できない' do
      @user.nickname = ""  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
      # nicknameが空では登録できないテストコードを記述します
    end

    it 'emailが空では登録できない' do
      @user.email = ""  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      # emailが空では登録できないテストコードを記述します
    end


    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが半角数字のみでは登録できない' do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordが半角英字のみでは登録できない' do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'passwordに全角文字を含むと保存できない' do
      @user.password = "ああああああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが6文字以上でないと登録できない' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end


    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_nameが空では保存できない' do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが全角ではなければ保存できない' do
      @user.first_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end


    it 'last_nameが空では保存できない' do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end


    it 'last_nameが全角ではなければ保存できない' do
      @user.last_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
    end



    it 'first_katakana_nameが空では保存できない'do
      @user.first_katakana_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First katakana name can't be blank")
    end

    it'first_katakana_nameが全角カタカナではなければ保存できない' do
      @user.first_katakana_name = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First katakana name is invalid")
    end



    it 'last_katakana_nameが空では保存できない'do
      @user.last_katakana_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last katakana name can't be blank")
    end


    it 'last_katakana_nameが全角カタカナではなければ保存できない' do
      @user.last_katakana_name = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last katakana name is invalid")
    end


    it 'date_of_birthが空では保存できない' do
      @user.date_of_birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end
end

# require 'rails_helper'
#  RSpec.describe User, type: :model do
#    describe "ユーザー新規登録" do
#      it "nicknameが空だと登録できない" do
#        user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
#        user.valid?
#        expect(user.errors.full_messages).to include("Nickname can't be blank")
#      end
#      it "emailが空では登録できない" do
#        user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000")
#        user.valid?
#        expect(user.errors.full_messages).to include("Email can't be blank")
#      end
#    end
#  end

